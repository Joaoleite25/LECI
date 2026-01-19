	.data
str1:	.asciiz	"Arquitetura de "
str2:	.space	50
espaco:	.asciiz	"\n"
str3:	.asciiz	"Computadores I"
	.eqv 	print_s, 4
	
	.text
	.globl main
main:	
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la	$a0, str2
	la	$a1, str1
	jal	strcpy				# strcpy(str2, str1); 
	move	$t0, $v0
	
	move	$a0, $t0
	li	$v0, print_s
	syscall					# print_string(str2); 
	
	la	$a0, espaco
	li	$v0, print_s
	syscall					# print_string("\n"); 
	
	move	$a0, $t0
	la	$a1, str3
	jal	strcat				# strcat(str2, "Computadores I")
	
	move	$a0, $v0
	li	$v0, print_s
	syscall					# print_string( strcat(str2, "Computadores I") ); 
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
	
###############################	

strcat:	
	addiu	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	
	move 	$s0, $a0			# dst
	move	$t0, $s0			# p
	
while1:	
	lb	$t1, 0($t0)			# *p
	
	beq	$t1, '\0', endw1		# while(*p != '\0')
	
	addiu	$t0, $t0, 1			# p++;
	
	j	while1

endw1:	
	move	$a0, $t0
	move	$a1, $a1
	jal	strcpy				# strcpy(p, src); 
	
	move	$v0, $s0			# return dst;
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addiu	$sp, $sp, 8
		
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
	