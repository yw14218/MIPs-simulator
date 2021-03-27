.global __start

__start:
ORI $t0,1
LUI $v0,0xFFFF
ori $v0,0xFFFB
loop:
add $v0,$v0,$t0
BLTZ $v0,loop
sra $v0,0
jr $ra
