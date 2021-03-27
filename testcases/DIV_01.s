.global __start

__start:
addi $t1,$t1,8
addi $v0,$v0,3
div $t1,$t1,$v0
mfhi $v0
jr $ra
