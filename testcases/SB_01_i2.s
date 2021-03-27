.global __start

__start:
lui $t2,0xFFDC
ori $t2,0x4321
lui $t1,0x2000
ori $t1,0x0100
sb $t2,2($t1)
lw $v0,0($t1)
sra $v0,8
jr $ra
