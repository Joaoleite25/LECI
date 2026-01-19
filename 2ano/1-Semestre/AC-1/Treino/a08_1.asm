	.data
str1:	.asciiz	"2020 e 2024 sao anos bissextos"
str2:	.asciiz	"101101"
	
	.text
	.globl main
	
main:	
	addiu 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	
	la	$a0, str1
	jal	atoi			# atoi(str1)
	move	$t0, $v0
	
	move	$a0, $t0
	li	$v0, 1
	syscall				# print_int10( atoi(str1) );
	
	la	$a0, str2
	jal	atoi			# atoi(str2)
	move	$t0, $v0
	
	move	$a0, $t0
	li	$v0, 1
	syscall				# print_int10( atoi(str2) );
	
	lw 	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	jr	$ra
	
#############################
	
atoi:	
	li	$v0, 0			# res = 0; 
	
atoi_while1:
	lb	$t0, 0($a0)			# *s
				
	blt	$t0, '0', atoi_end1		# While(*s >= '0')
	bgt	$t0, '9', atoi_end1		# While(*s <= '9')
	
	li	$t2, '0'
	subu	$t1, $t0, $t2		# digit = *s++ - '0'; 
	
	addiu 	$a0, $a0, 1 		# s++
	
	mulu	$t2, $v0, 10		# res = 10 * res
	
	addu	$v0, $t2, $t1		# res = 10 * res + digit; 
	
	j	atoi_while1

atoi_end1:
	
	jr	$ra