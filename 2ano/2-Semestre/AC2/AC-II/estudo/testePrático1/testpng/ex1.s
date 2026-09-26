    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120
    
    .data
    .text
    .globl main

main:
    lui $t0, ADDR_BASE_HI

    lw $t1, TRISE($t0)
    andi $t1, $t1, 0xFFE0
    sw $t1, TRISE($t0)

    #lw $t1, LATE($t0)
    #andi $t1, $t1, 0xFFE0
    #sw $t1, LATE($t0)

loop:
    li $v0, 2
    syscall
    move $t1, $v0

    beq $t1, '0', led0
    beq $t1, '1', led1
    beq $t1, '2', led2
    beq $t1, '3', led3

    j led4

led0:
    lw $t2, LATE($t0)
    ori $t2, $t2, 0x0001
    sw $t2, LATE($t0) 
    j loop
led1:
    lw $t2, LATE($t0)
    ori $t2, $t2, 0x002
    sw $t2, LATE($t0) 
    j loop
led2:
    lw $t2, LATE($t0)
    ori $t2, $t2, 0x0004
    sw $t2, LATE($t0) 
    j loop
led3:
    lw $t2, LATE($t0)
    ori $t2, $t2, 0x0008
    sw $t2, LATE($t0) 
    j loop
led4:
    lw $t2, LATE($t0)
    ori $t2, $t2, 0x001F
    sw $t2, LATE($t0) 

    li $a0, 2000
    jal delay

    lw $t2, LATE($t0)
    andi $t2, $t2, 0xFFE0
    sw $t2, LATE($t0)

    j loop
    jr $ra
#=====================================================================
delay:
    li $v0, 12
    syscall
while:
    li $v0, 11
    syscall

    li $t3, 20000
    mul $t3, $t3, $a0
    bge $v0, $t3, endw
    j while
endw:
    jr $ra
