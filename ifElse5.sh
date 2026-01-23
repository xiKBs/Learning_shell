#!/bin/bash

#If-else statment:-
#syntax

if [ condition1 ]
then
    statements
elif [ condition2 ]  # note Bash doesnot chacks, True or
then                 # false it checks exit status 
    statements       # 0 for true, non-zero for false
else
    statements
fi




#Logical Operators

#1️⃣  Logical AND (&&) 
#condition-1 AND Condition-2 must both be true
if [[ condition1 && condition2 ]]
then
    commands           
fi

#2️⃣  Logical OR (||)
#Condition-1 OR Condition-2 — at least one must be true
if [[ condition1 || condition2 ]]
then
	statements
fi

#3️⃣ Logical NOT (!)  
#Reverses the result
if [[ ! (condition) ]]  #parentheses is optional 
then                    #but use it for clarity
	statement
fi
#example
file="data.txt"

if [[ ! -f "$file" ]]
then
    echo "File does not exist"
fi

#4️⃣ Using Logical Operators with [ ] (Old Style)
[ $a -gt 5 ] && [ $b -lt 10 ]
[ $a -eq 1 ] || [ $b -eq 1 ]
[ $a -gt 5 && $b -lt 10 ]   # ❌ wrong
#Because [ ] does not understand && inside it.
if [ ! -f file.txt ]
then
    echo "File not found"
fi 
#! must be outside the test ✔ It negates the exit status
#it has two operator work inside -o stands for 'or' and 
#-a stands for 'and'.

#5️⃣ Using Logical Operators in Arithmetic (( ))
a=5
b=10

if (( a > 3 && b < 20 ))
then
    echo "Valid"
fi
#or
if (( ! a ))
then
    echo "a is zero"
fi
#or
if (( ! ( a < 1 && b < 1 ) ));then echo "gotch you";fi






# Numeric Comparisons
# -eq for equal
# -ne for not equal
# -gt for greater than
# -lt for less than
# -ge for greater than or equal to
# -le for less than or equal to

# String Comparisons
# = for equal
# != for not equal
# -z for string is empty
# -n for string isn't empty

# File & Directory Tests (Very Important)
# -f file regular file exists
# -d dir directory exists
# -e file file exists
# -r file readable
# -w file writable
# -x file executable

#we can also use commands comparision
if [ "$(uname)" == "Linux" ]
then
	echo "Welcome to Linux"
fi
