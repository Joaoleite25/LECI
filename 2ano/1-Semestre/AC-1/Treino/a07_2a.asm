	# Mapa de registos:
	# str: $a0 -> $s0 (argumento é passado em $a0)
	# p1: $s1 (registo callee-saved)
	# p2: $s2 (registo callee-saved)
	#
	.data
str:	.asciiz	"TED - orievA ed edadisrevinU"
	
	.eqv	print_s, 4
	
	.text
	.globl main
	
main:	
	addiu 	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la 	$t0, str
	move	$a0, $t0
	jal 	strrev

	move	$a0, $v0
	li	$v0, print_s
	syscall					# print_string( strrev(str) ); 
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	jr 	$ra
	
####################	

strrev:	
	addiu 	$sp, $sp, -16			# Reserva espaço na stack
	sw 	$ra, 0($sp)			# endereço de retorno
	sw 	$s0, 4($sp)			# Valor dos registos
	sw 	$s1, 8($sp)			# $s0, $s1 e $s2
	sw 	$s2, 12($sp)		
		
	move 	$s0, $a0			# Registo "callee-saved" str
	move 	$s1, $s0			# p1 = str
	move 	$s2, $s0			# p2 = str
	
w1:	
	lb 	$t0, 0($s2)			# *p2
	beq 	$t0, '\0', end1
	
	addiu 	$s2, $s2, 1			# p2++
	
	j 	w1

end1:	
	addiu 	$s2, $s2, -1			# p2--
	
w2:	
	
	bge 	$s1, $s2, end2
	
	move	$a0, $s1
	move	$a1, $s2
	jal 	exchange
	
	addiu 	$s1, $s1, 1			# p1++
	addiu 	$s2, $s2, -1			# p2--
	
	j	w2

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