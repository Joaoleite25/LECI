	.data
	
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"\nValor em código Gray: "
str3:	.asciiz	"\nValor em binario: "
	
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int16, 34
	
	.text
	.globl main
main:	
	la	$a0, str1
	ori	$v0, $0, print_string
	syscall			# print_string("Introduza um numero: ");
	
	ori	$v0, $0, read_int
	syscall
	or	$t0, $v0, $0	# gray = read_int(); 
	
	srl	$t1, $t0, 1		# mask = gray >> 1;
	
	or	$t2, $t0, $0	# big = gray
	
while:	
	beq	$t1, 0, endwhile	# while(mask != 0) 
	
	xor	$t2, $t2, $t1	# bin = bin ^ mask;
	
	srl	$t1, $t1, 1		# mask = mask >> 1; 
	
	j	while
		
endwhile:		
	la	$a0, str2
	ori	$v0, $0, print_string
	syscall			# print_string("\nValor em código Gray: "); 
	
	or	$a0, $0, $t0
	ori	$v0, $0, print_int16
	syscall			# print_int16(gray); 
	
	la	$a0, str3
	ori	$v0, $0, print_string
	syscall			# print_string("\nValor em binario: "); 
	
	or	$a0, $0, $t2
	ori	$v0, $0, print_int16
	syscall			# print_int16(bin); 
	
	# NÃO ESTÁ EM BINÁRIO, TERIA  DE FAZER CONVERSÃO BIT A BIT #
	
	jr	$ra