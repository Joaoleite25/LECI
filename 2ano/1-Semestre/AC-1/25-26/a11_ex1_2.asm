	.data
	.align	2
stg:
    	.space 	4             	# unsigned int id_number (Offset 0)
    	.space	18     		# char first_name [18] (Offset 4). 'N', 'a', 'p', 'o', 'l', 'e', 'a', 'o', '\0' (9 bytes)
    	.asciiz 	"Bonaparte"     	# char last_name [15] (Offset 22). 'B', 'o', 'n', 'a', 'p', 'a', 'r', 't', 'e', '\0' (10 bytes)
    	.space 	5                	# Preenchimento para 15 bytes (Offset 37)
    	.align 	2                	# Alinhamento para o float (Offset 40)
    	.float 	5.1              	# float grade (Offset 40). Ocupa 4 bytes. Total 44.
	
msg_nmec:	.asciiz 	"\nN. Mec: "
msg_nome:	.asciiz 	"\nNome: "
msg_nota:	.asciiz 	"\nNota: "
comma:	.asciiz 	","
	
	.eqv	read_int, 5
	.eqv	read_string, 8
	.eqv	print_int10, 1
	.eqv	print_string, 4
	.eqv	print_char, 11
	.eqv	print_float, 2

	.text
	.globl main
main:
    	la 	$t0, stg             	# $t0 = &stg
    	
    	li 	$v0, print_string
    	la 	$a0, msg_nmec
    	syscall			# print_string("\nN. Mec: "); 
    	
    	li	$v0, read_int
    	syscall			# read_int();
    	sw	$v0, 0($t0)		# stg.id_number = read_int();	
    	
    	li 	$v0, print_string
    	la 	$a0, msg_nome
    	syscall			# print_string("\nNome: "); 
    	
    	addiu	$a0, $t0, 4
    	li	$a1, 17
    	li	$v0, read_string
    	syscall			# read_string(stg.first_name, 17);
    	

    	li 	$v0, print_string
    	la 	$a0, msg_nmec
    	syscall			# print_string("\nN. Mec: "); 
    	lw 	$a0, 0($t0)        
    	li 	$v0, print_int10     	
    	syscall			# print_intu10(stg.id_number); 
    	li 	$v0, print_string
    	la 	$a0, msg_nome
    	syscall			# print_string("\nNome: "); 
    	li 	$v0, print_string
    	addiu 	$a0, $t0, 22   
    	syscall			# print_string(stg.last_name); 
    	li 	$v0, print_char
    	li 	$a0, ','   
    	syscall			# print_char(',');
    	li 	$v0, print_string
    	addiu 	$a0, $t0, 4    
    	syscall			# print_string(stg.first_name);
    	li 	$v0, print_string
    	la 	$a0, msg_nota
    	syscall			# print_string("\nNota: "); 
    	l.s	$f12, 40($t0)      
    	li 	$v0, print_float   
    	syscall			# print_float(stg.grade);

    	jr	$ra
  