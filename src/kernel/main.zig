const std = @import("std");
const sys = @import("./hal/sys.zig");
const console = @import("./hal/console.zig");
const mem = @import("./hal/mem.zig");
const rv = @import("./arch/riscv64.zig");

export fn main() void {
    sys.init();

    console.println(" +-+-+-+-+-+\n |a|r|v|o|s|\n +-+-+-+-+-+", .{});

    mem.run_test();

    const mstatus = rv.mstatus.read();
    console.println("mstatus: {}", .{mstatus});

    const mhartid = rv.mhartid.read();
    console.println("mhardid: {}", .{mhartid});
}
