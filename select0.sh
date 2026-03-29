#!/bin/bash

#0️⃣select syntax

while true
do
    select choice in Start Stop Exit
    do
        case $choice in
            Start)
                echo "Service started"
                break
                ;;
            Stop)
                echo "Service stopped"
                break
                ;;
            Exit)
                echo "Bye!"
                exit 0
                ;;
            *)
                echo "Invalid choice"
                ;;
        esac
    done
done

#output---> 1)Start
#           2)Stop
#           3)Exit
:<< EOF 
#select itself is a loop
EOF


#1️⃣Changing the Prompt (PS3)
:<< EOF
   [PS3 = prompt for select.]

   PS3="Choose a fruit: "
   select fruit in apple mango banana
   do
    echo "You selected $fruit"
   done
#OutPut:
   1) apple
   2) mango
   3) banana
   Choose a fruit:
EOF



#2️⃣Special Variable $REPLY
:<< EOF
select stores the raw user input number in $REPLY.
Example
 select fruit in apple mango banana
 do
    echo "Number chosen: $REPLY"
    echo "Fruit chosen: $fruit"
 done

If user types:3
Output:
Number chosen: 3
Fruit chosen: banana

So:
Variable      Meaning
$fruit        selected item
$REPLY        number typed

EOF


#3️⃣Handling Invalid Input
:<< EOF
If the user types something wrong.
Example:9

Then:fruit=""

Example script:

select fruit in apple mango banana
do
    if [[ -z $fruit ]]
    then
        echo "Invalid choice"
    else
        echo "You selected $fruit"
    fi
done
#'-z checks if variable is empty.'

EOF


#XLR8_BOMBER
