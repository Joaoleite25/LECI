.data
    .equ ADDR_BASE_HI,0xBF88 # Base address: 16 MSbits
    .equ TRISE,0x6100 # TRISE address is 0xBF886100
    .equ PORTE,0x6110 # PORTE address is 0xBF886110
    .equ LATE,0x6120 # LATE address is 0xBF886120
    .equ READ_CORE_TIMER,11
    .equ RESET_CORE_TIMER,12
    .text
    .globl main
main:
    lui $t0,ADDR_BASE_HI

    li $t5,0

    lw $t1,TRISE($t0)
    andi $t1,$t1,0xFFC1        # 0000 0000 0011 1110
    sw $t1, TRISE($t0)

    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFC1           # 1100 0001
    sw $t1,LATE($t0)

    lw $t1,LATE($t0)
loop:
    li $t4,0x0001

    or $t1,$t1,$t4         #     0 0001
    sw $t1,LATE($t0)

for:

    li $v0,6
    li $a1,5
    move $a0,$t4
    sll $a1,$a1,16
    or $a1,$a1,2
    syscall

    li $a0,'\r'
    li $v0,3
    syscall

    li $v0,RESET_CORE_TIMER
    syscall

wait:
    li $v0,READ_CORE_TIMER
    syscall
    blt $v0,8695652,wait

    sll $t4,$t4,1
    andi $t1,$t1,0xFFC1
    or $t1,$t1,$t4       # 0 0010
    sw $t1,LATE($t0)
    
    addi $t5,$t5,1

    blt $t5,5,for

    li $t5,0
    j loop