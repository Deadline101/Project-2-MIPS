.data 	
	
	star: .asciiz"*"
	#question: .asciiz"Hellohh"
	name: .asciiz"\nYour name:"
	startMess: .asciiz"\n1. Start. "
	exitMess: .asciiz"\n2. Exit. "
	countinueMess: .asciiz"\n1. New Game. "
	chooseMess: .asciiz"\nChoose:"
	quesMess: .asciiz"\nCan you ghess this word ?\n\t" 
	ghessLetterMess: .asciiz"\n 1. Ghess a letter. "
	ghessWordMess: .asciiz"\n 2. Ghess the word. "
	correctMess: .asciiz"\n You're right. Find next !\n"
	failMess: .asciiz"\n You're wrong. Try again !\n"
	hangmanStatusMess: .asciiz"\n Watch out! You're going to die !!!\n"
	congratulationMess: .asciiz"\nCongratulation ! Next stage !"
	lossMess: .asciiz"\nYou loss! Try again !"
	playAgainMess: .asciiz"\nPlay again. "
	input:	.asciiz	"output.txt"
	EndMess: .asciiz " \n See you later ! \n" 
	character: .asciiz 
	pos: .word -1
	nullChar: .ascii "\0"
	typeMess: .asciiz"Your character: "
	typeWordMess: .asciiz"\nType your answer: " 
	newline: .asciiz "\n"
	strlen1:	.word	0
	strlen2:	.word	0
	dash: .asciiz"-"
	nameNum: 	.byte 10
	fout:  		.asciiz "nguoichoi.txt"      # filename for output
	
    	pic11: .asciiz "\n_____________"
    	pic12: .asciiz "\n|/       |"
    	pic13: .asciiz "\n|"
    	pic14: .asciiz "\n|"
    	pic15: .asciiz "\n|"
    	pic16: .asciiz "\n|"
    	pic17: .asciiz "\n|"
    
    	pic21: .asciiz "\n_____________"
    	pic22: .asciiz "\n|/       |"
    	pic23: .asciiz "\n|        O"
    	pic24: .asciiz "\n|"
    	pic25: .asciiz "\n|"
    	pic26: .asciiz "\n|"
    	pic27: .asciiz "\n|"

    	pic31: .asciiz "\n_____________"
    	pic32: .asciiz "\n|/       |"
    	pic33: .asciiz "\n|        O"
    	pic34: .asciiz "\n|        |"
    	pic35: .asciiz "\n|"
    	pic36: .asciiz "\n|"
    	pic37: .asciiz "\n|"

    	pic41: .asciiz "\n_____________"
    	pic42: .asciiz "\n|/       |"
    	pic43: .asciiz "\n|        O"
    	pic44: .asciiz "\n|       /|"
    	pic45: .asciiz "\n|"
    	pic46: .asciiz "\n|"
    	pic47: .asciiz "\n|"

    	pic51: .asciiz "\n_____________"
    	pic52: .asciiz "\n|/       |"
    	pic53: .asciiz "\n|        O"
    	pic54: .asciiz "\n|       /|\\"
    	pic55: .asciiz "\n|"
    	pic56: .asciiz "\n|"
    	pic57: .asciiz "\n|"

    	pic61: .asciiz "\n_____________"
    	pic62: .asciiz "\n|/       |"
   	pic63: .asciiz "\n|        O"
    	pic64: .asciiz "\n|       /|\\"
    	pic65: .asciiz "\n|       /"
    	pic66: .asciiz "\n|"
    	pic67: .asciiz "\n|"

    	pic71: .asciiz "\n_____________"
    	pic72: .asciiz "\n|/       |"
    	pic73: .asciiz "\n|        O"
    	pic74: .asciiz "\n|       /|\\"
    	pic75: .asciiz "\n|       / \\"
    	pic76: .asciiz "\n|"
    	pic77: .asciiz "\n|"
	
	
	choose: .space 4
	Name: .space 10
	name1: .space 10
	str:	.space	50000
	question: .space 100
	saveQues: .space 100
	tempQues: .space 100
	inputQues: .space 100
	status: .word 0 #save the status of hang man
	point: .space 4
	stage: .space 4
	writePoint: .space 4
	writeStage: .space 4
	
	#from sortFile 
	filename:	.asciiz	"nguoichoi.txt"
	str1:	.space 10000
	resault:	.space 10000
	amount_player:	.word	0
	hundreds:	.word	100
	dozens:	.word	10
	endline:	.asciiz	"\n"
	getTop10PlayerNoti:	.asciiz "\n\nTop 10 highest play\n"
	#
.text
	jal GetStringFromFile # get string to question
	jal Login 
	li $s1,'\0'
	jal PlayGame
	
PlayGame:
	#Show start mess
	li $v0,4
	la $a0,startMess
	syscall
	#show exit mess
	li $v0,4
	la $a0,exitMess
	syscall
	#show choose mess
	la $a0,chooseMess
	li $v0,4
	syscall
	# Type choose
	li $v0,5
	syscall
	#store choose
	move $s0,$v0
	beq $s0,2,out
	#Show quesMess 
nextLevel:
	li $v0,4#for test
	la $a0,question#for test
	syscall#for test
	#show quesMess
	la $a0,quesMess
	li $v0,4
	syscall
	#replace char by star
	li $s0,0
	li $s4,0
	la $s4,tempQues #save tempQues that store star and char
	li $s1,'\0'
ShowStar:
	lbu $t0,question($s0)
	beq $t0,$s1,process
	li $t1,'*'
	sb $t1,0($s4)
	add $s0, $s0, 1
	add $s4, $s4, 1
	j ShowStar
process:
	#Show tempMess
	la $a0,tempQues
	li $v0,4
	syscall
	#show letterMess
	la $a0,ghessLetterMess
	li $v0,4
	syscall
	#show wordMess
	la $a0,ghessWordMess
	li $v0,4
	syscall
	#Show choose mess
	la $a0,chooseMess
	li $v0,4
	syscall
	# Type choose
	li $v0,5
	syscall
	#store choose
	move $s0,$v0
	beq $s0,1,GuessLetter
	beq $s0,2,GuessWord
#GuessLetter----------------------
GuessLetter:
	jal searchInputedChar #process when you choose type a char
	j out
#GuessWord--------------------
GuessWord:
	#show typeWordMess
	la $a0,typeWordMess
	li $v0,4
	syscall
	#type your word
	la $a0,inputQues
	li $v0,8
	syscall
	#standardized inputQues : delete '\n'
	
	li $t2,'\0'
	li $t1,'\n'
	li $s0,0
	li $s1,0
	li $s2,0
	li $s5,0
	la $s2,saveQues
	la $s1,inputQues
ctn:	lbu $t0,question($s0) 
	beq $t0,$t2,addEnd
	#store saveQues with question
	sb $t0,0($s2)
	add $s0,$s0,1
	add $s1,$s1,1
	add $s2,$s2,1
	add $s5,$s5,1
	j ctn
#
addEnd:
	sb $t0,0($s2)
	#replace '\n' by '\0'
	sb $t2,0($s1)
	jal compareStr
	add $s2,$s2,1
	add $s5,$s5,1
	#if equal jump to NextStage else jump to playOrNot
	beq $v0,1,NextStage
	beq $v0,0,playOrNot
#-----------------------------------------------------

#-----------------------------------------------------

Login:
	
TypeName:
	#show type player name mess
	la $a0,name
	li $v0,4
	syscall
	#type player name
	li $v0,8
	la $a0,Name
	li $a1,100
	syscall
	
	
Check:
	#count element
	li $t0,0 #i=0
	la $s0,Name
_Loop:
	lb $t1,($s0)
	#check if char != '\n' then increaCount
	bne $t1,'\n',IncreaCount
	j endLoop
IncreaCount:
	addi $t0,$t0,1
	addi $s0,$s0,1
	j _Loop
endLoop:
	#check num of char
	li $a1,8
	slt $t2,$a1,$t0
	beq $t2,1,TypeName 
	
	#Kiem tra ky tu dac biet
	la $s0,Name
SpecialChar:
	lb $t1, ($s0)
	beq $t1,'\n',countinue
CheckChar1:
	li $a1,'0'
	li $a2,'9'
	slt $t2,$t1,$a1
	slt $t3,$a2,$t1
	or $t4,$t2,$t3

CheckChar2:
	li $a1,'A'
	li $a2,'Z'
	slt $t2,$t1,$a1
	slt $t3,$a2,$t1
	or $t5,$t2,$t3

CheckChar3:
	li $a1,'a'
	li $a2,'z'
	slt $t2,$t1,$a1
	slt $t3,$a2,$t1
	or $t6,$t2,$t3
	and $s1,$t4,$t5
	and $s2,$s1,$t6
	beq $s2,1,TypeName
	addi $s0,$s0,1
	j SpecialChar
#----------------------------------------------------------------
GetStringFromFile:
	#open file
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
	la $s1,question
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
	beq $t0,$a1,GetWord
	j Loop
Loop:
	#Tim dau * trong file
	addi $s0,$s0,1
	lb $t1,($s0)
	beq $t1,'*',check
	j Loop

GetWord:
	addi $s0, $s0,1
	lb $a2,($s0)
	beq $a2,'*',countinue
	sb $a2,($s1)
	addi $s1, $s1, 1
	j GetWord
countinue: 
	jr $ra	
#----Tim 1 char tu chuoi co san tra ve vi tri pos---------------------------------
searchInputedChar:
	li $s0, 0 #set $s0 to 0
	li $s1, '\0'
inputChar:
	la $a0,typeMess
	li $v0,4
	syscall
	li $v0,8 #take in input
	la $a0, character #load byte space into address
	li $a1, 2 # allot the byte space for string
	move $t0, $a0 #save string to t0
	syscall
searchChar:
	
  	lbu $t0, character #take the character entered to $t0
	lbu $t1, question($s0) #take the [$s0] character of the word to $t1
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
   li $s5,1
   lw $s6,status
   add $s5,$s5,$s6
   sw $s5,status
   #for debugging
   la $a0,failMess
   li $v0,4
   syscall
   la $a0,hangmanStatusMess
   li $v0,4
   syscall	
   j PrintHangmanStatus
   beq $s5,7,playOrNot
   #In ra hangman dua vao trang thai
   j searchInputedChar
#da dung s5,s6
returnPos:
   #access
   lw $a0, pos
   #modify
   la $a0, pos #get address
   move $a1, $s0 #new value for $a1 from $s0 (which is changed if [$t0] != [$s0] in searchChar)
   sw $a1, 0($a0) #save new value
   la $a0,correctMess # show mess
   li $v0,4
   syscall
   #print string with '*' and char that found
   li $s1,'\0'
   la $s4,tempQues
   lw $s7,pos
   li $s0,0
loopShowString:
	lbu $t0,question($s0)
	lbu $t3,tempQues($s0)
	beq $t0,$s1,showTempQues
	move $t1,$t3
	beq $s0,$s7,addChar
storeString:
	sb $t1,0($s4)
	#Show 1 star	
	add $s0, $s0, 1
	add $s4, $s4, 1
	j loopShowString
	j searchInputedChar
addChar:
	li $s7,'*'
	sb $s7,question($s0)
	li $t2,0
   	add $t2,$t0,$0
   	sb $t2,0($s4)
	#Show 1 star	
	add $s0, $s0, 1
	add $s4, $s4, 1
	j loopShowString
showTempQues:
	la $a0,tempQues
	li $v0,4
	syscall
	#jal compareStr
	#beq $v0,0,out
	la $a0,newline
	li $v0,4
	syscall
	li $s5,0
checkIfWin:
	lbu $t5,tempQues($s5)
	add $s5,$s5,1
	beq $t5,'*',searchInputedChar
	beq $t5,'\0',NextStage
	j checkIfWin
	j searchInputedChar
   #hi
NextStage:
	lb $a3,point
	add $a3,$a3,$s5   
	add $a3,$a3,-1
	sb $a3,point
	
	
	
	lb $a0,stage
   	addi $a0,$a0,1   
	sb $a0,stage
	
	
NewNextStage:
	lw $a0,point
	li $v0,1
	syscall
	lw $a0,stage
	li $v0,1
	syscall
	li $s5,0
	li $t4,0
	li $t3,0
	li $t7,'\0'
	
	la $t5,question
	la $t4,tempQues
	la $t3,saveQues
ResetString:
	lbu $t6,question($s5)
	add $s5,$s5,1

	bne $t6,'\0',DeleteStar
	beq $t6,'\0',jump
  	j ResetString
DeleteStar:
	sb $t7,0($t5)
	add $t5,$t5,1
	sb $t7,0($t4)
	add $t4,$t4,1
	sb $t7,0($t3)
	add $t3,$t3,1
	j ResetString
jump:
	jal GetStringFromFile
	j nextLevel
PrintHangmanStatus:
    	lw $a0, status
	beq $a0, 1, printPic1
	beq $a0, 2, printPic2
	beq $a0, 3, printPic3
	beq $a0, 4, printPic4
	beq $a0, 5, printPic5
	beq $a0, 6, printPic6
	beq $a0, 7, printPic7


    printPic7:
        la $a0, pic71	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic72	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic73	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic74	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic75	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic76	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic77	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        j playOrNot
    printPic6:
        la $a0, pic61	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic62	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic63	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic64	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic65	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic66	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic67	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
	j searchInputedChar
    printPic5:
        la $a0, pic51	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic52	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic53	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic54	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic55	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic56	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic57	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
    	j searchInputedChar

    printPic4:
        la $a0, pic41	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic42	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic43	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic44	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic45	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic46	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic47	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
    	j searchInputedChar

    printPic3:
        la $a0, pic31	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic32	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic33	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic34	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic35	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic36	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic37	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
    	j searchInputedChar

    printPic2:
        la $a0, pic21	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic22	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic23	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic24	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic25	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic26	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic27	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
    	j searchInputedChar

    printPic1:
        la $a0, pic11	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic12	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic13	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic14	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic15	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic16	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
        la $a0, pic17	# load pic vao $a0
        li $v0, 4	# in ra man hinh pic
        syscall
    	j searchInputedChar
compareStr: #Neu 2 chuoi giong nhau $v0 = 1, nguoc lai $v0 = 0
	#Lay 2 chuoi
	la $s0, saveQues
	la $s1, inputQues
	
	li $t0, 0
	li $t1, 0
	la $a1, newline
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
		la $s0, saveQues
		la $s1, inputQues
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
output:
  ###############################################################
  # Open (for writing) a file that does not exist
  li   $v0, 13       # system call for open file
  la   $a0, fout     # output file name
  li   $a1, 9        # Open for writing (flags are 0: read, 1: write, 9:append)
  li   $a2, 0        # mode is ignored
  syscall            # open a file (file descriptor returned in $v0)
  move $s7, $v0      # save the file descriptor 
  ###############################################################
  # Write to file just opened
  li	$v0, 15       # system call for write to file
  move	$a0, $s7      # file descriptor 
  la	$a1, Name   # address of buffer from which to write
  lb 	$a2, nameNum # hardcoded buffer length from variable
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, dash   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, writePoint   # address of buffer from which to write
  li   $a2, 3       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, dash   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, writeStage   # address of buffer from which to write
  li   $a2, 3       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, newline   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  ###############################################################
  # Close the file 
  li   $v0, 16       # system call for close file
  move $a0, $s7      # file descriptor to close
  syscall            # close file
  jr $ra
  ###############################################################
playOrNot:
	# Xu?t tên ng??i ch?i_?i?m_S? l??t ra màn hình Name,point,stage
	# L?u vào nguoichoi.txt	.
	#Xu?t ra 10 ng??i ?i?m cao nh?t
	#xu?t ra l?u ch?n ti?p t?c hay d?ng 
	#ti?p t?c thì k ph?i l?u tên ng??i ch?i nh?ng reset ?i?m và màn
	li $s0,'\n'
	li $s2,'\0'
	li $s1,0
	sw $s1,status

	la $a1,Name
# add '\o' char to Name
lap:
	lbu $t0,Name($s1)
	beq $t0,$s0,addEndChar
	add $s1,$s1,1
	add $a1,$a1,1
	j lap
addEndChar:
	sb $s2,0($a1)
	#print Name
	la $a0,Name
	li $v0,4
	syscall
	#print dash
	la $a0,dash
	li $v0,4
	syscall
	#print point
	lw $a0,point
	li $v0,1
	syscall
	#print dash
	la $a0,dash
	li $v0,4
	syscall
	#print stage
	lw $a0,stage
	li $v0,1
	syscall
	jal standardized
	jal output
	#show top 10 player
	jal readFile
	jal getTop10Player
	#show top 10 player
	#show mess 
	la $a0,countinueMess
	li $v0,4
	syscall
	la $a0,exitMess
	li $v0,4
	syscall
	la $a0,chooseMess
	li $v0,4
	syscall
	li $v0,5
	syscall
	beq $v0,2,out

	li $t0,0
	li $t1,0
	sb $t1,point
	sb $t0,stage
	beq $v0,1,NewNextStage
	
	j out
readFile:
	li $v0, 13 #Mo file
	la $a0, filename
	li $a1, 0
	li $a2, 0
	syscall 
	move $s0, $v0
	
	li $v0, 14 #Doc file
	move $a0, $s0
	la $a1, str1
	li $a2, 1024
	syscall
	
	li $v0, 16 #Dong file
	move $a0, $s0
	syscall
	
	jr $ra
#----------------------------------------------
standardized:
	li $a2,10
	li $a3,100
	li $s4,'\0'
	
	li $a1,0
	la $a1,writeStage
	lw $t1,stage
	div $t1,$a3
	mflo $t0
	mfhi $t1
	add $t0,$t0,48
	sb $t0,0($a1)
	add $a1,$a1,1
	div $t1,$a2
	mflo $t0
	mfhi $t1
	add $t0,$t0,48
	sb $t0,0($a1)
	add $a1,$a1,1
	add $t1,$t1,48
	sb $t1,0($a1)
	add $a1,$a1,1
	sb $s4,0($a1)

	la $a0,writeStage
	li $v0,4
	syscall
	#//////////////////
	li $a0,0
	la $a0,writePoint
	lw $t0,point
	div $t0,$a3
	mflo $t0
	mfhi $t1
	add $t0,$t0,48
	sb $t0,0($a0)
	add $a0,$a0,1
	div $t1,$a2
	mflo $t0
	mfhi $t1
	add $t0,$t0,48
	sb $t0,0($a0)
	add $a0,$a0,1
	add $t1,$t1,48
	sb $t1,0($a0)
	add $a0,$a0,1
	sb $s4,0($a0)
	la $a0,dash
	li $v0,4
	syscall
	la $a0,writePoint
	li $v0,4
	syscall
	#-----------------
	li $t2,0
	li $t4,0
	li $t6,10
	la $t2,name1
	li $t5,0
	li $s0,0
	li $s1,0
	li $s2,'\0'
	li $t5,0
	li $s3,' '
	#store Name to name
storeNameToname:
	lbu $t4,Name($s0)
	sb $t4,0($t2)
	beq $t4,$s2,add5Space
	add $s0,$s0,1
	add $t2,$t2,1
	j storeNameToname
add5Space:
	sub $t5,$t6,$s0
	add $a0,$t5,0
	li $v0,1
	syscall
	li $t9,' '
	li $a2,0
	li $a1,0
	la $a1,Name
add6:
	sb $t9,0($a1)
	add $a1,$a1,1
	add $a2,$a2,1
	beq $t5,$a2,add7Space
	j add6
add7Space:
	li $s1,0

	#la $t3,Name
	li $t6,9
add7:
	lbu $t4,name1($s1)
	sb $t4,0($a1)
	beq $t4,$s2,endd
	
	add $s1,$s1,1
	add $a1,$a1,1
	j add7
endd:
	la $a0,newline 
	li $v0,4
	syscall
	la $a0,dash 
	li $v0,4
	syscall
	la $a0,Name 
	li $v0,4
	syscall
	jr $ra
#----------------------------------------------
getTop10Player:
	#Lay so luong nguoi choi
	la $s0, str1
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
		
		la $s0, str1 #$s0 luu mang
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
		la $s0, str1
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
	la $a0, str1
	syscall
		
	jr $ra
out:	
	la $a0,EndMess
	li $v0,4
	syscall
	
