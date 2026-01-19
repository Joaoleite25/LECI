	.data
array:	.word str1, str2, str3
str1:	.asciiz "Array" 
str2:	.asciiz "de" 
str3:	.asciiz "ponteiros"
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv SIZE, 3
	
	.text
	.globl main
main:	li $t0, 0
	li $t3, SIZE
	
for:	bge $t0, $t3, endfor
	
	la $t1, array
	sll $t2, $t0, 2
	addu $t2, $t1, $t2
	
	lw $a0, 0($t2)
	li $v0, print_string
	syscall
	
	li $a0, '\n'
	li $v0, print_char
	syscall
	
	addiu $t0, $t0, 1
	
	j for

endfor:
	jr $ra