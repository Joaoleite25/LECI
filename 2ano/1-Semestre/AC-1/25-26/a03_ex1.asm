	.data
	
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int10, 1
	
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"A soma dos positivos e': "
erro:	.asciiz	"Valor ignorado\n"
	
	.text
	.globl main
main:	
	ori	$t0, $0, 0		# i = 0
	ori	$t1, $0, 0		# soma = 0
	
for:	bge	$t0, 5, endfor	# i < 5

	la 	$a0, str1
	ori	$v0, $0, print_string
	syscall			# print_string("Introduza um numero: ");
	
	ori	$v0, $0, read_int
	syscall			# value = read_int();
	
if:	ble	$v0, 0, else	# value > 0
	
	add	$t1, $t1, $v0	# soma += value;
	
	j	skip
	
else:	
	la	$a0, erro
	ori	$v0, $0, print_string
	syscall			# print_string("Valor ignorado\n");	
	
skip:	
	addi	$t0, $t0, 1		# i++
	j	for

endfor:	
	la	$a0, str2
	ori	$v0, $0, print_string
	syscall			# print_string("A soma dos positivos e': "); 
	
	or	$a0, $0, $t1
	ori	$v0, $0, print_int10
	syscall			# print_int10(soma); 
	
	jr	$ra