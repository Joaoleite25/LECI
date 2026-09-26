    .data 
    .text 
    .equ readint10, 5
    .equ printint, 6
    .equ printint10, 7
    .equ printstr, 8

    .globl main 

main:
    li $a0, "\nIntroduza um inteiro (sinal e módulo): "
    li $v0, printstr
    syscall

    li $v0, readint10
    syscall
    move $t0, $v0

    li $a0, "\nValor em base 10 (signed): "
    li $v0, printstr
    syscall

    move $a0, $t0
    li $v0, printint10
    syscall

    li $a0, "\nValor em base 2: "
    li $v0, printstr
    syscall

    move $a0, $t0
    li $a1, 2
    li $v0, printint
    syscall

    li $a0, "\nValor em base 16: "
    li $v0, printstr
    syscall

    move $a0, $t0
    li $a1, 16
    li $v0, printint
    syscall

    li $a0, "\nValor em base 10 (unsigned): "
    li $v0, printstr
    syscall

    move $a0, $t0
    li $a1, 10
    li $v0, printint
    syscall

    li $a0, "\nValor em base 10 (unsigned), formatado: "
    li $v0, printstr
    syscall

    // $t1 = 10 | 5 << 16
    li $t1, 10
    or $t1, $t1, 5
    sll $t1, $t1, 16

    move $a0, $t0
    li $a1, $t1
    li $v0, printint
    syscall

    li $v0, 0
    jr $ra
