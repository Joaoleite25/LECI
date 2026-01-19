	.data
uvw:
    	.asciiz 	"St1"             	# 10(3+1 + 6) + 2	char a1[10]; 
    	.space	8		# offset
    	.align	4		# +4
    	.double	3.141592653589      	# 8	double g;
    	.word	291, 756               	# 2*4	int a2[2];
    	.byte	'X'		# 1	char v;
    	.space	3		# offset
    	.float 	1.983                	# 8	float k;	
    	
	.eqv	print_float, 2
	.eqv	exit, 10

	.text
	.globl main
main:
	jal	f1
	mov.s	$f12, $f0
	li	$v0, print_float
	syscall			# print_float( f1() );
	
	li	$v0, exit
	syscall			# return 0; 
	
##	f1
f1:	
	la	$t0, uvw
	l.d	$f0, 16($t0)	# s1.g
	lw	$t1, 28($t0)	# s1.a2[1]
	mtc1	$t1, $f2
	cvt.d.w	$f2, $f2		# (double)s1.a2[1]
	
	mul.d	$f0, $f0, $f2	# s1.g * (double)s1.a2[1]
	
	l.s	$f2, 36($t0)	# s1.k
	cvt.d.s	$f2, $f2		# (double)s1.k
	
	div.d	$f0, $f0, $f2	# s1.g * (double)s1.a2[1] / (double)s1.k
	
	cvt.s.d	$f0, $f0		# return (float)(s1.g * (double)s1.a2[1] / (double)s1.k);
	
	jr	$ra