# u-boot

## riscv toolchain
https://toolchains.bootlin.com/releases_riscv64-lp64d.html

## build opensbi

```
cd tools/opensbi
PATH=$PATH:/opt/riscv/bin CROSS_COMPILE=riscv64-linux- make PLATFORM=generic
```

cp tools/opensbi/build/platform/generic/firmware/fw_dynamic.bin tools/

## build u-boot spl
https://docs.u-boot.org/en/stable/build/gcc.html

// this is the custom build of unmatched u-boot-spl with CONFIG_SPL_YMODEM_SUPPORT=y

```
sudo apt-get install bc bison build-essential coccinelle \
  device-tree-compiler dfu-util efitools flex gdisk graphviz imagemagick \
  liblz4-tool libgnutls28-dev libguestfs-tools libncurses-dev \
  libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
  pkg-config python3 python3-asteval python3-coverage python3-filelock \
  python3-pkg-resources python3-pycryptodome python3-pyelftools \
  python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
  python3-sphinx-rtd-theme python3-subunit python3-testtools \
  python3-virtualenv swig uuid-dev
cd tools/u-boot
make sifive_unmatched_defconfig
PATH=$PATH:/opt/riscv/bin CROSS_COMPILE=riscv64-linux- OPENSBI=../opensbi/build/platform/generic/firmware/fw_dynamic.bin make
```

`cp tools/u-boot/spl/u-boot-spl.bin tools/sfflash/u-boot-spl-uart-ymodem.bin`

## flash u-boot spl to sd card

```
sudo sgdisk -g --clear -a 1 --new=1:34:2081 --change-name=1:spl --typecode=1:5B193300-FC78-40CD-8002-E86C45580B47 /dev/sdX
sudo dd if=spl/u-boot-spl.bin of=/dev/sdX seek=34
```

## load kernel

```
sfload -d /dev/ttyUSB1 -f zig-out/bin/kernel.bin
```