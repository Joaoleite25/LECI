	.data
	.eqv	mss, 33
str:	.space	mss

	.text
	.globl main
	
main:	
	addiu	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	
do:	
	li	$v0, 5
	syscall
	move	$s0, $v0			# val = read_int();
	
	move	$a0, $s0
	li	$a1, 2
	la	$a2, str
	jal	itoa			# itoa(val, 2, str)
	move	$a0, $v0
	li	$v0, 4
	syscall				# print_string( itoa(val, 2, str) );
	
	move	$a0, $s0
	li	$a1, 8
	la	$a2, str
	jal	itoa			# itoa(val, 8, str)
	move	$a0, $v0
	li	$v0, 4
	syscall				# print_string( itoa(val, 8, str) );
	
	move	$a0, $s0
	li	$a1, 16
	la	$a2, str
	jal	itoa			# itoa(val, 16, str)
	move	$a0, $v0
	li	$v0, 4
	syscall				# print_string( itoa(val, 16, str) );
	
	bne	$s0, 0, do			# while(val != 0); 
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
	
################################

		# Mapa de registos
		# n: $a0 -> $s0
		# b: $a1 -> $s1
		# p: $a2 -> $s2
		# digit: $s3
		# Sub-rotina intermédia 

itoa:	
	addiu	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	
	move	$s0, $a0			# n
	move	$s1, $a1			# b
	move	$s2, $a2			# p = s
	
itoa_do:	
	rem 	$s3, $s0, $s1		# digit = n % b;
	
	div	$s0, $s0, $s1		# n = n / b; 
	
	move	$a0, $s3
	jal	toascii			# toascii( digit )
	
	sb	$v0, 0($s2)			# *p++ = toascii( digit ); 
	
	addiu	$s2, $s2, 1			# p++
	
itoa_while:	
	bgt	$s0, 0, itoa_do		# while( n > 0 );
	
	li	$t0, '\0'	
	sb	$t0, 0($s2)			# *p = '\0';
	
	move	$a0, $a2
	jal	strrev			# strrev( s );
	
	move	$v0, $v0			# return s;
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	addiu	$sp, $sp, 20
	
	jr	$ra
	
#########################

toascii:
	
	addi	$t0, $a0, '0'		# v += '0';
	
	ble	$t0, '9', fim		# if( v > '9' ) 
	
	addiu	$t0, $t0, 7			# v += 7; // 'A' - '9' - 1

fim:	
	move	$v0, $t0
	
	jr $ra
	
####################	

strrev:	
	addiu 	$sp, $sp, -16		# Reserva espaço na stack
	sw 	$ra, 0($sp)			# endereço de retorno
	sw 	$s0, 4($sp)			# Valor dos registos
	sw 	$s1, 8($sp)			# $s0, $s1 e $s2
	sw 	$s2, 12($sp)		
		
	move 	$s0, $a0			# Registo "callee-saved" str
	move 	$s1, $s0			# p1 = str
	move 	$s2, $s0			# p2 = str
	
w3:	
	lb 	$t0, 0($s2)			# *p2
	beq 	$t0, '\0', end1
	
	addiu 	$s2, $s2, 1			# p2++
	
	j 	w3

end1:	
	addiu 	$s2, $s2, -1			# p2--
	
w4:	
	
	bge 	$s1, $s2, end2
	
	move	$a0, $s1
	move	$a1, $s2
	jal 	exchange
	
	addiu 	$s1, $s1, 1			# p1++
	addiu 	$s2, $s2, -1			# p2--
	
	j	w4

end2:	
	move	$v0, $s0
	
	lw 	$ra, 0($sp)			# endereço de retorno
	lw 	$s0, 4($sp)			# Valor dos registos
	lw 	$s1, 8($sp)			# $s0, $s1 e $s2
	lw 	$s2, 12($sp)			
	addiu	$sp, $sp, 16

	jr 	$ra
	
#######################
	
exchange:
	lb 	$t0, 0($a0)			# p1
	lb 	$t1, 0($a1)			# p2
	
	sb	$t0, 0($a1)			# *p2 = *p1
	sb	$t1, 0($a0)			# *p1 = *p2
	
	jr 	$ra
