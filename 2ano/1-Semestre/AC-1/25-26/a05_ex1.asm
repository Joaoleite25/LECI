	.data
	
	.eqv	SIZE,5
	
	.align	2
lista:	.space	20		# SIZE * 4
str:	.asciiz	"\nIntroduza um numero: "
	.eqv	print_string, 4
	.eqv	read_int, 5
	
	.eqv	print_int10, 1
	
	.text
	.globl main
main:	
	li	$t0, 0		# i = 0
	la	$t1, lista		# lista[0]
	
for:	
	bge	$t0, SIZE, endf	# for(i=0; i < SIZE; i++) 
	
	la	$a0, str
	li	$v0, print_string
	syscall			# print_string(str); 
	
	li	$v0, read_int
	syscall			# read_int()
	
	mulu	$t2, $t0, 4
	addu	$t2, $t1, $t2	# lista[i]
	
	sw	$v0, 0($t2)		# lista[i] = read_int(); 
	
	addi	$t0, $t0, 1		# i++
	
	j	for
	
endf:	
	# PRINT NA LISTA
	li	$t0, 0
for2:	
	bge	$t0, SIZE, endf2
	mulu	$t2, $t0, 4
	addu	$t2, $t1, $t2
	lw	$a0, 0($t2)
	li	$v0, print_int10
	syscall
	addi	$t0, $t0, 1
	
	j	for2
	
endf2:
	
	jr $ra

# Mapa de registos
# $t0 = i
# $t1 = lista
# $t2 = lista[i]