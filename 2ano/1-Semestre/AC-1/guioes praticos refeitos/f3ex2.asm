# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2 
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
	ori $v0, $0, print_string #print_string("Introduza um numero: "); 
	syscall
	
	ori $v0, $0, read_int
	syscall 
	or $t0, $0, $v0	#value = read_int(); 
	
	la $a0, str2
	ori $v0, $0, print_string #print_string("\nO valor em binário e': "); 
	syscall
	
	li $t2, 0 #i=0
	
for: 	bge $t2, 32, endfor
	li $t3, 0x80000000 	# $t3 = 0x80000000
	and $t1, $t0, $t3	# bit = value & 0x80000000;
	
#b)
	rem $t4, $t2, 4		#(i % 4)
if2:	bne $t4, 0, endif2	#if((i % 4) == 0) 
	
	ori $a0,$0, ' '		#print_char(' ');
	ori $v0, $0, print_char
	syscall
endif2:
	li $t5, 0x80000000
	and $t1, $t0, $t5	#bit = value & 0x80000000;
#
if:	beq $t1, 0, else	# (bit != 0)

	ori $a0,$0, '1'
	ori $v0, $0, print_char	#print_char('1'); 
	syscall
	
	j endif
else:
	ori $a0,$0, '0'
	ori $v0, $0, print_char	#print_char('1');
	syscall 
	
endif:
	sll $t0, $t0, 1	#value = value << 1; sll 1 bit
	addi $t2, $t2, 1	
	j for
endfor:

	jr $ra