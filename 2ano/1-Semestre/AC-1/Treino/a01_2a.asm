	.data
	.text
	.globl main
main: 	ori $t0, $0, 2  	# $t0 = $0 | val_x = val_x

	ori $t2, $0, 8		# $t2 = $0 | 8 = 8
	add $t1, $t0, $t0	# $t1 = x + x = 2 * x
	sub $t1, $t1, $t2	# $t1 = 2 * x - 8
	jr $ra