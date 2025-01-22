.align 2

.section .text
.globl _start

_start:
    # uart output a @ per hart to indicate it is working
    li	a5, 0x10010000
    li	a4, '@'
    sw	a4,0(a5)
    # only run on hart1
    csrr  t0, mhartid
    li    t1, 2
    bne   t0, t1, _halt

_main:
    la    sp, _stack_top
    jal   main

_halt: j _halt
