    .data 
    .text 
    .equ getchar, 2
    .equ putchar, 3
    .equ printint, 6

    .globl main 

main:
    li $t0, 0

do:
    li $v0, getchar 
    syscall
    move $t1, $v0

    addi $t2, $t1, 1

    move $a0, $t2
    li $v0, putchar
    syscall

    addi $t0, $t0, 1

    bne $t1, '\n', do

    li $v0, printint
    move $a0, $t0
    li $a1, 10
    syscall

    li $v0, 0
    jr $ra
