.global __start

__start:
lui $t1,0x8000
lui $v0,0x8000
bne $v0,$t1,loop
addi $t1,$t1,0
srl $v0,$v0,24
jr $ra

loop:
lui $v0,0x6000
srl $v0,$v0,24
jr $ra
