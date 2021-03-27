.global __start

__start:
lui $v0,0xFFFF
ORI $v0,0xFFFF
BGEZAL $v0,fx
sra $t0,$t0,0
jr $zero

fx:
lui $v0,0x5
jr $ra
