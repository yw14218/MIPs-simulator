.global __start

__start:
LUI $t1,0x6E6E
SRA $v0,$t1,0x10
jr $ra
