.global __start

__start:
ORI $t0,0x1
LUI $v0,0xFFFF
ori $v0,0xFFFB
loop:
add $v0,$v0,$t0
sra $v0,$v0,0
BLTZAL $v0,loop
sra $v0,$v0,0
jr $zero
