const std = @import("std");

pub const FdtError = error{
    BadMagic,
    Truncated,
    BadStructure,
    MissingMemory,
};

const FDT_MAGIC: u32 = 0xd00dfeed;
const FDT_BEGIN_NODE: u32 = 0x1;
const FDT_END_NODE: u32 = 0x2;
const FDT_PROP: u32 = 0x3;
const FDT_NOP: u32 = 0x4;
const FDT_END: u32 = 0x9;

pub const Header = extern struct {
    magic_be: u32,
    totalsize_be: u32,
    off_dt_struct_be: u32,
    off_dt_strings_be: u32,
    off_mem_rsvmap_be: u32,
    version_be: u32,
    last_comp_version_be: u32,
    boot_cpuid_phys_be: u32,
    size_dt_strings_be: u32,
    size_dt_struct_be: u32,
};

pub const MemoryRegion = struct {
    base: u64 = 0,
    size: u64 = 0,
};

pub const Uart = struct {
    base: u64,
    size: u64 = 0,
    reg_shift: u8 = 0,
    reg_io_width: u8 = 1,
    interrupt_id: ?u32 = null,
    compatible: []const u8 = "",
};

pub const Summary = struct {
    model: []const u8 = "",
    compatible: []const u8 = "",
    boot_cpuid_phys: u32 = 0,
    address_cells: u32 = 2,
    size_cells: u32 = 1,
    cpus: usize = 0,
    memory: MemoryRegion = .{},
    uart: ?Uart = null,
};

pub fn parseSummary(dtb_pa: usize) FdtError!Summary {
    const header = @as(*align(1) const Header, @ptrFromInt(dtb_pa));
    if (be32(header.magic_be) != FDT_MAGIC) return error.BadMagic;

    const total_size = be32(header.totalsize_be);
    if (total_size < @sizeOf(Header)) return error.Truncated;

    const blob = @as([*]align(1) const u8, @ptrFromInt(dtb_pa))[0..total_size];
    const struct_block = subSlice(blob, be32(header.off_dt_struct_be), be32(header.size_dt_struct_be)) orelse return error.Truncated;
    const strings_block = subSlice(blob, be32(header.off_dt_strings_be), be32(header.size_dt_strings_be)) orelse return error.Truncated;

    var parser = Parser{
        .blob = blob,
        .struct_block = struct_block,
        .strings_block = strings_block,
        .summary = .{
            .boot_cpuid_phys = be32(header.boot_cpuid_phys_be),
        },
    };

    try parser.walk();
    if (parser.summary.memory.size == 0) return error.MissingMemory;
    return parser.summary;
}

const Parser = struct {
    blob: []const u8,
    struct_block: []const u8,
    strings_block: []const u8,
    cursor: usize = 0,
    depth: usize = 0,
    summary: Summary,
    path_stack: [16][]const u8 = [_][]const u8{""} ** 16,
    address_cells_stack: [16]u32 = [_]u32{2} ** 16,
    size_cells_stack: [16]u32 = [_]u32{1} ** 16,
    current_uart_compatible: []const u8 = "",

    fn walk(self: *Parser) FdtError!void {
        while (true) {
            const token = try self.readBe32();
            switch (token) {
                FDT_BEGIN_NODE => try self.beginNode(),
                FDT_END_NODE => self.endNode(),
                FDT_PROP => try self.property(),
                FDT_NOP => {},
                FDT_END => return,
                else => return error.BadStructure,
            }
        }
    }

    fn beginNode(self: *Parser) FdtError!void {
        const name = try self.readCString();
        self.alignCursor();

        if (self.depth >= self.path_stack.len) return error.BadStructure;
        self.path_stack[self.depth] = name;
        if (self.depth == 0) {
            self.address_cells_stack[0] = self.summary.address_cells;
            self.size_cells_stack[0] = self.summary.size_cells;
        } else {
            self.address_cells_stack[self.depth] = self.address_cells_stack[self.depth - 1];
            self.size_cells_stack[self.depth] = self.size_cells_stack[self.depth - 1];
        }
        self.depth += 1;
    }

    fn endNode(self: *Parser) void {
        if (self.depth == 0) return;

        const node_index = self.depth - 1;
        if (self.isUartNode(node_index) and self.summary.uart == null and self.current_uart_compatible.len != 0) {
            self.current_uart_compatible = "";
        }
        self.depth -= 1;
    }

    fn property(self: *Parser) FdtError!void {
        const len = try self.readBe32();
        const nameoff = try self.readBe32();
        const value = self.readBytes(len) orelse return error.Truncated;
        self.alignCursor();

        const prop_name = self.lookupString(nameoff) orelse return error.BadStructure;

        if (self.depth == 1 and self.nodeName(0).len == 0) {
            if (std.mem.eql(u8, prop_name, "#address-cells")) {
                if (value.len >= 4) {
                    self.summary.address_cells = be32FromSlice(value[0..4]);
                    self.address_cells_stack[0] = self.summary.address_cells;
                }
            } else if (std.mem.eql(u8, prop_name, "#size-cells")) {
                if (value.len >= 4) {
                    self.summary.size_cells = be32FromSlice(value[0..4]);
                    self.size_cells_stack[0] = self.summary.size_cells;
                }
            } else if (std.mem.eql(u8, prop_name, "model")) {
                self.summary.model = trimString(value);
            } else if (std.mem.eql(u8, prop_name, "compatible")) {
                self.summary.compatible = firstString(value);
            }
        }

        const node_index = self.depth - 1;
        if (std.mem.eql(u8, prop_name, "#address-cells") and value.len >= 4) {
            self.address_cells_stack[node_index] = be32FromSlice(value[0..4]);
        } else if (std.mem.eql(u8, prop_name, "#size-cells") and value.len >= 4) {
            self.size_cells_stack[node_index] = be32FromSlice(value[0..4]);
        }

        if (self.pathStartsWith(&.{ "cpus", "cpu@" }) and std.mem.eql(u8, prop_name, "device_type")) {
            if (std.mem.eql(u8, trimString(value), "cpu")) self.summary.cpus += 1;
        }

        if (self.pathStartsWith(&.{ "memory@" }) and std.mem.eql(u8, prop_name, "reg")) {
            self.summary.memory = parseReg(value, self.parentAddressCells(), self.parentSizeCells()) catch self.summary.memory;
        }

        if (std.mem.eql(u8, prop_name, "compatible")) {
            if (self.isUartNode(node_index)) {
                self.current_uart_compatible = pickCompatible(value);
            }
        }

        if (self.isUartNode(node_index)) {
            if (std.mem.eql(u8, prop_name, "reg")) {
                const region = parseReg(value, self.parentAddressCells(), self.parentSizeCells()) catch return;
                self.summary.uart = .{
                    .base = region.base,
                    .size = region.size,
                    .compatible = self.current_uart_compatible,
                };
            } else if (std.mem.eql(u8, prop_name, "reg-shift") and value.len >= 4) {
                const uart = self.ensureUart();
                uart.reg_shift = @truncate(be32FromSlice(value[0..4]));
            } else if (std.mem.eql(u8, prop_name, "reg-io-width") and value.len >= 4) {
                const uart = self.ensureUart();
                uart.reg_io_width = @truncate(be32FromSlice(value[0..4]));
            } else if (std.mem.eql(u8, prop_name, "interrupts") and value.len >= 4) {
                const uart = self.ensureUart();
                uart.interrupt_id = be32FromSlice(value[0..4]);
            }
        }
    }

    fn readBe32(self: *Parser) FdtError!u32 {
        const bytes = self.readBytes(4) orelse return error.Truncated;
        return be32FromSlice(bytes);
    }

    fn readBytes(self: *Parser, len: usize) ?[]const u8 {
        if (self.cursor + len > self.struct_block.len) return null;
        const bytes = self.struct_block[self.cursor .. self.cursor + len];
        self.cursor += len;
        return bytes;
    }

    fn readCString(self: *Parser) FdtError![]const u8 {
        var end = self.cursor;
        while (end < self.struct_block.len and self.struct_block[end] != 0) : (end += 1) {}
        if (end >= self.struct_block.len) return error.Truncated;
        const slice = self.struct_block[self.cursor..end];
        self.cursor = end + 1;
        return slice;
    }

    fn alignCursor(self: *Parser) void {
        self.cursor = std.mem.alignForward(usize, self.cursor, 4);
    }

    fn lookupString(self: *Parser, offset: u32) ?[]const u8 {
        if (offset >= self.strings_block.len) return null;
        var end: usize = offset;
        while (end < self.strings_block.len and self.strings_block[end] != 0) : (end += 1) {}
        if (end >= self.strings_block.len) return null;
        return self.strings_block[offset..end];
    }

    fn nodeName(self: *Parser, depth_index: usize) []const u8 {
        return self.path_stack[depth_index];
    }

    fn ensureUart(self: *Parser) *Uart {
        if (self.summary.uart == null) {
            self.summary.uart = .{ .base = 0 };
        }
        return &self.summary.uart.?;
    }

    fn isUartNode(self: *Parser, node_index: usize) bool {
        if (node_index + 1 != self.depth) return false;
        const node_name = self.path_stack[node_index];
        return std.mem.startsWith(u8, node_name, "serial@") or std.mem.startsWith(u8, node_name, "uart@");
    }

    fn parentAddressCells(self: *Parser) u32 {
        if (self.depth <= 1) return self.summary.address_cells;
        return self.address_cells_stack[self.depth - 2];
    }

    fn parentSizeCells(self: *Parser) u32 {
        if (self.depth <= 1) return self.summary.size_cells;
        return self.size_cells_stack[self.depth - 2];
    }

    fn pathStartsWith(self: *Parser, comptime parts: []const []const u8) bool {
        if (self.depth < parts.len + 1) return false;
        inline for (parts, 0..) |part, index| {
            if (!pathPartMatches(self.path_stack[index + 1], part)) return false;
        }
        return true;
    }
};

fn pathPartMatches(actual: []const u8, wanted: []const u8) bool {
    if (std.mem.endsWith(u8, wanted, "@")) {
        return std.mem.startsWith(u8, actual, wanted);
    }
    return std.mem.eql(u8, actual, wanted);
}

fn parseReg(bytes: []const u8, address_cells: u32, size_cells: u32) FdtError!MemoryRegion {
    const addr_len = @as(usize, address_cells) * 4;
    const size_len = @as(usize, size_cells) * 4;
    const total = addr_len + size_len;
    if (total == 0 or bytes.len < total) return error.BadStructure;

    return .{
        .base = beCells(bytes[0..addr_len]),
        .size = beCells(bytes[addr_len .. addr_len + size_len]),
    };
}

fn beCells(bytes: []const u8) u64 {
    var value: u64 = 0;
    var i: usize = 0;
    while (i + 4 <= bytes.len) : (i += 4) {
        value = (value << 32) | be32FromSlice(bytes[i .. i + 4]);
    }
    return value;
}

fn trimString(bytes: []const u8) []const u8 {
    const nul = std.mem.indexOfScalar(u8, bytes, 0) orelse bytes.len;
    return bytes[0..nul];
}

fn firstString(bytes: []const u8) []const u8 {
    return trimString(bytes);
}

fn pickCompatible(bytes: []const u8) []const u8 {
    var start: usize = 0;
    while (start < bytes.len) {
        const end = start + (std.mem.indexOfScalar(u8, bytes[start..], 0) orelse bytes.len - start);
        const entry = bytes[start..end];
        if (std.mem.eql(u8, entry, "ns16550a") or
            std.mem.eql(u8, entry, "sifive,uart0") or
            std.mem.eql(u8, entry, "snps,dw-apb-uart"))
        {
            return entry;
        }
        start = end + 1;
    }
    return firstString(bytes);
}

fn subSlice(blob: []const u8, start: u32, len: u32) ?[]const u8 {
    const s: usize = start;
    const l: usize = len;
    if (s > blob.len or l > blob.len - s) return null;
    return blob[s .. s + l];
}

fn be32(value: u32) u32 {
    return @byteSwap(value);
}

fn be32FromSlice(bytes: []const u8) u32 {
    return std.mem.readInt(u32, bytes[0..4], .big);
}
