
    .data
    .text
    .globl main

main:
    jal configD11

while:
    li $a0, 1
    jal outD11

    li $a0, 500
    jal delay
    
    li $a0, 0
    jal outD11

    li $a0, 600
    jal delay

    li $a0, 1
    jal outD11

    li $a0, 200
    jal delay

    li $a0, 0
    jal outD11

    li $a0, 150
    jal delay

    li $a0, 1
    jal outD11

    li $a0, 100
    jal delay

    li $a0, 0
    jal outD11

    li $a0, 600
    jal delay

    j while

    li $v0, 0
    jr $ra

#================================================
# void configD11(void)
configD11:
    lui $t0, 0xBF88
    lw $t1, 0x6080($t0)
    andi $t1, $t1, 0xBFFF
    sw $t1, 0x6080($t0)
    jr $ra
#================================================
# void outD11(int val)
outD11:
    lui $t0, 0xBF88
    lw $t1, 0x60A0($t0)
    andi $t1, $t1, 0xBFFF
    sll $a0, $a0, 14
    or $t1, $t1, $a0
    sw $t1, 0x60A0($t0)
    jr $ra
#================================================
#void delay(void)
delay:   
    li $v0, 12
    syscall
while_delay:
    li $v0, 11
    syscall
    li $t0, 20000
    mul $t0, $t0, $a0
    bge $v0, $t0, endw
    j while_delay
endw:
    jr $ra
#================================================