#!/bin/bash
#0️⃣In This file we are gonna Learn some trick that definately might help in future:---->


#1️⃣'command' helps us to excute overridden command to run
:<< EOF 
   forces the original command to run.
   ls() {
    command ls --color=auto "$@"
}
   #Here 'command' before ls forces the ls(which is overridden) to run
EOF


#2️⃣Input direction '< or >' it tells the shell where to send input or output:--->
  echo "Hello World" > file.txt  #(overwrites)
                     >> file.txt #(appends)
  #Here echo will go to file.txt instead of printing.

  #Likewise
  while read line
  do echo $line
  done < file.txt
  #Here instead of getting input from keyboard it will -get input from file.txt
:<< EOF
   Symbol       Meaning
   < file       take input from file
   >            write output to file
   >>           append output to file
   <<           here document
EOF


#3️⃣Why pipe creates problem? (deep concept)
:<< EOF
$ cmd1 | cmd2
cmd2 runs in subshell
Subshell = child process
Child variables ≠ parent variables
EOF
