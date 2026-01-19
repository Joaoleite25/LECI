	.data
	
str:	.asciiz	"ITED - orievA ed edadisrevinU"
	.eqv	print_string, 4
	
	.text
	.globl main
main:	
	la	$t0, str			# char *p1 = str;
	la	$t1, str  			# char *p2 = str;
	
while1:	
	lb	$t2, 0($t1)
	beq	$t2, '\0', endw1		# while(*p2 != '\0')
	addiu	$t1, $t1, 1			# p2++
	
	j	while1
	
endw1:
	addiu	$t1, $t1, -1		# p2--
	
while2:
	bge	$t0, $t1, endw2		# while( p1 < p2 )
	
	lb	$t2, 0($t0)
	lb	$t3, 0($t1)
	
	sb	$t2, 0($t1)			# p2 = *pq
	sb	$t3, 0($t0)			# p1 = *p2
	
	addiu	$t0, $t0, 1			# p1++
	addiu	$t1, $t1, -1		# p2--
	
	j	while2
	
endw2:
	la	$a0, str
	li	$v0, print_string
	syscall				# return str
	
	jr	$ra
	
# Mapa de Registos
# $t0 = p1
# $t1 = p2
# 
# 
# 