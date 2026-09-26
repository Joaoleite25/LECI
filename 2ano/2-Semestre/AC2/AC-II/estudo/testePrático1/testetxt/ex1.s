    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ TRISE, 0x6100
    .equ LATE, 0x6120


    .data
    .text
    .globl main

main:
    lui $t1, ADDR_BASE_HI

    lw $t2, TRISB($t1)
    ori $t2, $t2, 0x000F
    sw $t2, TRISB($t1)

    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFF7F
    sw $t2, TRISE($t1)

    lw $t3, LATE($t1)
    andi $t3, $t3, 0xFF7F
    ori $t3, $t3, 0x0080
    sw $t3, LATE($t1) 

loop:
    lw $t2, PORTB($t1)
    andi $t2, $t2, 0x000F

    li $v0, 6
    move $a0, $t2
    li $a1, 16
    syscall     

    li $v0, 3
    li $a0, ' '
    syscall  

    lw $t3, LATE($t1)
    xori $t3, $t3, 0x0080
    sw $t3, LATE($t1)

    li $a0, 125
    jal delay

    j loop

    jr $ra      

#=============================================================================
# Mapa de registos:
# $a0 : ms

delay:   
    li $v0, 12
    syscall
while:
    li $v0, 11
    syscall
    li $t0, 20000
    mul $t0, $t0, $a0
    bge $v0, $t0, endw
    j while
endw:
    jr $ra    




     