#Code 2

.data

#test
#array: .word 7, 16, 12, 30, 5, 21, 40, 59, 7, 24

.text
.globl manipula_array

#test
#la $a0, array
#li $a1, 10

manipula_array:
li $t3, 0 #counter
li $t1, 1

manipular:
lw $t0, 0($a0) #"7"
beq $t3, $a1, fim #if counter == array size -> end

li $t2, 2
div $t0, $t2
mfhi $t2

beq $t2, $0, zero #if (t0%2)==0 -> zero

um:
sw $t1, 0($a0)
j next

zero:
sw $0, 0($a0)
j next

next:
addi $a0, $a0, 4
addi $t3, $t3, 1
j manipular

fim:
jr $ra

#test
#la $a1, array
#lw $t4, 28($a1) #28: index 8, number 59, should give 1
#move $a0, $t4 #argument (a0)
#li $v0, 1 #code for print_int
#syscall
