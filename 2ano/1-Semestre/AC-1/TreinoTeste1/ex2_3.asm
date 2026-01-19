# Mapa de registos
# i:	$t0
# v:	$t1
# &(val[0}): $t2

	.data
	
	.eqv	SIZE, 8
	.align	2
val:	.word	8, 4, 15, -1987, 327, -9, 27, 16

str:	.asciiz	"Result is:"

	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	print_char, 11
	
	.text
	.globl main
main:	
	li	$t0, 0
	la	$t2, val
do:	sll	$t3, $t0, 2
	addu	$t3, $t3, $t2
	lw	$t1, 0($t3)
	lw	$t4, 16($t3)
	sw	$t4, 0($t3)
	sw	$t1, 16($t3)
	addiu	$t0, $t0, 1
	blt	$t0, 4, do
	
	la	$a0, str
	li	$v0, print_string
	syscall	
	li	$t0, 0
do1:	sll	$t3, $t0, 2
	addu	$t3, $t3, $t2
	lw	$a0, 0($t3)
	li	$v0, print_int10
	syscall	
	li	$a0, ','
	li	$v0, print_char
	syscall
	addiu	$t0, $t0, 1
	blt	$t0, SIZE, do1
	
	jr	$ra