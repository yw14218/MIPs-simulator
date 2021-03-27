.global __start

__start:
lui $v0,0xFFFF
ORI $v0,0xFFFF
BLTZAL $v0,fx
sra $t0,$t0,0
sra $t0,$t0,0
sra $t0,$t0,0
jr $zero

fx:
andi $v0,0x5
jr $ra
