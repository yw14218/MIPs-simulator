.global __start

__start:
ORI $t0,0x1
BGEZAL $t0,fx

sra $t0,$t0,0
jr $t1
sra $t0,$t0,0

fx:
ORI $v0,0x11
jr $ra
