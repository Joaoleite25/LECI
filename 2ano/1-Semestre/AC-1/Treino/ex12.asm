 .data
 .align 2 
 
student:
 .space 4 # id_number
 .space 18 # first_name
 .space 15 # last_name
 .space 3 # espaço para o endereço do grade começar num multiplo de 4 
 .space 4
 .align 2
vinte:
 .float -20.0
zero: 
 .float 0.0
 
 .eqv MAX_STUDENTES , 4
st_array:
        .space 176            # 4 students × 44 bytes
media:
        .float 0.0
str_media:
        .asciiz "\nMedia "
str_mec:
        .asciiz "\nN. Mec "
str_pn:
        .asciiz "\nPrimeiro Nome " 

str_un:
        .asciiz "\nUltimo Nome"
str_nota:
        .asciiz "\nNota " 

 .text
 .globl main
main: 

 addiu $sp,$sp,-12
 sw $ra,8($sp)
 sw $s0,4($sp)
 sw $s1,0($sp)

 la $s0,st_array
 move $a0,$s0
 li $a1,MAX_STUDENTES

 jal read_data
 
 la  $a0, st_array
 li  $a1, MAX_STUDENTES
 la $a2,media
 
 jal max
 move $s1,$v0

 la $a0, str_media
 li $v0,4
 syscall

 l.s $f12,0($a2)
 li $v0,2
 syscall
 
 move $a0,$s1 
 jal print_student

 li $v0,0

 lw $ra,8($sp)
 lw $s0,4($sp)
 lw $s1,0($sp)
 addiu $sp,$sp,12
 jr $ra


read_data:
    li $t0,0 
    move $t1,$a0

loopr:
    bge $t0,$a1,end_read
    
    la $a0,str_mec
    li $v0,4
    syscall
    li $v0,5
    syscall
    sw $v0,0($t1)


    la $a0,str_pn
    li $v0,4
    syscall
    addi $t2,$t1,4
    move $a0,$t2
    li $a1,18
    li $v0,8
    syscall

    la $a0,str_un
    li $v0,4
    syscall
    addi $t2,$t2,18
    move $a0,$t2
    li $a1,15
    li $v0,8
    syscall


    la $a0,str_nota
    li $v0,4
    syscall
    li $v0,6
    syscall
    s.s $f0,40($t1)

    addi $t0,$t0,1
    addi $t1,$t1,44

    j loopr

    


end_read:

    jr $ra


max:
    la $t3, vinte
    l.s $f0,0($t3) #max grade 
    la $t3, zero
    l.s $f2,0($t3) #sum

    move $t9,$a0 #pointer to student array
    move $t0,$a0
    mul $t1,$a1,44
    add $t1,$a0,$t1
loopm:
    bge $t0,$t1,endmax
    l.s $f4,40($t0)
    add.s $f2,$f2,$f4

    c.le.s $f4,$f0
    bc1t else
    mov.s $f0,$f4
    move $t9,$t0

else:
    addi $t0,$t0,44
    j loopm

endmax:
    mtc1 $a1,$f6
    cvt.s.w $f6,$f6
    div.s $f6,$f2,$f6 
    s.s $f6,0($a2)
    move $v0,$t9
    jr $ra


print_student:
    move $t9,$a0  # salvar ponteiro
    
    lw $a0,0($t9) #id_number
    li $v0,1
    syscall

    la $a0,str_pn
    li $v0,4
    syscall

    addi $a0,$t9,4
    li $v0,4
    syscall

    la $a0,str_un
    li $v0,4
    syscall

    addi $a0,$t9,22
    li $v0,4
    syscall

    la $a0,str_nota
    li $v0,4
    syscall

    l.s $f12,40($t9)
    li $v0,2
    syscall

    jr $ra