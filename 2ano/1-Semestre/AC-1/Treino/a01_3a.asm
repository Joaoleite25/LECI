	.data
	.text
	.globl main
main: 	ori $v0, $0, 5  	# $v0 = $0 | val_x = val_x
	syscall 		# chamada do read_int()
	or $t0, $0, 
	ori $t2, $0, 8		# $t2 = $0 | 8 = 8
	add $t1, $t0, $t0	# $t1 = x + x = 2 * x
	sub $t1, $t1, $t2	# $t1 = 2 * x - 8
	jr $ra
