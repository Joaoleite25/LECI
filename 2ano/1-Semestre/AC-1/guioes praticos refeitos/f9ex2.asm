	.data
	.eqv read_double, 7
	.eqv print_double, 3
f1:	.double 5.0
f2:	.double 9.0
f3:	.double 32.0
f4:	.double 0.0
f5:	.double 100.0

	.text
	.globl main
	
main:	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $t0, f4	
	l.d $f20, 0($t0)	# ct = 0.0
	
	la $t1, f5
	l.d $f24, 0($t1) 	# 100.0

while: 	c.le.d $f20, $f24	# (ct <= 100.0)
	bc1f endwhile
	
	li $v0, 7	# read_double();
	syscall
	
	mov.d $f12, $f0	# ft = read_double();
	jal f2c		# f2c(ft)
	mov.d $f20, $f0	# ct = f2c(ft); 
	
	mov.d $f12, $f20
	li $v0, print_double	# print_double(ct)
	syscall
	
	j while
endwhile:
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra
	
######
# $f12: double ft ; $f0: return
f2c:	
	la $t0, f1
	l.d $f2, 0($t0) # 5.0
	la $t1, f2
	l.d $f4, 0($t1) # 9.0
	la $t2, f3
	l.d $f6, 0($t2) # 32.0
	
	sub.d $f8, $f12, $f6	# ft – 32.0
	div.d $f10, $f2, $f4	# (5.0 / 9.0 
	mul.d $f0, $f8, $f10	#  5.0 / 9.0 * (ft – 32.0)
	
	jr $ra