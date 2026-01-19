# CODIGO EM C
#void main(void)
#{
#	unsigned int value, bit, i;
#
# 	print_string("Introduza um numero: ");
# 	value = read_int();
# 	print_string("\nO valor em binário e': ");
# 	i=0;
#	flag=0;
#	do
#	{
#		bit = value >> 31;
# 		if(flag == 1 ||bit != 0)
# 		{
# 			flag = 1;
#		 	if((i % 4) == 0)
# 				print_char(' ');
# 			print_char(0x30 + bit);
# 		}
# 		value = value << 1; // shift left de 1 bit
# 		i++
# 	
# 	}while (i < 32)
#} 
#######################	

# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2
# flag : $t6

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binário e': "
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_char, 11
	.text
	.globl main
	
main:
	la $a0, str1
	li $v0, print_string #print_string("Introduza um numero: "); 
	syscall
	
	li $v0, read_int
	syscall 
	or $t0, $0, $v0	#value = read_int(); 
	
	la $a0, str2
	li $v0, print_string #print_string("\nO valor em binário e': "); 
	syscall
	
	li $t2, 0 # i=0
	li $t6, 0 # flag=0
	
do: 	
	srl $t1, $t0, 31		# bit = value >> 31; 

	beq $t6 , 1, if3		# flag == 1 || bit != 0
	beq $t1,0, endif3
if3:
	li $t6, 1		#flag = 1; 
	
	rem $t4, $t2, 4		#(i % 4)
if2:	bne $t4, 0, endif2	#if((i % 4) == 0) 
	
	li $a0, ' '		#print_char(' ');
	li $v0, print_char
	syscall

endif2:
	addi $t7, $t1, 0x30 	# 0x30 + bit
	or $a0, $0, $t7
	li $v0, print_char	# print_char(0x30 + bit);
	syscall

endif3:
	sll $t0, $t0, 1		#value = value << 1; sll 1 bit
	addi $t2, $t2, 1		# i++
	blt $t2, 32, do		# while(i < 32)
	


	jr $ra		