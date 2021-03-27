.global __start

__start:
LUI $t1,0x8000
ORI $t1,0x0001
LUI $t2,0xFFFF
ORI $t2,0xFFFE
ADDU $v0,$t1,$t2
sra $v0,24
jr $ra
