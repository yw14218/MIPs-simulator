.global __start

__start:
lui $t2,0xFFDC
ori $t2,0x4300
ori  $v0,$t2,0
jr $ra
