
        .data
fout:  		.asciiz "nguoichoi.txt"      # filename for output
name:		.space 10 #for 9-character string
score:		.space 4 #for 3-character number
lives:		.space 2 #for 1-character number
dash:		.ascii "-"
lineEnding: 	.ascii "\n"
nameNum: 	.byte 9
  .text
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
  la	$a1, name   # address of buffer from which to write
  lb 	$a2, nameNum # hardcoded buffer length from variable
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, dash   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, score   # address of buffer from which to write
  li   $a2, 3       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, dash   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, lives   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  
  li   $v0, 15       # system call for write to file
  move $a0, $s7      # file descriptor 
  la   $a1, lineEnding   # address of buffer from which to write
  li   $a2, 1       # hardcoded buffer length
  syscall            # write to file
  ###############################################################
  # Close the file 
  li   $v0, 16       # system call for close file
  move $a0, $s7      # file descriptor to close
  syscall            # close file
  ###############################################################
