#!/usr/bin/env bash

TTY="${TTY:-/dev/cu.usbserial-31401}"

zig build kernel

xpacks/.bin/riscv-none-elf-objdump -h -d -S zig-out/bin/kernel.elf > zig-out/bin/kernel.objdump

tools/uload/uload -d "$TTY" -f zig-out/bin/kernel.bin
