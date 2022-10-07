/*
 * Copyright 2017, Data61, CSIRO (ABN 41 687 119 230)
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */


    .data
    .globl boot_counter
boot_counter:
    .quad 0xdeadbeef

    .global _camkes_start
    .extern _camkes_start_c

    .text

_camkes_start:
    ldr     x19, =boot_counter
    mrs     x20, cntpct_el0
    str     x20, [x19]
     b  _camkes_start_c
