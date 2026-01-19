# CODIGO ALTERADO EM C

# void main(void)
#{
#	unsigned int res=0, i=0, mdor, mdo;
#
# 	print_string("Introduza dois numeros: ");
# 	mdor = read_int() & 0xFFFF;
# 	mdo = read_int() & 0xFFFF;
# 	while( (mdor != 0) && (i < 16) )
# 	{
# 		if( (mdor & 0x00000001) != 0 )
# 			res = res + mdo;
# 		mdo = mdo << 1;
# 		mdor = mdor >> 1;
# 		i++;
# 	}
# 	print_string("Resultado: ");
# 	print_int10(res);
#} 

# mapa de registos
# res = $t0
# i = $t1
# mdor = $t2
# mdo = $t3
	
	.data
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	.text
	.globl main
	
main:
	la $a0, str1
	li $v0, print_string # print_string("Introduza dois numeros: "); 
	syscall
	
	li $v0, read_int
	syscall
	move $t2, $v0		# mdor = read_int()
	andi $t2, $t2, 0xFFFF 	# mdor = read_int() & 0xFFFF;
	
	li $v0, read_int
	syscall
	move $t3, $v0		# mdo = read_int()
	andi $t3, $t3, 0xFFFF 	# mdo = read_int() & 0xFFFF;
	
while: 
	beq $t2, 0, endwhile # (mdor != 0) && (i < 16)
	bge $t1, 16, endwhile
	
	andi $t4, $t2, 0x00000001 # (mdor & 0x00000001)
		
if: 	beq $t4, 0, endif #  (mdor & 0x00000001) != 0 
	
	add $t0, $t0, $t3 # res = res + mdo;	
endif:		

	sll $t3, $t3, 1	# mdo = mdo << 1; 
	srl $t2, $t2, 1	# mdor = mdor >> 1;
	
	addi $t1, $t1, 1	# i++;
				
	j while

endwhile:
	
	la $a0, str2
	li $v0, print_string # print_string("Resultado: "); 
	syscall
	
	move $a0, $t0
	li $v0, print_int10 # print_int10(res); 
	syscall
	
	jr $ra