#Code 1

.data

#test
#str: .asciiz "Arquitetura de Computadores"

.text
.globl codifica_string

#test
#la $a0, str

codifica_string:
li $t1, 0 #index
codificar:
lb $t0, 0($a0) #t0= "A"
beq $t0, $0, fim #if t0="\n" -> end

li $t2, 2
div $t1, $t2
mfhi $t2

beq $t2, $0, par

impar:
addi $t0, $t0, -2
sb $t0, 0($a0)
j next

par:
addi $t0, $t0, 2
sb $t0, 0($a0)
j next

next:
addi $a0, $a0, 1
addi $t1, $t1, 1
j codificar

fim:
jr $ra

#test
#la $a1, str
#move $a0, $a1 #argument (a0)
#li $v0, 4 #code for print_str
#syscall
