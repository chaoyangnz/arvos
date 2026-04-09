const std = @import("std");
const dtb = @import("./dtb.zig");

const Context = struct {
    hart_id: usize = 0,
    dtb_pa: usize = 0,
    dtb_summary: ?dtb.Summary = null,
};

var context = Context{};

pub fn setBootContext(hart_id: usize, dtb_pa: usize) void {
    const summary = if (dtb_pa != 0) dtb.parseSummary(dtb_pa) catch null else null;

    context = .{
        .hart_id = hart_id,
        .dtb_pa = dtb_pa,
        .dtb_summary = summary,
    };
}

pub fn hartId() usize {
    return context.hart_id;
}

pub fn dtbPa() usize {
    return context.dtb_pa;
}

pub fn dtbMagic() ?u32 {
    if (context.dtb_pa == 0) return null;

    const ptr: *const volatile u32 = @ptrFromInt(context.dtb_pa);
    return std.mem.bigToNative(u32, ptr.*);
}

pub fn dtbSummary() ?dtb.Summary {
    return context.dtb_summary;
}
