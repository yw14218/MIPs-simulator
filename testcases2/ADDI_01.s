.global __start

__start:
LUI $t1,0x8000
ORI $t1,0x0001
ADDI $v0,$t1,0xFFFF
sra $v0,24
jr $ra
