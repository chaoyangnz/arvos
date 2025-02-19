const std = @import("std");

fn default_tx(c: u8) void {
    _ = c;
}

var tx: *allowzero const fn (c: u8) void = default_tx;

pub fn init(tx_fn: @TypeOf(tx)) void {
    tx = tx_fn;
}

inline fn decToHex(c: u8) u8 {
    return if (c < 10) c + 48 else c + 55;
}

/// print an ascii char, transform if non-printable
/// if hope to output the original only, use uart.tx(..) instead
pub fn putc(c: u8) void {
    // for non-printable chars
    if ((c < 0x20 and c != 0x0A and c != 0x0D) or c >= 0x7F) {
        tx('\\');
        tx('x');
        tx(decToHex(c / 16));
        tx(decToHex(c % 16));
    } else {
        tx(c);
    }
}

/// print a slice of bytes
pub fn puts(str: []const u8) void {
    // if using for (str) |c| {}, it will causes incorrect putc when hard reset,
    // but print correctly when debugging. not sure why
    // for (0..str.len) |i| {
    //     putc(str[i]);
    // }
    for (str) |c| {
        putc(c);
    }
}

// https://github.com/ringtailsoftware/zig-minirv32/blob/master/samples/shell/src/term.zig#L37
// Implement a std.io.Writer backed by uart_write()
const ConsoleWriter = struct {
    const Writer = std.io.Writer(
        *ConsoleWriter,
        error{},
        write,
    );

    fn write(
        self: *ConsoleWriter,
        data: []const u8,
    ) error{}!usize {
        _ = self;
        puts(data);
        return data.len;
    }

    pub fn writer(self: *ConsoleWriter) Writer {
        return .{ .context = self };
    }
};

var console_writer = ConsoleWriter{};

/// print a formated string
pub fn printf(comptime format: []const u8, args: anytype) void {
    std.fmt.format(console_writer.writer(), format, args) catch unreachable;
}

pub fn println(comptime format: []const u8, args: anytype) void {
    printf(format ++ "\n", args);
}
