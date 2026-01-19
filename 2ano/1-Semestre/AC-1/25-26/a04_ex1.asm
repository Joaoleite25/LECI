	# Mapa de registos 
	# num:  $t0 
	# i:   $t1 
	# str:  $t2 
	# str+i:  $t3 
	# str[i]: $t4 
	.data
	
	.eqv	SIZE, 20
	.eqv 	read_string, 8
	.eqv	print_int10, 1
	
str:	.space	21
	
	.text
	.globl main
main:	
	la	$a0, str
	li	$a1, SIZE
	ori	$v0, $0, read_string
	syscall			# read_string(str, SIZE);
	
	ori	$t0, $0, 0		# num = 0
	ori	$t1, $0, 0		# i = 0
	
	
	la	$t2, str		# str
while:	
	addu	$t3, $t2, $t1	# str+i
	lb	$t4, 0($t3)		# str[i]
	beq	$t4, '\0', endwhile	# while( str[i] != '\0' )
if:	
	blt	$t4, '0', skip	# if( (str[i] >= '0')
	bgt	$t4, '9', skip	# && (str[i] <= '9') )
	
	addi	$t0, $t0, 1		# num++
	
skip:	
	addi	$t1, $t1, 1		# i++
	
	j	while
	
endwhile:	
	or	$a0, $0, $t0
	ori	$v0, $0, print_int10
	syscall			# print_int10(num); 
	
	jr $ra