const std = @import("std");
const Target = std.Target;
const Build = std.Build;

const verboseCC = false;
const verboseLink = false;

const Board = enum {
    unmached,
};

pub fn build(b: *Build) void {
    var kernel = b.step("kernel", "Build kernel");

    var board = b.option(Board, "board", "target board");
    if (board == null) {
        std.debug.print("No board is specified, use Unmatched as fallback\n", .{});
        board = .unmached;
    }

    var install_kernel = switch (board.?) {
        .unmached => build_kernel_unmached(b),
    };

    var objcopy = b.addSystemCommand(&[_][]const u8{
        "xpacks/.bin/riscv-none-elf-objcopy",
        "-O",
        "binary",
        "zig-out/bin/kernel.elf",
        "zig-out/bin/kernel.bin",
    });
    objcopy.step.dependOn(&install_kernel.step);

    // var objcopy = b.addObjCopy(.{ .path = "zig-out/bin/kernel.elf" }, .{ .format = .bin });
    var objdump = b.addSystemCommand(&[_][]const u8{
        "xpacks/.bin/riscv-none-elf-objdump",
    });
    objdump.addArgs(&[_][]const u8{
        "-h",
        "-d",
        "-S",
        "zig-out/bin/kernel.elf",
    });
    objdump.step.dependOn(&install_kernel.step);

    var download_kernel = b.addSystemCommand(&[_][]const u8{ "sfload", "-d", "/dev/ttyUSB1", "-f", "zig-out/bin/kernel.bin" });

    download_kernel.step.dependOn(&objcopy.step);

    kernel.dependOn(&objcopy.step);
    // kernel.dependOn(&download_kernel.step);
    // kernel.dependOn(&objdump.step);
}

fn build_kernel_unmached(b: *Build) *std.Build.Step.InstallArtifact {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .riscv64,
        .os_tag = .freestanding,
        .abi = .none,
        .cpu_model = .{
            .explicit = &Target.riscv.cpu.sifive_u74,
        },
    });
    const root_module = b.createModule(.{
        .root_source_file = b.path("src/kernel/main.zig"),
        .target = target,
        .optimize = .Debug,
        .code_model = .medium,
        .stack_protector = false,
        .sanitize_c = .off,
    });
    const exe = b.addExecutable(.{
        .name = "kernel.elf",
        .root_module = root_module,
    });
    exe.setLinkerScript(b.path("src/kernel/hal/fu740/linker.lds"));
    exe.root_module.addAssemblyFile(b.path("src/kernel/hal/fu740/start.S"));
    exe.root_module.omit_frame_pointer = false;
    exe.pie = false;
    exe.setVerboseCC(verboseCC);
    exe.setVerboseLink(verboseLink);
    var options = b.addOptions();
    options.addOption(Board, "board", Board.unmached);
    root_module.addOptions("build_options", options);

    return b.addInstallArtifact(exe, .{});
}
