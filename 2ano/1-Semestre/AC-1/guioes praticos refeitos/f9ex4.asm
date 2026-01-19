	.data
a:	.space 80 # 10 * 8
str:	.asciiz "\n"
d1:	.double 0.0
	.eqv SIZE, 10
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv print_string, 4
	.text
	.globl main

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
 	li $t0, 1	# i = 0
for:	bge $t0, SIZE, end_for	# i < SIZE
	
	li $v0, read_double
	syscall			# read_double()
	
	la $t1, a
	mulu $t2, $t0, 8		# i * 8
	addu $t1, $t1, $t2	# a + i
	s.d $f0, 0($t1)		# a[i] = read_double();
	
	addiu $t0, $t0, 1		# i++
	j for
end_for:	
	# average(a, SIZE)
	la $a0, a
	li $a1, SIZE
	jal average
	mov.d $f12, $f0
	li $v0, print_double	# print_double( average(a, SIZE) )
	syscall
	
	# print \n
	la $a0, str
	li $v0, print_string
	syscall
	
	# max(a, SIZE)
	la $a0, a
	li $a1, SIZE
	jal max
	mov.d $f12, $f0
	li $v0, print_double	# print_double( max(a, SIZE) )
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

##############
# Mapa de Registos
# p:	$a0
# n:	$a1
# u: 	$t0
# max:	$f2
# *p:	$f4

max:	
	# double *u = p+n–1; 
	# double *u = p + (n–1)*size_of(double); 
	addiu $t0, $a1, -1	# n–1;
	mulu $t0, $t0, 8 		# (n–1)*size_of(double)
	addu $t0, $a0, $t0	#  double *u = p + n–1; 
	
	l.d $f2, 0($a0)		# max = *p
	addiu $a0, $a0, 8		# p++	
	
for_max:	
	bgt $a0, $t0, end_for_max	#  (p <= u)
	
	l.d $f4, 0($a0)	# *p
if_max:	c.lt.d	$f4, $f2	# *p > max
	bc1t end_if_max	
	
	mov.d $f2, $f4	# max = *p; 

end_if_max:

	addiu $a0, $a0, 8		#p++
	
	j for_max
	
end_for_max:

	mov.d $f0, $f2	# return max
	jr $ra
	
#################
# Mapa de registos
# array:	$a0
# n	$a1 ========== SIZE
# i	$t0 	
# sum	$f2
# array[i] $f4
# double(n) $f6
average:
	addi $t0, $a1, -1	# int i = n-1;
	la $t1, d1
	l.d $f2, 0($t1)	# double sum = 0.0; 

for_average:
	blt $t0, 0,  end_for_average	# for(; i >= 0; i--) 
	mul $t2, $t0, 8	# i * 8 
	addu $t2, $a0, $t2	
	l.d $f4, 0($t2)		# array[i*8]
	add.d $f2, $f2, $f4	# sum += array[i*8];
	
	addiu $t0, $t0, -1	# i--	
	j for_average
end_for_average:
	
	mtc1 $a1, $f6
	cvt.d.w $f6, $f6		# double(n)
	
	div.d $f0, $f2, $f6	 # return sum / (double)n
	jr $ra