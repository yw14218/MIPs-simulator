.global __start

__start:
ORI $t0,0x1
ORI $v0,0x5
loop:
sub $v0,$v0,$t0
BGEZAL $v0,loop
sra $v0,$v0,0
jr $zero
