.global __start

__start:
lui $t2,0xFEDC
ori $t2,0x4321
lui $t3,0xCBA9
ori $t3,0x8765
mult $t2,$t3
mfhi $v0
jr $ra
