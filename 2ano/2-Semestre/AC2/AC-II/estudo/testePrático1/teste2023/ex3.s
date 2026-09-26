# MApa de registos:
# counter: $t2
    
    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120

    .data

    .text
    .globl main

main:   
    lui $t0, ADDR_BASE_HI

    lw $t1, TRISE($t0)
    andi $t1, $t1, 0xFF83           # 1111 1111 1000 0011
    sw $t1, TRISE($t0)

    li $t2, 25

loop:
    sll $t5, $t2, 2
    lw $t1, LATE($t0)
    andi $t1, $t1, 0xFF83
    or $t1, $t1, $t5
    sw $t1, LATE($t0)

    li $t3, 5                             # 2 | 5 << 16
    sll $t3, $t3, 16
    ori $t3, $t3, 2

    li $v0, 12
    syscall
while:
    li $v0, 11
    syscall

    li $t4, 4347826
    blt $v0, $t4, while
li $v0, 6
    move $a0, $t2
    move $a1, $t3
    syscall

    li $v0, 3
    li $a0, ' '
    syscall

    addi $t2, $t2, -1                  # counter = (counter - 1 + 25) % 25
    addi $t2, $t2, 25
    rem $t2, $t2, 25
    li $v0, 6
    move $a0, $t2
    move $a1, $t3
    syscall

    li $v0, 3
    li $a0, ' '
    syscall

    addi $t2, $t2, -1                  # counter = (counter - 1 + 25) % 25
    addi $t2, $t2, 25
    rem $t2, $t2, 25

    j loop

    jr $ra



