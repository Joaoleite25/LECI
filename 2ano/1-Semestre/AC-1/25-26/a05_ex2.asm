	.data
	
	.eqv	SIZE, 10
	
	.align	2
lista:	.word	8, -4, 3, 5, 124, -15, 87, 9, 27, 15

	.eqv	print_string, 4
	.eqv	print_int10, 1
	
str1:	.asciiz	"\nConteudo do array:\n"
str2:	.asciiz	"; "
	
	.text
	.globl main
main:	
	la	$t0, lista		# p = lista
	li	$t1, SIZE	
	mulu	$t1, $t1, 4
	addu	$t1, $t0, $t1	# lista + SIZE
	
	la	$a0, str1
	li	$v0, print_string
	syscall			# print_string("\nConteudo do array:\n"); 

for:	
	bge	$t0, $t1, endf	# for(p = lista; p < lista + SIZE; p++)
	
	lw	$a0, 0($t0)		# *p
	li	$v0, print_int10
	syscall			# print_int10( *p );
	
	la	$a0, str2
	li	$v0, print_string
	syscall			# print_string("; "); 
	
	addiu	$t0, $t0, 4		# p++
	
	j	for
	
endf:	
	
	jr	$ra
	
# Mapa de registos
# $t0 = p
# $t1 = 	lista + SIZE