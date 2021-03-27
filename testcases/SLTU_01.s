.global __start

__start:
lui $t1,0x8000
lui $t3,0x6000
sltu $t4,$t1,$t3
div $t2,$t3,$t4
jr $ra
