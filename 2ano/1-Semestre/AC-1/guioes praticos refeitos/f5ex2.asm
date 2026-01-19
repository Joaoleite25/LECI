# mapa de registos
# $t0 : p
# $t2 : lista + size
	
	.data
lista:	.word 8, 4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv SIZE, 10
str:	.asciiz "\nConteudo do array:\n"
str1:	.asciiz "; "
	.eqv print_string, 4
	.eqv print_int10, 1
	.text
	.globl main
	
main:	
	la $a0, str
	li $v0, print_string
	syscall			# print_string("\nConteudo do array:\n");
	
	la $t0, lista 	# p = lista
	li $t2, SIZE	# t2 = size
	sll $t2, $t2, 2	# size*4
	addu $t2, $t0, $t2	# lista + size
	
while: 	bge $t0, $t2, endwhile	# p < lista + SIZE
	
	lw $a0, 0($t0)
	li $v0, print_int10	# print_int10( *p ); 
	syscall
	
	la $a0, str1
	li $v0, print_string	# print_string("; ")
	syscall
	
	addiu $t0, $t0, 4	# p++
	
	j while
endwhile:
		
	jr $ra