.global __start

__start:
ORI $t0,0x1
ORI $v0,0x1
BEQ $v0,$t0,skip
sra $v0,0
ADDI $v0,$v0,0x1
jr $ra
sra $v0,0
skip:
ADDI $v0,$v0,0x6
jr $ra
