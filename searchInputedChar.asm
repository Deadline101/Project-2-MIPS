.data 
	word: .asciiz "anhton"
	character: .asciiz 
	pos: .word -1
	nullChar: .ascii "\0"
	
.text
searchInputedChar:
	li $s0, 0 #set $s0 to 0
	li $s1, '\0'
	jal inputChar
	j searchChar
	
inputChar:
	li $v0,8 #take in input
	la $a0, character #load byte space into address
	li $a1, 2 # allot the byte space for string
	move $t0, $a0 #save string to t0
	syscall
	jr $ra
searchChar:
	
  	lbu $t0, character #take the character entered to $t0
	lbu $t1, word($s0) #take the [$s0] character of the word to $t1
	beq $t0, $t1, returnPos #compare if they are the same, if yes, jump to returnPos
	beq $t1, $s1, returnNull #compare if the character of the word is '\0', if yes, jump to return-1 
	add $s0, $s0, 1 # [$s0] + 1
	j searchChar
	
returnNull:
   #access
   lw $a0, pos
   #modify
   la $a0, pos #get address
   li $a1, -1 #new value for $a1 is -1
   sw $a1, 0($a0) #save new value
   
   	#for debugging
   	#li $v0, 1 
	#lw $a0, pos
	#syscall
   j exit
	
returnPos:
   #access
   lw $a0, pos
   #modify
   la $a0, pos #get address
   move $a1, $s0 #new value for $a1 from $s0 (which is changed if [$t0] != [$s0] in searchChar)
   sw $a1, 0($a0) #save new value
   
   	#for debugging
   	#li $v0, 1 
	#lw $a0, pos
	#syscall
   j exit
	
exit: #donothing
