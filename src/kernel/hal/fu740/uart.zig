const boot = @import("../boot.zig");
const mmio = @import("../../soc/mmio.zig");

const DEFAULT_UART0_BASE: usize = 0x10010000;

const TxData = mmio.Mmio(packed struct(u32) {
    data: u8 = 0,
    res0: u23 = 0,
    full: u1 = 0,
});

var uart_base: usize = DEFAULT_UART0_BASE;

pub fn init() void {
    if (boot.dtbSummary()) |summary| {
        if (summary.uart) |uart| {
            if (uart.base != 0 and uart.reg_shift == 0 and uart.reg_io_width == 1) {
                uart_base = @intCast(uart.base);
            }
        }
    }
}

pub fn base() usize {
    return uart_base;
}

pub fn tx(ch: u8) void {
    const txdata: *volatile TxData = @ptrFromInt(uart_base);
    while (txdata.read().full != 0) {}
    txdata.modify(.{ .data = ch });
}
