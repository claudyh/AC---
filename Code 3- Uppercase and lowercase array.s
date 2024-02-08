#Code 3

.data

#test
#str: .asciiz "Mini-Teste1 treino AC"
#array: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.text
.globl codstring

#test
#la $a0, str
#la $a1, array
#li $a2, 21

codstring:
li $t1, 0 #index
li $t2, 65
li $t3, 90
li $t5, 1
li $v0, 0 #count uppercase letters

cod:
beq $t1, $a2, fim
lb $t0, 0($a0) #"M"

li $t4, 0
slt $t4, $t0, $t2 #t0<65 -> t4=1 (lowercase)
slt $t4, $t3, $t0 #90<t0 -> t4=1 (lowercase)
beq $t4, 1, minuscula

maiuscula:
sw $0, 0($a1)
addi $v0, $v0, 1
j next

minuscula:
sw $t5, 0($a1)
j next

next:
addi $t1, $t1, 1
addi $a0, $a0, 1
addi $a1, $a1, 4
j cod

fim:
jr $ra

#test
#move $a0, $v0 #argument (a0)
#li $v0, 1 #code for print_int
#syscall

#test
#la $a3, array
#lw $t6, 4($a3) #28: index 8, number 59, should be 1
#move $a0, $t6 #argument (a0)
#li $v0, 1 #code for print_int
#syscall
