.global __start

__start:
LUI $t1,0x00FF
ORI $t1,0xFFFF
ANDI $v0,$t1,0xFFFF
sra $v0,24
jr $ra
