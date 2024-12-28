# ARVOS

A xv6 port on [HiFive Unmatched Rev B](https://www.sifive.com/boards/hifive-unmatched-revb) using Zig.

# Development

## Prerequisite

- board: `HiFive Unmatched Rev B`
- host OS: `Ubuntu`
- USB-UART driver: `sudo apt install libusb-1.0-0-dev`
- packages: 
    - Zig: `snap install zig --classic --edge`
    - toolchain: `bun install xpm & xpm i` 
    - (optional): `sudo apt-get install -y gcc-riscv64-linux-gnu`

## Validation

- `lsusb`

Bus 001 Device 004: ID 0403:6001 Future Technology Devices International, Ltd FT232 Serial (UART) IC

`sudo adduser <user> dialout`

## Build (test bare metal)

```
./dev
```

The above will load the binary to DRAM 0x40000000 and run.

You should be able to see UART output at the end.
