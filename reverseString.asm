	.data
tb1:	.asciiz	 "Nhap chuoi: "
tb2: 	.asciiz  "Chuoi dao nguoc: "
strlen:	.word	 0
string:	.space	256
reverseString: .space 256

	.text
	.globl main
main:
	#xuat thong bao1
	li $v0, 4
	la $a0, tb1
	syscall
	
	#nhap chuoi
	li $v0, 8
	li $a1, 256
	la $a0, string
	syscall
	
	#Luu chuoi vua nhap vao $t0
	move $t0, $a0
	#Tao bien dem $t1
	li $t1, 0
	STRLEN:
		lb $t2, 0($t0) #Lay ki ty day tien cua $t0
		beq $t2, '\n', EXIT1 #Kiem tra neu $t2 = '/n' thi ket thuc vong lap
		addi $t1, $t1, 1 #Tang bien dem len 1
		addi $t0, $t0, 1 #Di chuyen $t0 den phan tu tiep theo
		j STRLEN #Lap lai vong lap
	EXIT1:
	
	sw $t1, strlen #Luu gia tri cua $t1 vao strlen
	
	addi $t0,$t0, -1 #Doi $t0 ve phan tu cuoi cung
	la $t3, reverseString #Luu dia chi reverseString vao $t3
	reverse:
		lb $t2, 0($t0) #Luu gia tri byte dau tien cua $t0 
		sb $t2, 0($t3) 
		addi $t3, $t3, 1
		beq $t0, $a0, EXIT2
		addi $t0, $t0, -1
		j reverse
	EXIT2:

	li $v0, 4
	la $a0, reverseString
	syscall
	
	
	
	
	
