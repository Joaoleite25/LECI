
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
    andi $t2, $t2, 0xFFF0
    sw $t2, TRISE($t1)

    lw $t2, TRISB($t1)
    ori $t2, $t2, 0x000F
    sw $t2, TRISB($t1)

loop:
    lw $t2, PORTB($t1)
    andi $t2, $t2, 0x000F

    lw $t3, LATE($t1)
    ori $t2, $t2, 0xFFF0
    sw $t2, LATE($t1)

    j loop

    jr $ra


