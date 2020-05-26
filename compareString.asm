	.data
str0:	.asciiz	"ANH YEU EM\n"
str1:	.space	1024
endline:	.asciiz "\n"
strlen1:	.word	0
strlen2:	.word	0
compareStrNoti1: .asciiz	"Nhap chuoi 1: "
compareStrNoti2: .asciiz	"Nhap chuoi 2: "

	.text
	.globl main
main:
	li $v0, 4
	la $a0, compareStrNoti1
	syscall
	
	li $v0, 8
	la $a0, str0
	li $a1, 1024
	syscall
	
	li $v0, 4
	la $a0, compareStrNoti2
	syscall
	
	li $v0, 8
	la $a0, str1
	li $a1, 1024
	syscall
	
	jal compareStr
	
	move $t0, $v0
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall

compareStr: #Neu 2 chuoi giong nhau $v0 = 1, nguoc lai $v0 = 0
	#Lay 2 chuoi
	la $s0, str0
	la $s1, str1
	
	li $t0, 0
	li $t1, 0
	la $a1, endline
	compareStrLoop1: #Lay do dai chuoi 1
		lb $a0, 0($s0)
		beq $a0, '\0', compareStrLoop1Exit
		addi $t0, $t0, 1
		addi $s0, $s0, 1
		j compareStrLoop1
	compareStrLoop1Exit:
	sw $t0, strlen1 #strlen1 luu do dai chuoi 1
	
	compareStrLoop2: #Lay do dai chuoi 2
		lb $a0, 0($s1)
		beq $a0, '\0', compareStrLoop2Exit
		addi $t1, $t1, 1
		addi $s1, $s1, 1
		j compareStrLoop2
	compareStrLoop2Exit:	
	sw $t1, strlen2 #strlen2 luu do dai chuoi 2
	
	
	
	bne $t0, $t1, compareStrLogic1 #Neu do dai chuoi 1 khac chuoi 2 thi ket thuc ham, $v0 = 0
	j compareStrLogic1Continue
	compareStrLogic1:
		li $v0, 0
		j compareStrEnd
	compareStrLogic1Continue: #Neu do dai chuoi 1 = chuoi 2 thi so sanh tung ki tu	
		la $s0, str0
		la $s1, str1
		li $t0, 0
		lw $t1, strlen1
		compareStrLoop3:
			beq $t0, $t1, compareStrLoop3Exit #Tat ca cac ki tu deu giong nhau thi ket thuch am, $v0 = 1
			lb $a0, ($s0)
			lb $a1, ($s1)
			
			bne $a0, $a1, compareStrLogic1 #Co ki tu khac nhau, $v0 = 0
			addi $s0, $s0, 1
			addi $s1, $s1, 1
			
			addi $t0, $t0, 1 
			j compareStrLoop3
			
		compareStrLoop3Exit:
			li $v0, 1
			j compareStrEnd
		
	compareStrEnd:
	jr $ra

	
	
		
			
	
