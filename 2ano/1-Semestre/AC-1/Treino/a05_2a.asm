	# Mapa de registos
	# p: $t0
	# *p: $t1
	# lista+Size: $t2 
	.data
	.eqv SIZE, 10
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main:	la $a0, str1
	li $v0, print_string
	syscall
	
	la $t0, lista			# $t0 = lista
	li $t3, SIZE			# $t3 = SIZE
	sll $t3, $t3, 2
	addu $t2, $t0, $t3		# $t2 = lista + SIZE
	
while:	bgeu $t0, $t2, endw

	lw $a0, 0($t0)
	li $v0, print_int10
	syscall
	
	la $a0, str2
	li $v0, print_string
	syscall
	
	addiu $t0, $t0, 4
	
	j while
	
endw:	jr $ra