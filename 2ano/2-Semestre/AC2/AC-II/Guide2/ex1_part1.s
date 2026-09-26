# Mapa de registos:
# counter: $t0

    .data
    
    .text
    .globl main

main:

    li $t0, 0  

while1:
    li $a0, '\r'
    li $v0, 3
    syscall
    
    li $t1, 4
    sll $t1, $t1, 16 
    ori $t1, $t1, 10

    move $a0, $t0
    move $a1, $t1
    li $v0, 6
    syscall

    li $v0, 12
    syscall

while2:
    li $v0, 11
    syscall

    bge $v0, 20000000, endw

    addi $t0, $t0, 1

    j while2

endw:
    j while1
    li $v0, 0
    jr $ra
