    .data 
    .text 
    .equ inkey, 1
    .equ putchar, 3
    .equ printint, 6

    .globl main 

main:
    li $t0, 0

do:
    li $v0, inkey 
    syscall
    move $t1, $v0

if:
    beq $t1, 0, else

    move $a0, $t1
    li $v0, putchar
    syscall

    j end

else:
    li $a0, '.'
    li $v0, putchar
    syscall

end:
    addi $t0, $t0, 1

    bne $t1, '\n', do

    li $v0, printint
    move $a0, $t0
    li $a1, 10
    syscall

    li $v0, 0
    jr $ra
