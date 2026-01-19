	.data
xn:	.double 1.0
d1:	.double 0.0		# A RAIZ DE 4 É 2.5
d2:	.double 0.5
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	#---
	
	# x = read_double();
	li	$v0, 7
	syscall
	
	# print_double(xtoy(x,n))
	mov.d	$f12, $f0
	jal	sqrt
	mov.d	$f12, $f0
	li	$v0, 3
	syscall
	
	#---
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

	jr $ra
	
########
# $f12	val
# $f2	xn
# $f4	0.0
# $f6	aux
# $f8	contassss
# $f10 	0.5
# $t1	i
sqrt:
	la $t0, xn
	l.d $f2, 0($t0)	#  xn = 1.0; 
	
	la $t0, d1
	l.d $f4, 0($t0)	# 0.0
	
	la $t0, d2
	l.d $f10, 0($t0)	# 0.5
	
	li $t1, 0 	# int i = 0; 
	
if_sqrt:	
	c.le.d $f12, $f4	# (val > 0.0)	le t
	bc1t else_sqrt
do_sqrt:
	mov.d $f6, $f2	# aux = xn
	
	div.d $f8, $f12, $f2 	# # val/xn
	add.d $f2, $f2, $f8	# xn + val/xn);
	mul.d $f2, $f10, $f2	# xn = 0.5 * (xn + val/xn); 
	
	addiu $t1, $1, 1 # ++ i	
		
	c.eq.d $f6, $f2		# ((aux != xn) 
	bc1t end_while_sqrt
	
	blt $t1, 25, do_sqrt	# # && (i < 25))
end_while_sqrt:
	
	j end_if_sqrt
else_sqrt:

	mov.d $f2, $f4	# xn = 0.0; 
	
end_if_sqrt:
	
	mov.d $f0, $f2	# return xn
	
	jr $ra
