    .data

    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120

    .text
    .globl main
main:
    lui $t0, ADDR_BASE_HI
    lw $t1, TRISE($t0)
    andi $t1, $t1, 0xFF81  ##1111 1111 1000 0001
    sw $t1, TRISE($t0)

    li $t2, 0x0040 # x100 00xx
while:

    lw $t1, LATE($t0)
    andi $t1, $t1, 0xFF83 # 
    or $t1, $t1, $t2
    sw $t1, LATE($t0)

    bgt $t2, 0x0004, not_reset
    li $t2, 0x0040          # value = 0x0040 # 
not_reset:
    srl $t2, $t2, 1         # value >> 1;

    li $t3, 0x0002          # p = 0x0002 # 0000 0010
for:                        # for()
    li $v0, 12              # resetCoreTimer();
    syscall


    lw $t1, LATE($t0)
    andi $t1, $t1, 0xFFFE
    xori $t3, $t3, 0x0002
    xor $t1, $t1, $t3
    sw $t1, LATE($t0)

    addi $t3, $t3, 1        # i++;

wait:    li $v0, 11
    syscall
    
    ble $v0, 4444444, wait  # while (readCoreTimer() < 4444444);

    blt $t3, 2, for         # volta para o for

    j while
    jr $ra
