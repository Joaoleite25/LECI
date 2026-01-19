	.data
	
	.eqv	STR_MAX_SIZE, 30
	
str1:	.asciiz 	"I serodatupmoC ed arutetiuqrA"
	.align	2
str2:	.space	31
strerro:	.asciiz	"String too long: " 
mudar:	.asciiz	"\n"

	.eqv	print_int10, 1
	.eqv	print_string, 4
	
	.text
	.globl main
main:	
	la	$t0, str1
	
	
	# STRLEN
strlen:	
	li	$t4, 0			# int len = 0;	

while:
	addu	$t2, $t0, $t4
	lb	$t2, 0($t2)
	beq	$t2, '\0', if		# while(*s++ != '\0')
	
	addiu	$t4, $t4, 1			# len++
	
	j	while
	##
	
if:	
	bgt	$t1, STR_MAX_SIZE, else		# if(strlen(str1) <= STR_MAX_SIZE) { 
	
	
	# STRCPY
	
	la	$t1, str2
	
while2:
	lb	$t2, 0($t0)
	beq	$t2, '\0', endw2
	
	sb	$t2, 0($t1)
	
	addiu	$t0, $t0, 1			
	addiu	$t1, $t1, 1
	
	j	while2
	
endw2:
	
	##
	
	la	$a0, str2
	li	$v0, print_string
	syscall				# print_string(str2); 
	
	la	$a0, mudar
	li	$v0, print_string
	syscall				# rint_string("\n");
	
	
	# STRREV
	
	la	$t0, str2
	addu	$t1, $t0, $t4
	addiu	$t1, $t1, -1
	
	
while4:
	bge	$t0, $t1, endw4
	
	lb	$t2, 0($t0)
	lb	$t3, 0($t1)
	
	sb	$t2, 0($t1)
	sb	$t3, 0($t0)
	
	addiu	$t0, $t0, 1
	addiu	$t1, $t1, -1
	
	j	while4
	
endw4:
	
	##
	
	la	$a0, str2
	li	$v0, print_string
	syscall				# print_string(strrev(str2)); 
	
	li	$t1, 0			# exit_value = 0;
	
	j	skip
	
else:
	la	$a0, strerro
	li	$v0, print_string
	syscall				# print_string("String too long: ");
	
	or	$a0, $0, $t4
	li	$v0, print_int10
	syscall				# print_int10(strlen(str1));
	
	li	$t1, -1			# exit_value = -1; 

skip:	
	la	$a0, mudar
	li	$v0, print_string
	syscall				# rint_string("\n");
	
	or	$a0, $t1, $0
	li	$v0, print_int10
	syscall				# return exit_value;
	
	jr	$ra
	

	
	
# Mapa de Registos:
# $t0 = str1
# $t1 = exit_value
# $t4 = strlen(str1)
# 
# 
# 