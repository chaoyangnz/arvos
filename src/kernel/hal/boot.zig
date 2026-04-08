const std = @import("std");

const Context = struct {
    hart_id: usize = 0,
    dtb_pa: usize = 0,
};

var context = Context{};

pub fn setBootContext(hart_id: usize, dtb_pa: usize) void {
    context = .{
        .hart_id = hart_id,
        .dtb_pa = dtb_pa,
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
