.global __start

__start:
lui $t2,0xFFDC
ori $t2,0x4321
lui $t3,0xFFA9
ori $t3,0x8765
or  $v0,$t2,$t3
jr $ra
