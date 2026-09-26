
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

    srl $t3, $t2, 3         # RB3 -> RE0
    srl $t4, $t2, 1         # RB2 -> RE1
    andi $t4, $t4, 0x0002
    andi $t3, $t3, 0x0001

    sll $t5, $t2, 3         # RB0 -> RE3
    sll $t6, $t2, 1         # RB1 -> RE2
    andi $t5, $t5, 0x0008
    andi $t6, $t6, 0x0004

    or   $t2, $t3, $t4          
    or   $t2, $t2, $t5          
    or   $t2, $t2, $t6          

    sw $t2, LATE($t1)

    j loop

    jr $ra


