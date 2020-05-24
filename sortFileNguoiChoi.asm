	.data
filename:	.asciiz	"nguoichoi.txt"
str:	.space 1024
resault:	.space 1024
amount_player:	.word	0
hundreds:	.word	100
dozens:	.word	10
endline:	.asciiz	"\n"
getTop10PlayerNoti:	.asciiz "Top 10 highest play\n"

	.text
	.globl main
main:
	jal readFile
	jal getTop10Player
	
	li $v0, 10
	syscall

readFile:
	li $v0, 13 #Mo file
	la $a0, filename
	li $a1, 0
	li $a2, 0
	syscall 
	move $s0, $v0
	
	li $v0, 14 #Doc file
	move $a0, $s0
	la $a1, str
	li $a2, 1024
	syscall
	
	li $v0, 16 #Dong file
	move $a0, $s0
	syscall
	
	jr $ra
	
getTop10Player:
	#Lay so luong nguoi choi
	la $s0, str
	li $t0, 0
	getTop10PlayerLoop4: #Lay so nguoi choi
		lb $a0, ($s0)
		addi $s0, $s0, 1
		beq $a0, '\0', getTop10PlayerLoop4Exit #<=> ket thuc chuoi thi thoat khoi loop
		beq $a0, '\n', getTop10PlayerCount #Moi ki tu xuong hang <=> 1 player
		j getTop10PlayerLoop4
		getTop10PlayerCount:
			addi $t0, $t0, 1
		j getTop10PlayerLoop4
	getTop10PlayerLoop4Exit:
	sw $t0, amount_player
	
	
	###########################################################################
	li $t0, 0
	lw $t1, amount_player
	addi $t1, $t1, -1
	getTop10PlayerLoop1:
		beq $t0, $t1, getTop10PlayerLoop1Exit
		
		li $t2, 0 #Tao bien dem cho vong lap 2
		sub $t3, $t1, $t0
		#addi $t3, $t3, -1
		
		la $s0, str #$s0 luu mang
		getTop10PlayerLoop2:
			beq $t2, $t3, getTop10PlayerLoop2Exit
			addi $t2, $t2, 1
			
			#Nguoi choi 1
			lb $a0, 10($s0)
			addi $a0, $a0, -48
			lb $a1, 11($s0)
			addi $a1, $a1, -48
			lb $a2, 12($s0)
			addi $a2, $a2, -48
	
			lw $s3, hundreds	
			mult $a0, $s3		
			mflo $a0	
	
			lw $s3, dozens
			mult $a1, $s3
			mflo $a1
	
			add $s1, $a0, $a1
			add $s1, $s1, $a2
			
			#Nguoi choi 2
			lb $a0, 29($s0)
			addi $a0, $a0, -48
			lb $a1, 30($s0)
			addi $a1, $a1, -48
			lb $a2, 31($s0)
			addi $a2, $a2, -48
	
			lw $s3, hundreds	
			mult $a0, $s3		
			mflo $a0	
	
			lw $s3, dozens
			mult $a1, $s3
			mflo $a1
	
			add $s2, $a0, $a1
			add $s2, $s2, $a2
			
			#So sanh neu nguoi choi thap diem hon nguoi choi ke minh se swap
			sge $s3, $s1, $s2
			beq $s3, $0, getTop10PlayerSwap
			j getTop10PlayerSwapContinue
			getTop10PlayerSwap: #Thuat toan swap chuoi
				li $t4, 0
				li $t5, 18
				
				getTop10PlayerLoop3:
					beq $t4, $t5, getTop10PlayerLoop3Exit
					addi $t4, $t4, 1
					
					lb $a0, ($s0)
					lb $a1, 19($s0)
					move $a2, $a0
					move $a0, $a1
					move $a1, $a2
					sb $a0, ($s0)
					sb $a1, 19($s0)
					
					addi $s0, $s0, 1
					j getTop10PlayerLoop3
				getTop10PlayerLoop3Exit:
				addi $s0, $s0, -18
			getTop10PlayerSwapContinue:
			addi $s0, $s0, 19
			j getTop10PlayerLoop2
			
		getTop10PlayerLoop2Exit:
		addi $t0, $t0, 1
		j getTop10PlayerLoop1
	getTop10PlayerLoop1Exit:
	
	#Xuat thong bao 10 nguoi choi diem cao nhat
	li $v0, 4
	la $a0, getTop10PlayerNoti
	syscall	
	
	lw $t0, amount_player
	li $t1, 10
	slt $t2, $t0, $t1
	beq $t2, 0, getTop10PlayerLogic1 #Neu so luong lon hon 10 nguoi thi lay 10 nguoi
	j getTop10PlayerLogic1Continue #So luong ng choi <= 10 thi khong doi
	getTop10PlayerLogic1: #Neu so luong lon hon 10 nguoi thi lay 10 nguoi
		li $t0, 0
		li $t1, 190
		la $s0, str
		la $s1, resault
		getTop10PlayerLoop5:
			beq $t0, $t1, getTop10PlayerLoop5Exit 
			addi $t0, $t0, 1
			
			lb $a0, ($s0)
			sb $a0, ($s1)
			addi $s0, $s0, 1
			addi $s1, $s1, 1
			
			j getTop10PlayerLoop5
		getTop10PlayerLoop5Exit:
		li $v0, 4
		la $a0, resault
		syscall
		jr $ra
	getTop10PlayerLogic1Continue: #So luong ng choi <= 10 thi khong doi
	
	
	
	li $v0, 4
	la $a0, str
	syscall
		
	jr $ra
	
	
	
	









