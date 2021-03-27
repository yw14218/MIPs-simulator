.global __start

__start:
LUI $t1,0xFFFF
ORI $t1,0xFFFF
LUI $t2,0xFFFF
ORI $t2,0xFFFE
AND $v0,$t1,$t2
sra $v0,24
jr $ra
