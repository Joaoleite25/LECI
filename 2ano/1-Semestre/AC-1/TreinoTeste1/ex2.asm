# Mapa de registos
# i:	$t0
# v:	$t1
# &(val[0]):	$t2

	.data
	
	.eqv	SIZE, 8
	
	.align	2
val:	.word	8, 4, 15, -1987, 327, -9, 27, 16
str:	.asciiz	"Result is: "
	
	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	print_char, 11
	
	.text
	.globl main
main:	
	li	$t0, 0
	la	$t2, val
	
do:	
	mulu	$t4, $t0, 4
	addu	$t4, $t2, $t4
	lw	$t1, 0($t4)
	
	lw	$t3, 4($t4)
	sw	$t3, 0($t4)
	
	sw	$t1, 4($t4)
	
	addiu	$t0, $t0, 1
	
	blt	$t0, 4, do
	
	la	$a0, str
	li	$v0, print_string
	syscall
	
	li	$t0, 0
	
do1:	
	mulu	$t4, $t0, 4
	addu	$t4, $t2, $t4
	lw	$a0, 0($t4)
	li	$v0, print_int10
	syscall	
	
	li	$a0, ','
	li	$v0, print_char
	syscall
	
	addiu	$t0, $t0, 1
	
	blt	$t0, SIZE, do1
	
	jr	$ra