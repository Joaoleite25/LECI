	.data
f1:	.float 2.59375
f2:	.float 0.0
	
	.eqv read_int, 5
	.eqv print_float, 2
	.text
	.globl main
	
main:

	la $t1, f1
	la $t2, f2
	l.s $f2, 0($t1) # 2.59375
	l.s $f4, 0($t2) # 0.0
	
do:	
	li $v0, read_int	# read_int();
	syscall	
	move $t0, $v0	# val = read_int();
	
	mtc1 $t0, $f6	# passar (int)val para coproc1 (move to coproc1)
		#CUIDADO O MTC1 PASSA O $T0 -> $F6
	cvt.s.w	$f6, $f6	# convert (int)val (q é word) to (float)val (q é single)
	
	mul.s $f8, $f6, $f2	# res = (float)val * 2.59375; 
	
	# print_float( res );
	mov.s $f12, $f8
	li $v0, print_float
	syscall

	c.eq.s	$f8, $f4
while: 	bc1f do	# while(res != 0.0);
	
	jr $ra
