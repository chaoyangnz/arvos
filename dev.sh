#!/usr/bin/env bash
set -euo pipefail

TTY="${TTY:-/dev/cu.usbserial-31401}"
RESET_WITH_OPENOCD="${RESET_WITH_OPENOCD:-0}"
OPENOCD_SUDO="${OPENOCD_SUDO:-sudo}"
SERIAL_WAIT_SECONDS="${SERIAL_WAIT_SECONDS:-15}"

detect_ftdi_tty() {
  local matches=()

  shopt -s nullglob
  matches=(/dev/cu.usbserial-*)
  shopt -u nullglob

  if [[ ${#matches[@]} -eq 0 ]]; then
    return 1
  fi

  printf '%s\n' "${matches[-1]}"
}

zig build kernel

xpacks/.bin/riscv-none-elf-objdump -h -d -S zig-out/bin/kernel.elf > zig-out/bin/kernel.objdump

if [[ "$RESET_WITH_OPENOCD" == "1" ]]; then
  "$OPENOCD_SUDO" bash ./tools/openocd.sh reset-halt

  deadline=$((SECONDS + SERIAL_WAIT_SECONDS))
  while [[ ! -e "$TTY" ]]; do
    if detected_tty="$(detect_ftdi_tty)"; then
      TTY="$detected_tty"
      break
    fi
    if (( SECONDS >= deadline )); then
      echo "Timed out waiting for serial device: $TTY" >&2
      exit 1
    fi
    sleep 1
  done
fi

tools/uartload/uartload -d "$TTY" -f zig-out/bin/kernel.bin
