
    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ TRISD, 0x60C0
    .equ PORTD, 0x60D0
    .equ LATE, 0x6120

    .data
    .text
    .globl main

main:
    lui $t1, ADDR_BASE_HI
    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFFFE
    sw $t2, TRISE($t1)

    lw $t2, TRISD($t1)
    ori $t2, $t2, 0x0100
    sw $t2, TRISD($t1)

while:
    lw $t3, PORTD($t1)
    andi $t3, $t3, 0x0100
    srl $t3, $t3, 8
    
    lw $t4, LATE($t1)
    ori $t3, $t3, 0xFFFE
    sw $t3, LATE($t1)

    j while

    jr $ra
