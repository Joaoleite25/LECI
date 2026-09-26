
    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATE, 0x6120

    .data

    .text
    .globl main

main:
    lui $t1, ADDR_BASE_HI
    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFF00
    sw $t2, TRISE($t1)

    lw $t2, TRISB($t1)
    ori $t2, $t2, 0x000F
    sw $t2, TRISB($t1)

loop:
    lw $t2, PORTB($t1)
    andi $t2, $t2, 0x000F

    move $t3, $t2

    sll $t4, $t2, 1     # RB3 -> RE4
    sll $t5, $t2, 3     # RB2 -> RE5
    andi $t4, $t4, 0x0010
    andi $t5, $t5, 0x0020

    sll $t6, $t2, 5     # RB1 -> RE6
    sll $t7, $t2, 7     # RB0 -> RE7
    andi $t6, $t6, 0x0040
    andi $t7, $t7, 0x0080

    or $t3, $t3, $t4
    or $t3, $t3, $t5
    or $t3, $t3, $t6
    or $t3, $t3, $t7

    sw $t3, LATE($t1)

    j loop

    jr $ra


