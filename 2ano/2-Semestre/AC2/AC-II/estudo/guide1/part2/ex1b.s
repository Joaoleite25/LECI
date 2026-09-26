    
    .data

    .text
    .globl main

main:   
    li $t0, 0

do: li $v0, 1
    syscall
    move $t1, $v0

if: beq $t1, 0, else

    li $v0, 3
    move $a0, $t1
    syscall

    j while

else:   
    li $v0, 3
    li $a0, '.'
    syscall

while:  
    addi $t0, $t0, 1

    beq $t1, '\n', enddo
    j do

enddo:
    li $v0, 6
    move $a0, $t0
    li $a1, 10
    syscall

    li $v0, 0
    jr $ra