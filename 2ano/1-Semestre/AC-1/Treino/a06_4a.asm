	.data
str1:	.asciiz "Nr. de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main:	
	li $t0, 0
	move $t1, $a0
	
	la $a0, str1
	li $v0, print_string
	syscall
	
	move $a0, $t1
	li $v0, print_int10
	syscall
	
for:	
	bge $t0, $t1, endfor
	
	la $a0, str2
	li $v0, print_string
	syscall
	
	move $a0, $t0
	li $v0, print_int10
	syscall
	
	la $a0, str3
	li $v0, print_string
	syscall
	
	sll $t2, $t0, 2
	add $t3, $a1, $t2
	lw $a0, 0($t3)
	li $v0, print_string
	syscall
	
	addi $t0, $t0, 1		# ponteiros tem 4 bytes 
	
	j for

endfor:
	jr $ra