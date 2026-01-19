	.data
	
	
	.text
	.globl main

main:	
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	li	$v0, 5
	syscall				# read(dividendo)
	move	$t0, $v0			
	
	li	$v0, 5
	syscall				# read(divisor)
	move	$t1, $v0			
	
	move	$a0, $t0
	move	$a1, $t1
	jal	u_div			# div(dividendo, divisor);
	
	move	$a0, $v0		
	li	$v0, 1
	syscall				# print(resto)
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr 	$ra
	
#########################

u_div:	
	addiu	$sp, $sp, -12
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	
	move	$s0, $a0			# dividendo
	move	$s1, $a1			# divisor
	
	sll	$s1, $s1, 16		# divisor = divisor << 16;
	
	andi	$s0, $s0, 0xFFFF		# (dividendo & 0xFFFF)
	sll	$s0, $s0, 1			# dividendo = (dividendo & 0xFFFF) << 1;
	
	li	$t0, 0			# i = 0
	
div_for:	
	bge	$t0, 16, div_end		# for(i=0; i < 16; i++) 
	
	li	$t1, 0			# bit = 0;
	
div_if:	
	blt	$s0, $s1, div_fim		# if(dividendo >= divisor)
	
	subu	$s0, $s0, $s1		# dividendo = dividendo - divisor; 
	
	li 	$t1, 1			# bit = 1; 

div_fim:	
	sll	$t2, $s0, 1			# (dividendo << 1)
	or	$s2, $t2, $t1		# dividendo = (dividendo << 1) | bit; 
	
	addi	$t0, $t0, 1			# i++
	
	j	div_for
	
div_end:	
	srl	$t2, $s0, 1			# (dividendo >> 1)
	li	$t4, 0xFFFF0000
	and	$t3, $t2, $t4 		# resto = (dividendo >> 1) & 0xFFFF0000; 
	
	andi	$t4, $s0, 0xFFFF		# quociente = dividendo & 0xFFFF;
	
	or	$v0, $t3, $t4		# return (resto | quociente); 
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	addiu	$sp, $sp, 12
	
	jr	$ra