	.data
str:	.asciiz "TED - orievA ed edadisrevinU"
	.eqv print_string, 4
	.text
	.globl main
	
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $t0, str
	move $a0, $t0
	jal strrev
	
	move $a0, $v0
	li $v0, print_string
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	

	jr $ra
	
############

strrev:
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s2, $a0	# str
	move $s0, $s2	# char *p1 = str;
	move $s1, $s2	# char *p2 = str;
	
while1:	lb $t2, 0($s1)	# (*p2
	beq $t2, '\0', endwhile1
	
	addiu $s1, $s1, 1		# p2++;

	j while1
endwhile1:

	addiu $s1, $s1, -1	# p2--;

while2:	bge $s0, $s1, endwhile2	# p1 < p2

	move $a0, $s0
	move $a1, $s1
	jal exchange
	
	addiu $s0, $s0, 1		# p1++; 
	addiu $s1, $s1, -1	# p2--;
	
	j while2
endwhile2:

	move $v0, $s2
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	   
	jr $ra
	
######################

exchange:

	lb $t0, 0($a0) 	# *c1
	lb $t1, 0($a1)	# *c2
	
	sb $t0, 0($a1)	# 
	sb $t1, 0($a0)

	jr $ra
