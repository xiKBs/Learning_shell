#!/bin/bash

#0️⃣Global Regular Expression Print
:<< EOF
👉 It searches text and prints matching lines.
🔥 Important Options
Option   Meaning
-i       ignore case
-n       show line number
-v       invert match (NOT match) #line without matched "word"
-r       recursive search
-E       extended regex
-c       Outputs number of matching lines
-w       👉 Matches: cat✅ ❌ Not:scatter,category
-x       Entire line must match exactly
-m3      Stops after 3 matches
-I       Ignore binary files


🔍 How it works internally:-
Reads input (STDIN or file)
Applies Regular Expression (Regex)
Outputs matching lines to STDOUT
EOF



#1️⃣Basic syntax:-
bash: grep "word|words && andnextword" file.txt
👉 Prints lines containing "hello"



#2️⃣Recursive search:
:<< EOF
bash: grep -r "pattern" directory/
👉 Searches inside all files recursively
Example:
Bash: grep -r "main" .  #'.' stands for current directory.
👉 Searches "main" in current directory

📌Show filename:
Bash: grep -rH "main" .
📌Only filenames:
Bash: grep -rl "main" .

⚖️ Key Difference
Command               Output
grep -rH "main" .     filename + matching line
grep -rl "main" .     only filenames
EOF



#3️⃣Output Control
Show only matching part:
Bash: grep -o "pattern" file.txt
📌If multiple matches exist in the same line → it prints each separately
example: for email grep or number grep(using regex)



#4️⃣Show context
📌Before lines:
Bash: grep -B 2 "error" file.txt
output: matching + till 2 line before
📌After lines:
Bash: grep -A 2 "error" file.txt
output: matching + till 2 line after
📌Both:
Bash: grep -C 2 "error" file.txt
output: Shows 2 lines BEFORE + 2 lines AFTER + matched



#5️⃣Use multiple patterns:
Bash: grep -e "cat" -e "dog" file.txt 


#6️⃣From file:
Bash: grep -f patterns.txt file.txt
👉 patterns.txt contains:
cat
dog
bird

#7️⃣Performance Optimization
Use fixed string (fast):
Bash: grep -F "hello" file.txt
👉 No regex → faster

#8️⃣Find empty lines:
Bash: grep "^$" file.txt


