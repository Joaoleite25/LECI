	.data
	
	.eqv	SIZE, 3
	
str:	.asciiz	"\nString #"
pontos:	.asciiz	": "
	
array:	.word	str1, str2, str3
str1:	.asciiz	"Array"
str2:	.asciiz	"de"
str3:	.asciiz	"ponteiros"

	.eqv	char, '-'
	
	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	print_char, 11
	
	.text
	.globl main
main:	
	li	$t0, 0
	
for:	
	bge	$t0, SIZE, endfor	# for(i=0; i < SIZE; i++) 
	
	la	$a0, str
	li	$v0, print_string
	syscall			# print_string( "\nString #" );
	
	or	$a0, $0, $t0
	li	$v0, print_int10
	syscall			# print_int10( i ); 
	
	la	$a0, pontos
	li	$v0, print_string
	syscall			# print_string( ": " );
	
	li	$t1, 0		# j = o
	
	la	$t2, array
	mulu	$t3, $t0, 4
	addu	$t2, $t2, $t3	
	lw	$t2, 0($t2)		# array[i]
	
while:	
	addu	$t3, $t2, $t1	
	lb	$t3, 0($t3)		# array[i][j]
	
	beq	$t3, '\0', endw	# while(array[i][j] != '\0') 
	
	or	$a0, $0, $t3
	li	$v0, print_char
	syscall			# print_char(array[i][j]); 
	
	## Acrescentado pra ficar mais bomito
if:	
	addu	$t4, $t2, $t1
	addiu	$t4, $t4, 1
	lb	$t4, 0($t4)
	beq	$t4, '\0', skip
	
	li	$a0, char
	li	$v0, print_char
	syscall			# print_char('-'); 
skip:

	addiu	$t1, $t1, 1		# j++
	
	j	while

endw:	
	addiu	$t0, $t0, 1		# i++
	
	j	for
	
endfor:
	
	jr	$ra

# Mapa de Registos
# $t0 = i
# $t1 = j
# $t2 = array[i]
# $t3 = array[i][j]
# 
# 
# 