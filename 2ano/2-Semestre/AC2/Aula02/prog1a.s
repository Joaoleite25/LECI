    .data 
    .text 
    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .equ putchar, 3
    .equ printint, 6

    .globl main 

main:
    li $t0, 0

while:
    li $a0, '\r'
    li $v0, putchar
    syscall

    li $t1, 10
    ori $t1, $t1, 4
    sll $t1, $t1, 16

    move $a0, $t0
    move $a1, $t1
    li $v0, printint
    syscall

    li $v0, resetCoreTimer
    syscall

    li $v0, readCoreTimer
    syscall

    move $t2, $v0
    blt $t2, 200000, while
    addi $t0, $t0, 1

    li $v0, 0
    jr $ra
