#!/bin/bash

:<< EOF
🔥 What is xargs?
👉 xargs is a command that takes input 
(usually from a pipe |)
and converts it into arguments for another command.

Simple idea:-
Instead of:
Bash: command file1 file2 file3
You can do:
Bash: echo "file1 file2 file3" | xargs command

🧠 Why do we need xargs?
Because many commands:
output results line-by-line
but other commands expect arguments
👉 xargs bridges this gap.
EOF

#0️⃣Syntax:-
Bash: command1 | xargs command2
👉 Output of command1 → becomes input arguments for command2

🧪 Example 1: Delete files
Bash: ls *.txt | xargs rm
What happens:
ls *.txt → prints files
xargs rm → deletes them


#1️⃣ SAFETY ISSUE (Very Important)
If filenames contain spaces:
➡️ my file.txt
👉 xargs breaks it into:
1.my
2.file.txt
❌ WRONG behavior

✅ Solution: Use -0 (Zero)
Bash: find . -name "*.log" -print0 | xargs -0 rm
👉 Handles spaces safely


#2️⃣General flags:-

  #1️⃣number of arguments per command:-
  🔧 Useful Options:-
  1. -n → number of arguments per command
  Bash: echo "1 2 3 4 5" | xargs -n 2 echo
  Output:
  1 2
  3 4
  5

  #2️⃣Placeholder -I: if you know then you know
  -I → placeholder
  Bash: echo -e  "file1\nfile2" | xargs -I {} mv {} {}.bak
  👉 Replaces {} with each input


  #3️⃣-p → ask before execution
  Bash: ls *.txt | xargs -p rm
  👉 asks:
  rm file1.txt file2.txt? ...


  #-t → show command before running
  Bash: echo "a b" | xargs -t echo


#⚔️3️⃣ xargs vs while read
Using while:
Bash: cat file.txt | while read line; do
        echo $line
      done

Using xargs:
Bash: cat file.txt | xargs echo
👉 xargs is:
faster ⚡
shorter ✂️
