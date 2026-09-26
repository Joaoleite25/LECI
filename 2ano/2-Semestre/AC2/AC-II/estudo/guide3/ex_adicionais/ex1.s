    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ PORTE, 0x6110
    .equ LATE, 0x6120
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATB, 0x6060


    .data
    .text
    .globl main

main:
    lui $t0, ADDR_BASE_HI

    lw $t1, TRISB($t0)
    ori $t1, $t1, 0x000F           # 0000 0000 0000 1111
    sw $t1, TRISB($t0)

    lw $t1, TRISE($t0)
    andi $t1, $t1, 0xFFC3          # 1111 1111 1100 0011
    sw $t1, TRISE($t0)

loop:   
    lw $t1, PORTB($t0)
    andi $t1, $t1, 0x000F  
    sll $t2, $t1, 2

    lw $t3, LATE($t0)
    andi $t3, $t3, 0xFFC3
    or $t3, $t3, $t2  
    xori $t3, $t3, 0x003E                         
    sw $t3, LATE($t0)

    j loop

    jr $ra