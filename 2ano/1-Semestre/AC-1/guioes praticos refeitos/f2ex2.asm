	.data
	.text
	.globl main
	
main:
	li $t0, 0x12345678
	
	sll $t2, $t0, 1  	#shift left logical
				#$t2 = $t0 << 1
	srl $t3, $t0, 1		#shift right logical
				#$t3 = $t0 >> 1
	sra $t4, $t0, 1		#shift right arithmetic
				#$t4 = $t0\2^1
	
#d)
#mapa de registos
# $t0 = bin
# $t1 = gray
	srl $t1, $t0, 1		#$t1 = $t0 >> 1		
	and $t1, $t0, $t1	#$t1 = $t0 ^ $t1	

#e)
#mapa de registos
# $t0 = gray
# $t1 = num
# $t2 = bin
	or $t1, $0, $t0		# num = gray
	srl $t1, $t1, 4		# num = num >> 4		
	and $t1, $t1, $t1	# num = num ^ num
	srl $t1, $t1, 2		# num = num >> 2		
	and $t1, $t1, $t1	# num = num ^ num
	srl $t1, $t1, 1		# num = num >> 1		
	and $t1, $t1, $t1	# num = num ^ num
	or $t2, $0, $t1
	jr $ra
	