#!/bin/bash

#while loop syntax
while condition
do
    commands
done

#Example 
while true
do
	echo "something"   #infinite loop
done

#we can also print file's content
cat qr.py | while read line
do
    echo "$line"
done

#with arithmatic
i=10

while (( i > 0 ))
do
    echo $i
    ((i--))
done

#📌 : is a null command → always returns 0
while :
do
    echo "Still running"
done


#until loop works until condition becomes true
i=0
until [ $i -gt 5 ]
do
    echo $i
    ((i++))
done


#Also 'break' and 'continue' work same
