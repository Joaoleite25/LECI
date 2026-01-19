	.data
	
str1:	.asciiz	"Arquitetura de "
	.align	2
str2:	.space 51
str3:	.asciiz	"Computadores I"
muda:	.asciiz	"\n"
	
	.eqv	print_string, 4
	
	.text
	.globl main
main:	
	la	$t0, str1
	la	$t1, str2
	
	
	# STRCPY
while:	
	lb	$t2, 0($t0)
	beq	$t2, '\0', endw
	
	sb	$t2, 0($t1)
	
	addiu	$t0, $t0, 1
	addiu	$t1, $t1, 1
	
	j	while

endw:	
	##
	
	la	$a0, str2
	li	$v0, print_string
	syscall				# print_string(str2); 
	
	la	$a0, muda
	li	$v0, print_string
	syscall				# print_string("\n"); 
	
	
	# STRCAT
	
	la	$t0, str3
	
while3:	
	lb	$t2, 0($t0)
	beq	$t2, '\0', endw3
	
	sb	$t2, 0($t1)
	
	addiu	$t0, $t0, 1
	addiu	$t1, $t1, 1
	
	j	while3

endw3:	
	
	##
	
	la	$a0, str2
	li	$v0, print_string
	syscall				# print_string( strcat(str2, "Computadores I") ); 
	
	jr	$ra
	
# Mapa de Registos:
# t0 = str1
# t1 = str2
# 
# 
# 
# 