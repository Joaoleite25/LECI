	.data
	
	.eqv	SIZE, 3
	
array:	.word	str1, str2, str3
str1:	.asciiz	"Array"
str2:	.asciiz	"de"
str3:	.asciiz	"ponteiros"
	
	.eqv	char, '\n'

	.eqv	print_string, 4
	.eqv	print_char, 11
	
	.text
	.globl main
main:	
	la	$t0, array		# p = array;
	
	li	$t1, SIZE
	mulu	$t1, $t1, 4
	addu	$t1, $t0, $t1	# pultimo = array + SIZE; 
	
for:	
	bge	$t0, $t1, endfor	# for(; p < pultimo; p++) 
	
	lw	$a0, 0($t0)
	li	$v0, print_string
	syscall			# print_string(*p);
	
	li	$a0, char
	li	$v0, print_char
	syscall			# print_char('\n'); 
	
	addiu	$t0, $t0, 4		# p++
	
	j 	for
endfor:
	
	jr	$ra
		
# Mapa de Registos
# $t0 = p
# $t1 = pultimo
# 
# 
# 
# 
# 