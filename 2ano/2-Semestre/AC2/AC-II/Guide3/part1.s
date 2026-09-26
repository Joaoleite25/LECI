
    .data

    .equ ADDR_BASE_HI,0xBF88    # Base address: 16 MSbits
    .equ TRISE,0x6100           # TRISE address is 0xBF886100
    .equ PORTE,0x6110           # PORTE address is 0xBF886110
    .equ LATE,0x6120            # LATE address is 0xBF886120
    .equ PORTD, 0x60D0          
    .equ TRISD, 0x60C0          

    .text
    .globl main

main:  
    lui $t1, ADDR_BASE_HI           
    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFFF8
    sw $t2, TRISE($t1)

    lw $t3, TRISD($t1)
    andi $t4, $t4, 0x0008
    sw $t4, TRISD($t1)

loop:
    lw $t5, PORTD($t1)
    andi $t5, $t5, 0x0100
    srl $t5, $t5, 8

    lw $t6, LATE($t1)
    andi $t7, $t7, 0xFFF8
    or $t7, $t7, $t5
    sw $t7, LATE($t1)

    j loop

    jr $ra