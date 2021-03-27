.global __start

__start:
lui	$v0,0x2065
ori $v0,0x4310
lui $v1,0x2000
sw $v0,0($v1)
lwl $v0,0($v1)
sra $v0,$v0,24
jr $ra
