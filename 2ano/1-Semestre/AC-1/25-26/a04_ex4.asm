	.data
	
	.eqv	SIZE, 20
	.eqv	print_string, 4
	.eqv	read_string, 8
str:	.space	21
frase:	.asciiz	"Introduza uma string: "	
	
	.text
	.globl main
main:
	la	$a0, frase
	li	$v0, print_string
	syscall			# print_string("Introduza uma string: "); 
	
	la	$a0, str
	li	$a1, SIZE
	li	$v0, read_string
	syscall			# read_string(str, SIZE);
	
	la	$t0, str		# p = str
	
while:	
	lb	$t1, 0($t0)
	beq	$t1, '\0', endw	# while (*p != '\0') 
	
	blt	$t1, 'a', skip
	bgt	$t1, 'z', skip	# verificação se é minuscula
	
	li	$t2, -0x20		# a - A = 0x20
	addu	$t1, $t1, $t2	# *p = *p – 'a' + 'A'; // 'a'=0x61, 'A'=0x41, 'a'-'A'=0x20
	
	sb	$t1, 0($t0)		# gusardar troca
	
skip:
	addiu	$t0, $t0, 1		# p++;
	
	j	while
	
endw:	
	la	$a0, str
	li	$v0, print_string
	syscall			# print_string(str); 
	
	jr $ra
	
# Mapa de registos
# $t0 = p
# $t1 = *p
# $t2 = 0x20