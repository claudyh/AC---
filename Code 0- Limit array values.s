#Code 0

.data

#test
#tab: .word 30, -10, 50, 130, 80, 40, 20, 60

.text
.globl limpa_inliers

#test
#la $a0, tab
#li $a1, 8 #array size
#li $a2, 25 #lower limit
#li $a3, 80 #upper limit

limpa_inliers:
li $v0, 0
li $t0, 0 #index

inliers:

beq $t0, $a1, EXIT
lw $t1, 0($a0) #t1="30"

li $t2, 0
slt $t2, $t1, $a2 #if t1<lower lim -> doesnt change
beq $t2, 1, next

li $t3, 1
slt $t3, $t1, $a3 #if t1>=upper lim -> doesnt change
beq $t3, 0, next

sw $0, 0($a0) #put value at zero
addi $v0, $v0, 1

next:
addi $t0, $t0, 1
addi $a0, $a0, 4
j inliers

EXIT:
jr $ra

#test
#la $a1, tab
#lw $t4, 28($a1) #28: index 8, number 59, should be 1
#move $a0, $t4 #argument (a0)
#li $v0, 1 #code for print_int
#syscall
