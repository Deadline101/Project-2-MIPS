.data
    newline: .asciiz "\n"

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


.text

    # đã copy code và did understand these stuff
    lw $a0, numIncorrectGuesses
	beq $a0, 1, printPic1
	beq $a0, 2, printPic2
	beq $a0, 3, printPic3
	beq $a0, 4, printPic4
	beq $a0, 5, printPic5
	beq $a0, 6, printPic6
	beq $a0, 7, printPic7
    jal outGame:

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
        j outGame

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
        j outGame

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
        j outGame

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
        j outGame

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
        j outGame

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
        j outGame

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
        j outGame

outGame:
