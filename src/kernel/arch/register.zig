const std = @import("std");
const assert = std.debug.assert;

pub fn Register(comptime PackedT: type, readFn: *const fn () std.meta.Int(.unsigned, @bitSizeOf(PackedT)), writeFn: *const fn (v: std.meta.Int(.unsigned, @bitSizeOf(PackedT))) void) type {
    const size = @bitSizeOf(PackedT);
    if ((size % 8) != 0)
        @compileError("size must be divisible by 8!");

    if (!std.math.isPowerOfTwo(size / 8))
        @compileError("size must encode a power of two number of bytes!");

    const IntT = std.meta.Int(.unsigned, size);

    if (@sizeOf(PackedT) != (size / 8))
        @compileError(std.fmt.comptimePrint("IntT and PackedT must have the same size!, they are {} and {} bytes respectively", .{ size / 8, @sizeOf(PackedT) }));

    return extern struct {
        const Self = @This();
        pub const underlying_type = PackedT;

        pub inline fn read_raw(self: *const volatile Self) IntT {
            _ = self;
            return readFn();
        }

        pub inline fn read(self: *const volatile Self) PackedT {
            return @bitCast(self.read_raw());
        }

        /// write the full PackedT
        pub inline fn write(self: *volatile Self, val: PackedT) void {
            comptime {
                assert(@bitSizeOf(PackedT) == @bitSizeOf(IntT));
            }
            self.write_raw(@bitCast(val));
        }

        pub inline fn write_raw(self: *volatile Self, val: IntT) void {
            _ = self;
            writeFn(val);
        }

        /// modify/patch only the specific fileds based on the existing value
        pub inline fn modify(self: *volatile Self, fields: anytype) void {
            var val = read(self);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, field.name) = @field(fields, field.name);
            }
            self.write(val);
        }

        /// toggle the specific fields only
        pub inline fn toggle(self: *volatile Self, fields: anytype) void {
            var val = read(self);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, @tagName(field.default_value.?)) = !@field(val, @tagName(field.default_value.?));
            }
            self.write(val);
        }

        // extensions
        /// set only the specific fields, others are defaults typically zeros
        pub inline fn assign(self: *volatile Self, fields: anytype, default_value: IntT) void {
            var val: PackedT = @bitCast(default_value);
            inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                @field(val, field.name) = @field(fields, field.name);
            }
            self.write(val);
        }

        /// set a field only
        pub inline fn set_field(self: *volatile Self, comptime field_name: []const u8, value: anytype) void {
            var val = self.read();
            @field(val, field_name) = value;
            write(self, val);
        }

        pub inline fn get_field(self: *volatile Self, comptime field_name: []const u8) u1 {
            const val = self.read();
            return @field(val, field_name);
        }

        /// set a bit
        pub inline fn set_bit(self: *volatile Self, index: u5, value: u1) void {
            const val = self.read_raw();
            const mask: IntT = 1 << index;
            if (value == 1) {
                self.write_raw(val | mask);
            } else {
                self.write_raw(val & ~mask);
            }
        }
    };
}
