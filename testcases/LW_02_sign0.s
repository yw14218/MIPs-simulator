.global __start

__start:
lui	$v0,0x3000
lw $v0,0($v0)
sra $v0,$v0,24
jr $ra
