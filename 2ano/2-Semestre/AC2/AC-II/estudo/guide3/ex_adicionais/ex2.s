    .equ TRISE_ADDR, 0xBF886100
    .equ LATE_ADDR,  0xBF886120
    .equ TRISD_ADDR, 0xBF8860C0
    .equ LATD_ADDR, 0xBF8860E0

    .data
    .text
    .globl main

main:
    addiu $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    li $s0, 0                   # v = 0

    # Configura RE0 como saída
    li $t0, TRISE_ADDR
    lw $t1, 0($t0)
    andi $t1, $t1, 0xFFFE       # TRISE0 = 0
    sw $t1, 0($t0)

    li $t0, TRISD_ADDR
    lw $t1, 0($t0)
    andi $t1, $t1, 0xFFFE
    sw $t1, 0($t0)

while:
    li $t0, LATE_ADDR
    lw $t1, 0($t0)
    andi $t1, $t1, 0xFFFE       # Limpa LATE0
    or $t1, $t1, $s0
    sw $t1, 0($t0)

    li $t0, LATD_ADDR
    lw $t1, 0($t0)
    andi $t1, $t1, 0xFFFE
    or $t1, $t1, $s0
    sw $t1, 0($t0)

    li $a0, 500
    jal delay

    xori $s0, $s0, 1            # v ^= 1

    j while

exit:
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addiu $sp, $sp, 8
    jr $ra

#=========================
delay:
    li $v0, 12
    syscall

    li $t0, 20000
    mul $t0, $t0, $a0

while_delay:
    li $v0, 11
    syscall
    bge $v0, $t0, endw_delay
    j while_delay

endw_delay:
    jr $ra
