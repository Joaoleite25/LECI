# mapa de registos
# a = $t0
# b = $t1
	
	.data
	
str1: 	.asciiz "Introduza 2 numeros "
str2: 	.asciiz "A soma dos dois numeros e': "
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main
	
main:	
	la $a0, str1		 	# a0 = endereco de str1
	ori $v0, $0, print_string 	#syscall print string 
	syscall
	
	ori $v0, $0, read_int 		#syscall read int
	syscall
	or $t0, $0, $v0			# $t0 = $v0 = valor lido
	
	ori $v0, $0, read_int 		#syscall read int
	syscall
	or $t1, $0, $v0			# $t1 = $v0 = valor lido
	
	la $a0, str2		 	# a0 = endereco de str2
	ori $v0, $0, print_string 	#syscall print string 
	syscall
	
	add $t1, $t0, $t1		# $t1 = a + b
	or $a0, $0, $t1			# $a0 = $t1 para entrar na syscall 
	ori $v0, $0, print_int10	#syscall print int 10
	syscall
	
	jr $ra