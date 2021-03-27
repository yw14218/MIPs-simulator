.global __start

__start:
lui $t1,0x76FF
lui $v1,0x3000
SH $t1,2($v1)
LW $v0,0($v1)
sra $v0,$v0,16
jr $ra
