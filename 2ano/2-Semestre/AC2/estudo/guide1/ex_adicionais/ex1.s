# Mapa de registos:
# $t0 : state
# $t1 : cnt

    .data

    .equ UP, 1
    .equ DOWN, 0

    .text
    .globl main

main:
    li $t0, 0
    li $t1, 0

do: li $v0, 3
    li $a0, '\r'
    syscall

    li $t2, 3
    sll $t2, $t2, 16
    ori $t2, $t2, 10

    li $v0, 6
    move $a0, $t1
    move $a1, $t2
    syscall

    li $v0, 3
    li $a0, '\t'
    syscall

    li $t2,8
    sll $t2, $t2, 16
    ori $t2, $t2, 2

    li $v0, 6
    move $a0, $t1
    move $a1, $t2
    syscall

    li $a0, 5
    jal wait

    li $v0, 1
    syscall
    move $t3, $v0

if1:    
    bne $t3, '+', if2
    li $t0, UP

if2:    
    li $t0, DOWN

if3:    
    bne $t0, UP, else
    addi $t1, $t1, 1
    andi $t1, $t1, 0xFF

else:
    bne $t0, UP, else
    addi $t1, $t1, -1
    andi $t1, $t1, 0xFF

while:  
    beq $t3, 'q', enddo
    j do

enddo:
    li $v0, 0
    jr $ra

#===================================================================================
# Mapa de registos:
# $a0 : ts
# $t0 : i

wait:  
    li $t0, 0

for:
    li $t1, 515000
    mul $t1, $t1, $a0
    bge $t0, $t1, endfor

    addi $t0, $t0, 1
    j for

endfor:
    jr $ra

#==================================================================================