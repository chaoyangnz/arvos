const std = @import("std");
const boot = @import("./hal/boot.zig");
const dtb = @import("./hal/dtb.zig");
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

    if (boot.dtbPa() != 0) {
        if (boot.dtbSummary()) |s| {
            console.println("dtb: model={s}", .{s.model});
            console.println("dtb: compatible={s}", .{s.compatible});
            console.println("dtb: cpus={} boot_cpu={}", .{ s.cpus, s.boot_cpuid_phys });
            console.println("dtb: memory@0x{x} size=0x{x}", .{ s.memory.base, s.memory.size });
            if (s.uart) |uart| {
                console.println(
                    "dtb: uart={s} base=0x{x} irq={} shift={} width={}",
                    .{ uart.compatible, uart.base, uart.interrupt_id orelse 0, uart.reg_shift, uart.reg_io_width },
                );
            }
        } else {
            const err = dtb.parseSummary(boot.dtbPa()) catch |parse_err| parse_err;
            console.println("dtb: parse failed: {!}", .{err});
        }
    }

    console.println(" +-+-+-+-+-+\n |a|r|v|o|s|\n +-+-+-+-+-+", .{});

    mem.run_test();

    const mstatus = rv.mstatus.read();
    console.println("mstatus: {}", .{mstatus});

    const mhartid = rv.mhartid.read();
    console.println("mhardid: {}", .{mhartid});
}
