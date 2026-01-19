	.data

str1: 	.asciiz 	"Introduza 2 numeros " 
str2: 	.asciiz 	"A soma dos dois numeros e': " 
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int10, 1

	.text
	.globl main
main:	
	la 	$a0, str1
	ori	$v0, $0, print_string
	syscall				# print_string
	
	ori	$v0, $0, read_int
	syscall				# read_int
	or	$t0, $0, $v0
	
	ori	$v0, $0, read_int
	syscall				# read_int
	or	$t1, $0, $v0
	
	la 	$a0, str2
	ori	$v0, $0, print_string
	syscall				# print_string
	
	add	$a0, $t0, $t1
	ori	$v0, $0, print_int10
	syscall				# print a + b
	
	jr	$ra
