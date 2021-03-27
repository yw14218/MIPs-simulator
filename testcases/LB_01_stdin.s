.global __start

__start:
lui	$v0,0x3000
lb $v0,0($v0)
jr $ra
