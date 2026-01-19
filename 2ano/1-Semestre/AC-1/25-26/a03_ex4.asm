	.data

str1:	.asciiz	"Introduza dois numeros: "
str2:	.asciiz	"Resultado: "

	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int10, 1

	.text
	.globl main
main:	
	la	$a0, str1
	ori	$v0, $0, print_string
	syscall			# print_string("Introduza dois numeros: ");
	
	ori	$t0, $0,  0x0F
	
	ori	$v0, $0, read_int
	syscall	
	and	$t1, $v0, $t0	# mdor = read_int() & 0x0F; 
	
	ori	$v0, $0, read_int
	syscall	
	and	$t2, $v0, $t0	# mdo = read_int() & 0x0F; 
	
	ori	$t0, $0, 0		# i = 0
	ori	$t5, $0, 0		# res = 0
	
	ori	$t3, $0, 0x00000001
	
while:	
	beq	$t1, 0, endwhile
	bge	$t0, 4, endwhile	# while( (mdor != 0) && (i < 4) )
	
	and	$t4, $t1, $t3
if:	
	beq	$t4, 0, skip	# if( (mdor & 0x00000001) != 0 ) 
	add	$t5, $t5, $t2	# res = res + mdo;
	
skip:
	sll	$t2, $t2, 1		# mdo = mdo << 1; 
	srl	$t1, $t1, 1		# mdor = mdor >> 1; 
	addi	$t0, $t0, 1		# i++
	
	j 	while
	
endwhile:
	la	$a0, str2
	ori	$v0, $0, print_string
	syscall			# print_string("Resultado: "); 
	
	or	$a0, $0, $t5
	ori	$v0, $0, print_int10
	syscall			# print_int10(res); 
		
	jr	$ra