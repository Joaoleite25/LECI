	.data
str:	.asciiz "2020 e 2024 sao anos bissextos"
	.eqv print_int10, 1
	.text
	.globl main
	
main:	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	# print_int10( atoi(str) ); 
	la $a0, str
	jal atoi
	
	move $a0, $v0
	li $v0, print_int10
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

	jr $ra
	
#######################################
# $a0: s
# $t0: res
# $t1: *s
# $t2: '0' ; 10 * res
# $t3: digit

atoi:
	li $t0, 0	# res = 0
	
while_atoi:
	lb $t1, 0($a0) # *s
	
	#  (*s >= '0') && (*s <= '9')
	blt $t1, '0', endwhile_atoi
	bgt $t1, '9', endwhile_atoi
	
	# digit = *s - '0';
	li $t2, '0'
	sub $t3, $t1, $t2
	
	addiu $a0, $a0, 1	# s++
	
	#res = 10 * res + digit; 
	mulu $t2, $t0, 10
	addu $t0, $t2, $t3
	
	j while_atoi
	
endwhile_atoi:
	
	move $v0, $t0	# return res; 
	
	jr $ra
