.global __start

__start:
LUI $t1,0x6E5B
ORI $t1,0x4C31
LUI $t2,0x0040
ORI $t2,0x0000
SW  $v0,0x18($t2)
LW  $v0,0x18($t2)
jr $ra
