.global __start

__start:
lui $t1,0x8000
addi $v0,$v0,0x200
divu $v0,$t1,$v0
mflo $v0
srl $v0,$v0,20
jr $ra
