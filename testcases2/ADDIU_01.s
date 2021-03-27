.global __start

__start:
LUI $t1,0x8000
ORI $t1,0x0001
ADDIU $v0,$t1,0xFFFE
sra $v0,24
jr $ra
