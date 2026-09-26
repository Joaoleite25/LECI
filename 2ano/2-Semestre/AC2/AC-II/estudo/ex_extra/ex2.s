.data
    .equ ADDR_BASE_HI,0xBF88 # Base address: 16 MSbits
    .equ TRISE,0x6100 # TRISE address is 0xBF886100
    .equ LATE,0x6120 # LATE address is 0xBF88612
    .equ GET_CHAR,2
    .equ READ_CORE_TIMER,11
    .equ RESET_CORE_TIMER,12
    .text
    .globl main
main:
    lui $t0,ADDR_BASE_HI

    lw $t1,TRISE($t0)
    andi $t1,$t1,0xFFF0
    sw $t1,TRISE($t0)

    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFF0
    sw $t1,LATE($t0)

loop:
    li $v0,GET_CHAR
    syscall

    beq $v0,'0',led_0
    beq $v0,'1',led_1
    beq $v0,'2',led_2
    beq $v0,'3',led_3
    j else
    
led_0:
    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFF0
    ori $t1,$t1,0x0001
    sw $t1,LATE($t0)
    j end_if
led_1:
    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFF0
    ori $t1,$t1,0x0002
    sw $t1,LATE($t0)
    j end_if
led_2:
    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFF0
    ori $t1,$t1,0x0004
    sw $t1,LATE($t0)
    j end_if
led_3:
    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFF0
    ori $t1,$t1,0x0008
    sw $t1,LATE($t0)
    j end_if
else:
    lw $t1,LATE($t0)
    ori $t1,$t1,0x000F
    sw $t1,LATE($t0)

    li $v0,RESET_CORE_TIMER
    syscall
    
wait:
    li $v0,READ_CORE_TIMER
    syscall
    blt $v0,20000000,wait #1s

    li $v0,RESET_CORE_TIMER
    syscall

    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFF0
    sw $t1,LATE($t0)

end_if:

    j loop