	.data
str1:	.asciiz "Arquitetura de "
str2:	.space 50 
str3:	.asciiz "\n"
str4: 	.asciiz "Computadores I"
	.eqv print_string, 4
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	# strcpy(str2, str1);
	la $a0, str2	#str2
	la $a1, str1	#str1
	jal strcpy
	
 	# print_string(str2);
 	move $a0, $v0
 	li $v0, print_string
 	syscall
 	
 	# print_string("\n");
 	la $a0, str3
 	li $v0, print_string
 	syscall
 	
 	
 	# strcat(str2, str4)
 	la $a0, str2
 	la $a1, str4
 	jal strcat 
 	
 	# print_string( strcat(str2, "Computadores I") ); 
 	move $a0, $v0
 	li $v0, print_string
 	syscall
 	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra
	
##############
strcat:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	move $t1, $a0
	move $t0, $a0 # char *p = dst;	
	
	
while_strcat: 
	lb $t2, 0($t0)	# *p
	beq $t2, '\0', endwhile_strcat
	
	addiu $t0, $t0, 1	# p++; 
	
	j while_strcat

endwhile_strcat:
	
	move $a0, $t0	#p
	#move $a1, $a1 	#src
	jal strcpy
	
	move $v0, $t1
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra
	
##############
#$a0, $a1 endereços de p e src
strcpy:
	li $t0, 0	# int i=0; 
	
do_strcpy:
	addu $t3, $a1, $t0 	# scr + i
	addu $t4, $a0, $t0 	# dst + i
	lb $t2, 0($t3)		# src[i] 
	sb $t2, 0($t4)		# dst[i] = src[i]; 
	
	addi $t0, $t0, 1
	
while_strcpy: 	bne $t2, '\0', do_strcpy

	move $v0, $a0 	# return dst; 
	
	jr $ra
