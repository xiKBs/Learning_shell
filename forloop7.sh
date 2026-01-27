#!/bin/bash

#Syntax
#1️⃣
for variable in list
do
    commands
done

#Example
for i in 1 2 3 4 5
do
    echo $i
done
#output
#1 to 5 like for loop in python

#Example 2:
#2️⃣Loop Over Words
for word in apple banana mango
do
    echo $word
done
#output apple banana mango


#Different type of for loop like java or c
#3️⃣
for ((i=1; i<=5; i++))
do
    echo $i
done

#4️⃣infinite loop
for ((;;))
do
    echo "Running..."
    sleep 1
done

#5️⃣range based loop
for i in {1..5}
do
    echo $i
done

#6️⃣range based with step 
for i in {1..10..2} #Here 2 is step
do
    echo $i 
done

#7️⃣Loop over array
arr=(10 20 30 40)

for i in "${arr[@]}"
do
    echo $i
done

#8️⃣Loop over files 
for file in *.txt
do
    echo $file
done
#Example
for i in $( cat qr.py) 
do
	echo $i  #It will print content inside that file
done

#break and continue works same as python and other language
#but there is a catch in syntax
[[ $n -lt 0 ]] && continue  #&& should be

#How Bash Actually Expands a for Loop (VERY IMPORTANT)
#Bash processes a for loop in this exact order:
#1.Brace expansion
#2.Parameter expansion
#3.Command substitution
#4.Arithmetic expansion
#5.Word splitting (IFS)
#6.Filename globbing
