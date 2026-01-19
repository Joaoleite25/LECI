# mapa de registos
# num : $t0
# p : $t1
# *p : $t2

	.data
	.eqv SIZE, 20
str:	.space 21	# 20 + 1
	.eqv read_string,8
	.eqv print_int10,1
	.text
	.globl main
	
main:	
	li $t0, 0	# int num = 0;
	
	la $a0, str
	li $a1, SIZE
	li $v0, read_string # read_string(str, SIZE);
	syscall
	
	la $t1, str	# p = str; 

while: 	
	lb $t2, 0($t1)
	beq $t2, '\0', endwhile	# while( *p != '\0' ) 
	

if:	blt $t2 , '0', endif	#if( (*p >= '0') && 
	bgt $t2 , '9', endif	# (*p <= '9')
	
	addi $t0, $t0, 1 	# num++;
endif:
	addi $t1, $t1, 1	# p++;
	j while
	
endwhile:
	move $a0, $t0 
	li $v0, print_int10	# print_int10(num); 
	syscall

	jr $ra
	
