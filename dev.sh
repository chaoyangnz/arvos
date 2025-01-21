#!/usr/bin/env bash

zig build kernel

xpacks/.bin/riscv-none-elf-objdump -h -d -S zig-out/bin/kernel.elf > zig-out/bin/kernel.objdump

sfload -d /dev/ttyUSB1 -f zig-out/bin/kernel.bin