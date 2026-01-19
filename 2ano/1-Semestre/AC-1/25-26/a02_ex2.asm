	.data
	
	.text
	.globl main
main:	
	li 	$t0, 0x12345678
	
	sll 	$t2, $t0, 1		# Shift left logical 
	srl 	$t3, $t0, 1		# Shift right logical 
	sra 	$t4, $t0, 1		# Shift right arithmetic
	
	
	ori	$t0, $0, 2
	srl	$t1, $t0, 1		# bin >> 1
	xor	$t1, $t1, $t0	# gray = bin ^ (bin >> 1);
	
	
	or	$t0, $0, $t1	# $t0 = gray
				# $t1 = num
	srl	$t0, $t1, 4		# num >> 4
	xor	$t1, $t1, $t0	# gray = num ^ (num >> 4);
	
	srl	$t0, $t1, 2		# num >> 2
	xor	$t1, $t1, $t0	# gray = num ^ (num >> 2);
	
	srl	$t0, $t1, 2		# num >> 1
	xor	$t1, $t1, $t0	# gray = num ^ (num >> 1);
	
	or	$t2, $t1, $0	# bin = num
	
	jr 	$ra