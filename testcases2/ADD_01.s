.global __start

__start:
LUI $t1,0xFFFF
ORI $t1,0xFFFE
LUI $t2,0xFFFF
ORI $t2,0xFFFD
ADD $v0,$t1,$t2
jr $ra
