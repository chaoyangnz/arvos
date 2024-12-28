const std = @import("std");
const Target = std.Target;
const Zig = std.zig;
const FileSource = std.build.FileSource;
const Build = std.Build;
const FeatureSet = std.Target.Cpu.Feature.Set;

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

    var download_kernel = b.addSystemCommand(&[_][]const u8{ "xfel", "write", "0x40000000", "zig-out/bin/kernel.bin" });
    download_kernel.step.dependOn(&objcopy.step);

    kernel.dependOn(&objcopy.step);
    // kernel.dependOn(&download_kernel.step);
    // kernel.dependOn(&objdump.step);
}

fn build_kernel_unmached(b: *Build) *std.Build.Step.InstallArtifact {
    const query = Zig.CrossTarget{
        .cpu_arch = .riscv64,
        .os_tag = .freestanding,
        .abi = .none,
        .cpu_model = .{
            .explicit = &Target.riscv.cpu.sifive_u74,
        },
    };
    const target = b.resolveTargetQuery(query);

    const exe = b.addExecutable(.{
        .name = "kernel.elf",
        .root_source_file = .{ .cwd_relative = "src/kernel/main.zig" },
        .target = target,
        .optimize = .Debug,
        .code_model = .medium,
    });
    exe.setLinkerScriptPath(.{ .cwd_relative = "src/kernel/hal/fu740/linker.lds" });
    exe.addAssemblyFile(.{ .cwd_relative = "src/kernel/hal/fu740/start.S" });
    exe.root_module.omit_frame_pointer = false;
    exe.root_module.stack_protector = false;
    exe.pie = false;
    exe.setVerboseCC(verboseCC);
    exe.setVerboseLink(verboseLink);
    var options = b.addOptions();
    options.addOption(Board, "board", Board.unmached);
    exe.root_module.addOptions("build_options", options);
    return b.addInstallArtifact(exe, .{});
}
