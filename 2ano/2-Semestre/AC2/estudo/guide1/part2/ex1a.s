
    .data

    .text
    .globl main

main:   
    li $t0, 0

do: li $v0, 2
    syscall
    move $t1, $v0

    li $v0, 3
    move $a0, $t1
    syscall

    addi $t0, $t0, 1

    beq $t1, '\n', endo

    j do

endo:
    li $v0, 6
    move $a0, $t0
    li $a1, 10
    syscall

    li $v0, 0
    jr $ra