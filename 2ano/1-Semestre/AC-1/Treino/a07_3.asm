	.data
	.eqv	STR_MAX_SIZE, 30
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space 	31
espaco:	.asciiz	"\n"
str3:	.asciiz	"String too long: "
	.eqv	print_s, 4
	.eqv	print_i, 1
	
	.text
	.globl main
main:	
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la	$a0, str1
	jal	strlen			# strlen(str1)
	
if:	
	bgt 	$v0, STR_MAX_SIZE, else		# if(strlen(str1) <= STR_MAX_SIZE)
	
	la	$a0, str2
	la	$a1, str1
	jal	strcpy			# strcpy(str2, str1); 
	
	move	$a0, $v0
	li	$v0, print_s
	syscall				# print_string(str2);
	
	la 	$a0, espaco
	li	$v0, print_s
	syscall				# print_string("\n"); 
	
	la 	$a0, str2
	jal	strrev			# strrev(str2)
	
	move	$a0, $v0
	li	$v0, print_s
	syscall				# print_string(strrev(str2));
	
	li 	$t0, 0			# exit_value = 0; 
	
	j 	final

else:	
	la 	$a0, str3
	li	$v0, print_s
	syscall				# print_string("\n"); 
	
	la 	$a0, str1
	jal	strlen			# strlen(str1)
	
	move	$a0, $v0
	li	$v0, print_i
	syscall				# print_string(strlen(str1));
	
	li 	$t0, -1			# exit_value = -1; 
	
final:	
	
	move 	$a0, $t0
	li	$v0, print_i
	syscall				# return exit_value;
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra

#####################

strlen:
	li 	$t0, 0
	
w2:	
	lb	$t1, 0($a0)			# *s
	
	beq 	$t1, '\0', endw2
	
	addiu	$t0, $t0, 1			# len++; 
	addiu	$a0, $a0, 1			# *s++ 
	
	j w2

endw2:	
	move 	$v0, $t0			# return len; 
	
	jr	$ra

#####################

strcpy:
	li 	$t0, 0			# i = 0
	
do:	
	addu	$t1, $a0, $t0		# dst[i]
	addu	$t2, $a1, $t0		# src[i]
	lb	$t3, 0($t2)
	sb	$t3, 0($t1)			# dst[i] = src[i];
	
	addi	$t0, $t0, 1			# i++
	
	bne	$t3, '\0', do
	
	move 	$v0, $a0			# return dst;
	
	jr	$ra
	
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
	lb 	$t0, 0($a1)			# p2
	lb 	$t1, 0($a0)			# p2
	
	sb	$t0, 0($a0)			# *p2 = *p1
	sb	$t1, 0($a1)			# *p1 = *p2
	
	jr 	$ra