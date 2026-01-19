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
	li	$t0, 0		# i = 0
	la	$t1, array
	
for:	
	bge	$t0, SIZE, endfor	# for(i=0; i < SIZE; i++) 
	
	mulu	$t2, $t0, 4
	addu	$t2, $t2, $t1
	lw	$a0, 0($t2)
	li	$v0, print_string
	syscall			# print_string(array[i]); 
	
	li	$a0, char
	li	$v0, print_char
	syscall			# print_char('\n');
	
	addiu	$t0, $t0, 1		# i++
	
	j	for

endfor:
	
	jr	$ra
	
# Mapa de Registos
# $t0 = i
# $t1 = array
# $t2 = array[i]
# 
# 
# 
# 