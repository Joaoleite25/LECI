    .data

    .text
    .globl main

main:
    li $t0, 0

while1:  
    li $v0, 3
    li $a0, '\r'
    syscall

    li $v0, 6
    move $a0, $t0
    li $a1, 0x0004000A
    syscall

    li $v0, 12
    syscall

while2:
    li $v0, 11
    syscall
    
    bge $v0, 200000, endw
    addi $t0, $t0, 1
    j while2

endw:
    j while1

    li $v0, 0
    jr $ra