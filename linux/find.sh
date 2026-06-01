#!/bin/env bash

#0️⃣FIND:
:<< EOF
The find command in Linux is used to search files and directories based on conditions  like: name, type, size, permission..

#📌Advanced Concept: Expression Evaluation
find evaluates expressions left → right.
Example:
 Bash: find . -type f -name "*.txt"
 means: if file AND filename matches
EOF


#1️⃣Basic syntax:
Bash: find [path] [condition]

Example:
Bash: find . -name "hello.txt"
Meaning:
. → search in current directory
-name → search by filename
"hello.txt" → target filename


#2️⃣Some Flags:-
 
 #1️⃣Search by Name
 Bash: find . -name "file.txt"
 Finds file.txt.
 #Case-insensitive search
 Bash: find . -iname "file.txt"
 Matches: file.txt, FILE.txt, File.txt, etc.

 
 #2️⃣Search by Type
 #Find only files
 Bash: find . -type f    (f = file)
 #Find only directories
 Bash: find . -type d    (d = directory)


 #3️⃣Search in Specific Directory
 Bash: find /home -name "notes.txt"
 Search only inside /home.


 #4️⃣Find Empty Files
 Bash: find . -empty
 Finds: empty files, empty directories


 #5️⃣Find by Size
 #Bigger than 100 MB
 Bash: find . -size +100M
 #Smaller than 1 KB
 Bash: find . -size -1k
 #Symbols: 
 + → greater than
 - → less than
 no symbol → exact size


 #6️⃣Find by Time
 #Modified in last 1 day
 Bash: find . -mtime -1
 #Modified more than 7 days ago
 Bash: find . -mtime +7
 mtime = modification time

 
 #7️⃣Execute Commands on Results (-exec)

   Bash: find . -name "*.tmp" -exec rm {} \;
   This: finds .tmp files, runs rm on each file

   Understanding {} and \;
   Bash: -exec command {} \;       #we can use xargs
   {} → replaced with found file
   \; → ends the command
   📌without "/;" it stucks

   Example:
   Bash: find . -name "*.txt" -exec echo {} \;
   Suppose it finds:
   Plain text: ./a.txt, ./dir/b.txt
   Internally it runs:
   Bash: echo ./a.txt; echo ./dir/b.txt


   📌\; vs +
   Bash: find . -name "*.tmp" -exec rm {} \;
   Runs:
   Bash
   rm file1
   rm file2
   rm file3
   (one process per file)
   
   Bash: find . -name "*.tmp" -exec rm {} +
   Runs:
   Bash: rm file1 file2 file3
   (fewer processes, usually faster)

 #8️⃣Delete Directly with -delete
 Bash: find . -name "*.tmp" -delete
 Simpler than -exec rm.


 #9️⃣Logical Operators:
  #OR
  Bash: find . \( -name "*.txt" -o -name "*.pdf" \)
  Find .txt OR .pdf   #open bracket groups condition together
                      #escape "\" is necessory
  #AND
  Bash: find . -name "*.txt" -a -size +1M
  Text files AND bigger than 1 MB.
  
  #NOT
  Bash: find . ! -name "*.txt"
  Everything except .txt.


 #1️⃣0️⃣Permission Search
  #Find executable files
  Bash: find . -perm /111
  #Find exact permission
  Bash: find . -perm 644


 #1️⃣1️⃣Depth Control
    #Only current directory
    Bash: find . -maxdepth 1
    #Minimum depth
    Bash: find . -mindepth 2


 #1️⃣2️⃣find files owned by user
   Bash: find . -user krishna

 
 #1️⃣3️⃣-print0
  This solves the "spaces in filenames" problem.
  Suppose file: "my file.txt"
  Normal output:
  Bash: find . -name "*.txt"
  Output: ./my file.txt
  When piped:
  Bash: find . -name "*.txt" | xargs rm
  xargs sees: ./my file.txt
  Wrong!
  Solution:
  Bash: find . -name "*.txt" -print0
  Output becomes: ./my file.txt\0
  \0 = null character (special separator)
  Computers can safely detect it.
