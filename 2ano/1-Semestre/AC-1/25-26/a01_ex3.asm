	.data
	
	.eqv 	read_int, 5
	.eqv 	print_int10, 1
	.eqv 	print_int16, 34
	
	.text
	.globl main
main:
	ori 	$v0, $0, read_int
	syscall			# ler um x inteiro
	
	ori 	$t2, $0, 8
	add 	$a0, $v0, $v0
	sub 	$a0, $a0, $t2
	ori 	$v0, $0, print_int10
	syscall			# print do resultado int 10
	
	ori 	$v0, $0, print_int16
	syscall			# print do resultado int 16
	
	jr 	$ra