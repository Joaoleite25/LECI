	.data
	
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"	# static char str1[]="I serodatupmoC ed arutetiuqrA"; 
str2:	.space 31				# static char str2[STR_MAX_SIZE + 1]; 
str3:	.asciiz "\n"
str4:	.asciiz "String too long: "
	.eqv STR_MAX_SIZE, 30			# define STR_MAX_SIZE 30 
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main
# $t0: exit_value
# $s0: str1
# $s1: str2 	
main:
	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	la $s0, str1	# str1
	la $s1, str2	# str2
	
	move $a0, $s0
	jal strlen
	move $t3, $v0 # strlen(str1)
	
if: 	bgt $t3,STR_MAX_SIZE, else	# if(strlen(str1) <= STR_MAX_SIZE)

	move $a0, $s1
	move $a1, $s0
	jal strcpy	# strcpy(str2, str1); 

	move $a0, $v0
	li $v0, print_string	# print_string(str2); 
	syscall
	
	la $a0, str3
	li $v0, print_string	# print_string("\n"); 
	syscall
	
	move $a0, $s1
	jal strrev	# (strrev(str2)
	
	move $a0, $v0	# print_string(strrev(str2));
	li $v0, print_string
	syscall
	
	li $t0, 1	# exit_value = 0; 
	
	j endif
else:
	la $a0, str4
	li $v0, print_string	# print_string("String too long: ");
	syscall
	
	move $a0, $s0
	jal strlen		# strlen(str1)
	move $t4, $v0
	li $v0, print_int10	# print_int10(strlen(str1)); 
	syscall 

	li $t0, -1	# exit_value = -1; 
endif:	
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addiu $sp, $sp, 12
	
	move $v0, $t0	# return exit_value;
	jr $ra
	
##############
#$a0, $a1 endereços de dst e src
strcpy:
	li $t0, 0	# int i=0; 
	
do_strcpy:
	addu $t3, $a1, $t0 	# scr + i
	addu $t4, $a0, $t0 	# dst + i
	lb $t2, 0($t3)		# src[i] 
	sb $t2, 0($t4)		# dst[i] = src[i]; 
	
	addi $t0, $t0, 1
	
while_strcpy: 	bne $t2, '\0', do_strcpy

	move $v0, $a0 
	
	jr $ra
###################################################

strlen:
	li $t1, 0	# int len=0; 
	
while_strlen:	lb $t0, 0($a0)		# *s
	addiu $a0, $a0, 1		# s++
	beq $t0, '\0', endwhile_strlen	# while(*s++ != '\0')
	addi $t1, $t1, 1		# len++; 
	j while_strlen
	
endwhile_strlen:
	move $v0, $t1		# return len
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
