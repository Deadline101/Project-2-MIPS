.data
	Ten: .asciiz "Nhap ten nguoi choi: "
	ten: .space 100
	input:	.asciiz	"D:\\KTMT&HN\\DoAn02\\output.txt"
	str:	.space	50000
	chu: .space 10
.text
#Nhap ten nguoi choi
nhapTen:
	li $v0,4
	la $a0,Ten
	syscall
	
	li $v0,8
	la $a0,ten
	li $a1,100
	syscall
	
	
kiemTra:
	#Dem so phan tu
	li $t0,0 #i=0
	la $s0,ten
_Loop:
	lb $t1,($s0)
	#kiem tra neu ki tu khac '\n' thi tang dem
	bne $t1,'\n',tangDem
	j endLoop
tangDem:
	addi $t0,$t0,1
	addi $s0,$s0,1
	j Loop
endLoop:
	#Kiem tra so ky tu
	li $a1,8
	slt $t2,$a1,$t0
	beq $t2,1,nhapTen 
	
	#Kiem tra ky tu dac biet
	la $s0,ten
KyTuDB:
	lb $t1, ($s0)
	beq $t1,'\n',out
kTKyTu1:
	li $a1,'0'
	li $a2,'9'
	slt $t2,$t1,$a1
	slt $t3,$a2,$t1
	or $t4,$t2,$t3

kTKyTu2:
	li $a1,'A'
	li $a2,'Z'
	slt $t2,$t1,$a1
	slt $t3,$a2,$t1
	or $t5,$t2,$t3

kTKyTu3:
	li $a1,'a'
	li $a2,'z'
	slt $t2,$t1,$a1
	slt $t3,$a2,$t1
	or $t6,$t2,$t3
	
	and $s1,$t4,$t5
	and $s2,$s1,$t6
	beq $s2,1,nhapTen
	addi $s0,$s0,1
	j KyTuDB


File:
	#Mo file
 	li $v0, 13
	la $a0, input
	li $a1, 0
	li $a2, 0
	syscall
	
	move $s0, $v0
	
	li $v0, 14
	move $a0, $s0
	la $a1, str
	li $a2, 50000
	syscall
	
	#Random 1 tu trong file
	la $s0,str
	la $s1,chu
	li $a0, 1
setSeed:
	li $v0,30
	syscall
	li $v0,40
	move $a1, $a0
	syscall
random: 
	#random mot dau * trong file
	li $v0,42
	li $a1, 989
	syscall
	beq $a0,$0,random
	
	move $a1,$a0
	li $t0, 0
check:
	addi $t0,$t0,1
	beq $t0,$a1,layChu
	j Loop
Loop:
	#Tim dau * trong file
	addi $s0,$s0,1
	lb $t1,($s0)
	beq $t1,'*',check
	j Loop

layChu:
	addi $s0, $s0,1
	lb $a2,($s0)
	beq $a2,'*',out
	sb $a2,($s1)
	addi $s1, $s1, 1
	j layChu
out:
	li $v0,4
	la $a0,chu
	syscall

	
 	
