const std = @import("std");
const boot = @import("./hal/boot.zig");
const sys = @import("./hal/sys.zig");
const console = @import("./hal/console.zig");
const mem = @import("./hal/mem.zig");
const rv = @import("./arch/riscv64.zig");

export fn main(hart_id: usize, dtb_pa: usize) void {
    boot.setBootContext(hart_id, dtb_pa);

    sys.init();

    console.println("boot: hart={} dtb=0x{x}", .{ boot.hartId(), boot.dtbPa() });
    if (boot.dtbMagic()) |magic| {
        console.println("boot: dtb magic=0x{x}", .{magic});
    } else {
        console.println("boot: dtb magic=none", .{});
    }

    console.println(" +-+-+-+-+-+\n |a|r|v|o|s|\n +-+-+-+-+-+", .{});

    mem.run_test();

    const mstatus = rv.mstatus.read();
    console.println("mstatus: {}", .{mstatus});

    const mhartid = rv.mhartid.read();
    console.println("mhardid: {}", .{mhartid});
}
