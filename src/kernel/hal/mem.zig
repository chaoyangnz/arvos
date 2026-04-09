const println = @import("./console.zig").println;
const boot = @import("./boot.zig");

var sdata_var: u8 = 1;
var bss_var: u8 = undefined;

const _ro_start = @extern([*]u8, .{ .name = "_ro_start" });
const _ro_end = @extern([*]u8, .{ .name = "_ro_end" });
const _data_loadaddr = @extern([*]u8, .{ .name = "_data_loadaddr" });
const _data_start = @extern([*]u8, .{ .name = "_data_start" });
const _data_end = @extern([*]u8, .{ .name = "_data_end" });
const _bss_start = @extern([*]u8, .{ .name = "_bss_start" });
const _bss_end = @extern([*]u8, .{ .name = "_bss_end" });
const _heap_start = @extern([*]u8, .{ .name = "_heap_start" });
const _heap_end = @extern([*]u8, .{ .name = "_heap_end" });
const _stack_start = @extern([*]u8, .{ .name = "_stack_start" });
const _stack_end = @extern([*]u8, .{ .name = "_stack_end" });
const _stack_top = @extern([*]u8, .{ .name = "_stack_top" });

pub fn init() void {
    zeroBss();
    copyDataIfNeeded();
}

/// run memtest to check if the sections are put in the expected location and
/// also test variables: global data, uninitialised, and local
/// This one can be called after console is initialised
pub fn run_test() void {
    println("------memory test-----", .{});

    if (boot.dtbSummary()) |summary| {
        const dram_end = summary.memory.base + summary.memory.size;
        const heap_end = @intFromPtr(_heap_end);
        println("dtb dram: 0x{x} ~ 0x{x}", .{ summary.memory.base, dram_end });
        println("heap within dtb dram: {}", .{heap_end <= dram_end});
    }

    println("text+rodata: {*} ~ {*}", .{ _ro_start, _ro_end });
    println("data: {*} ~ {*} loadaddr: {*}", .{ _data_start, _data_end, _data_loadaddr });
    println("bss: {*} ~ {*}", .{ _bss_start, _bss_end });
    println("heap: {*} ~ {*}", .{ _heap_start, _heap_end });
    println("stack: {*} ~ {*} at {*}", .{ _stack_start, _stack_end, _stack_top });

    var local_var: u8 = 1;
    bss_var = local_var;

    println("variables in sdata: {*} bss: {*} stack local: {*}", .{ &sdata_var, &bss_var, &local_var });

    println("------memory test-----", .{});
}

fn zeroBss() void {
    const bss_len = @intFromPtr(_bss_end) - @intFromPtr(_bss_start);
    for (0..bss_len) |i| {
        _bss_start[i] = 0;
    }
}

fn copyDataIfNeeded() void {
    if (@intFromPtr(_data_loadaddr) == @intFromPtr(_data_start)) return;

    const data_len = @intFromPtr(_data_end) - @intFromPtr(_data_start);
    for (0..data_len) |i| {
        _data_start[i] = _data_loadaddr[i];
    }
}

export const stack0 align(16) = [_]u8{0} ** (4096 * 4);
