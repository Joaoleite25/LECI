	.data
str:	.space 33
	.eqv MAX_STR_SIZE, 33	# #define MAX_STR_SIZE 33 
	.eqv read_int, 5
	.eqv print_string, 4

	.text
	.globl main

main:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)	# val
	
do:
	li $v0, read_int
	syscall		# read_int();  
	move $s0, $v0	# val = read_int(); 
	
	# itoa(val, 2, str)
	move $a0, $s0
	li $a1, 2
	la $a2, str
	jal itoa
	move $a0, $v0
	li $v0, print_string	# print_string( itoa(val, 2, str) ); 
	syscall
	
	# itoa(val, 8, str)
	move $a0, $s0
	li $a1, 8
	la $a2, str
	jal itoa
	move $a0, $v0
	li $v0, print_string	# print_string( itoa(val, 2, str) ); 
	syscall
	
	# itoa(val, 16, str)
	move $a0, $s0
	li $a1, 16
	la $a2, str
	jal itoa
	move $a0, $v0
	li $v0, print_string	# print_string( itoa(val, 2, str) ); 
	syscall
		
while:	bne $s0, 0, do
	
	lw $ra, 0($sp)
	lw $s0, 0($sp)
	addiu $sp, $sp, 8

	jr $ra
	
################
# $a0: int n ; $a1: int b ; $a2: endereço s
# 
itoa:
	addiu $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)	# n
	sw $s1, 8($sp)	# b
	sw $s2, 12($sp)	# digit
	sw $s3, 16($sp)	# p
	
	move $s0, $a0	# n
	move $s1, $a1	# b
	move $s3, $a2	# char *p = s;
	
do_itoa:	
	rem $s2, $s0, $s1	# digit = n % b;
	div $s0, $s0, $s1	# n = n / b; 
	
	#toascii( digit )
	move $a0, $s2
	jal toascii
	
	# *p = toascii( digit );
	sb $v0, 0($s3)
	
	addi $s3, $s3, 1  # p++
	
while_itoa:	bgt $s0, 0, do_itoa	# while( n > 0 ); 
	
	# *p = '\0'; 
	li $t0, '\0'
	sb $t0, 0($s3)
	
	# strrev( s );
	move $a0, $a2
	jal strrev
	
	# move $v0, $v0
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)	# n
	lw $s1, 8($sp)	# b
	lw $s2, 12($sp)	# digit
	lw $s3, 16($sp)	# p
	addiu $sp, $sp, 20
	
	jr $ra
	
############
# $a0: char v
toascii:
	
	addi $a0, $a0, '0'	# v += '0';
	
if_toascii: ble $a0, '9', endif_toascii	# ( v > '9'
	
	addi $a0, $a0, 7	 # v += 7;

endif_toascii:

	move $v0, $a0	# return v; 

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
	
while1_strrev:	lb $t2, 0($s1)	# (*p2
	beq $t2, '\0', endwhile1_strrev
	
	addiu $s1, $s1, 1		# p2++;

	j while1_strrev
endwhile1_strrev:

	addiu $s1, $s1, -1	# p2--;

while2_strrev:	bge $s0, $s1, endwhile2_strrev	# p1 < p2

	move $a0, $s0
	move $a1, $s1
	jal exchange
	
	addiu $s0, $s0, 1		# p1++; 
	addiu $s1, $s1, -1	# p2--;
	
	j while2_strrev
endwhile2_strrev:

	move $v0, $s2
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	   
	jr $ra
	
######################

exchange:

	lb $t0, 0($a0)
	lb $t1, 0($a1)
	
	sb $t0, 0($a1)
	sb $t1, 0($a0)

	jr $ra
