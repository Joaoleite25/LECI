# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2
 	.data
str1: 	.asciiz ...
str2: 	.asciiz ...
 	.eqv print_string,4
 	.eqv ...
 	.eqv ...
 
 	.text
 	.globl main
main: 	la ... # (instrução virtual)
 	li ... # (instrução virtual)
 	syscall # print_string(str1);
 	(...) # value=read_int();
 	(...) # print_string("...");
 	li ... # i = 0
for: 	b?? $t2,...,endfor # while(i < 32) {
 	li $t3,0x80000000 #
 	and $t1,...,... # bit=value & 0x80000000
if: 	b?? $t1,...,else # if(bit != 0)
 	(...) # print_char('1');
else: 	# else
 	(...) # print_char('0');
endif: 	# value = value << 1;
 	# i++;
 	j ... # }
endfor: #
 		jr $ra # fim do programa