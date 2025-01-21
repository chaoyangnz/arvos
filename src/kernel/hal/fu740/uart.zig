const peripherals = @import("../../soc/fu740.zig").devices.sifive_hifive_unmatched_a00.peripherals;

pub fn init() void {}

pub fn tx(ch: u8) void {
    while (peripherals.sifive_uart0_0.txdata.read().full != 0) {}
    peripherals.sifive_uart0_0.txdata.modify(.{ .data = ch });
}
