	.data
	
str1:	.asciiz	"Nr. de parametros: "
str2:	.asciiz	"\nP"
str3:	.asciiz	": "
	
	.eqv	print_string, 4
	.eqv	print_int10, 1
	
	.text
	.globl main
main:	
	or	$t1, $0, $a0	# argc

	li	$t0, 0		# i = 0
	
	la	$a0, str1
	li	$v0, print_string
	syscall			# print_string("Nr. de parametros: "); 
	
	or	$a0, $0, $t1
	li	$v0, print_int10
	syscall			# print_int10(argc); 
	
for:	
	bge	$t0, $t1, endfor	# for(i=0; i < argc; i++) 
	
	la	$a0, str2
	li	$v0, print_string
	syscall			# print_string("\nP"); 
	
	or	$a0, $0, $t0
	li	$v0, print_int10
	syscall			# print_int(i);
	
	la	$a0, str3
	li	$v0, print_string
	syscall			# print_string(": "); 
	
	mulu	$t2, $t0, 4
	addu	$t2, $a1, $t2
	lw	$a0, 0($t2)
	li	$v0, print_string
	syscall			# print_string(argv[i]);
	
	addiu	$t0, $t0, 1		# i++
	j	for

endfor:
	
	jr	$ra
	
# Mapa de Registos:
# $t0 = i
# $t1 = argc
# $t2 = argv[i]
# 
# 
# 