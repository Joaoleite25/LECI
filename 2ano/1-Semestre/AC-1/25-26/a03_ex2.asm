	.data
	
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_char, 11
	
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"\nO valor em binário e': "
	
	.text
	.globl main
main:	
	la 	$a0, str1
	ori	$v0, $0, print_string
	syscall			# print_string("Introduza um numero: ");
	
	ori	$v0, $0, read_int
	syscall			# value = read_int();
	or	$t1, $0, $v0
	
	la 	$a0, str2
	ori	$v0, $0, print_string
	syscall			# print_string("\nO valor em binário e': ");
	
	ori	$t0, $0, 0		# i = 0
	ori	$t4, $0, 0		# flag = 0
for:	bge	$t0, 32, endfor	# i < 32
	
	srl	$t2, $t1, 31	# bit = value >> 31;
	bne	$t2, 1, nflag
	ori	$t4, $0, 1		# flag = 1
	
nflag:	
	bne	$t4, 1, final

	rem	$t3, $t0, 4
	bne	$t3, 0, nospace	# if((i % 4) == 0)
	
	ori 	$a0, $0, ' '
	ori	$v0, $0, print_char
	syscall			# print_char(' ');
	
nospace:
	li	$t3, 0x80000000	
	and	$t2, $t1, $t3	# bit = value & 0x80000000; // isola bit 31
	
	srl	$t2, $t2, 31	# bit = (value & 0x80000000) >> 31; 
 				# ou, em alternativa: bit = (value >> 31) & 0x00000001; 
 				# ou, como value é do tipo unsigned: bit = value >> 31;
 	li	$t3, 0x30
 	add	$t2, $t2, $t3	# print_char(0x30 + bit); // Ou:print_char('0'+ bit);
	
	or 	$a0, $0, $t2
	ori	$v0, $0, print_char
	syscall			# print_char('1'); 

final:	sll	$t1, $t1, 1		# value = value << 1; // shift left de 1 bit 
	addi	$t0, $t0, 1		# i++
	j	for
	
endfor:	
	jr	$ra