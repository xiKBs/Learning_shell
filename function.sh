#!/bin/bash

#0️⃣Defining a functionn
  my_function() {
    commands       #portable
} 
#         or
  function my_function {
    commands
}


#1️⃣Passing arguments to functions:---->
:<< EOF 
Functions use positional parameters, just like scripts.
 Variable    Meaning
 $1 $2 ...   Arguments
 $#          Number of arguments
 $@          All arguments
 $0          Script name
#Example
 add() {
    echo "First: $1"
    echo "Second: $2"
}
add 10 20

#OutPut:--->
First: 10
Second: 20
EOF


#2️⃣Return value in Bash functions:
:<< EOF
⚠️ Bash functions do NOT return values like Python/C.
✔ return only sends exit status (0–255)

#Example
 check_even() {
    if (( $1 % 2 == 0 )); then
        return 0
    else
        return 1
    fi
}

check_even 4
echo $?

#outPut
0   (success)

📌How to get actual data from function?
---> ✔ Use echo + command substitution
    sum() {
    echo $(( $1 + $2 ))
}

result=$(sum 5 7)
echo "Sum = $result"
EOF


#3️⃣Local vs Global variables
:<< EOF
  ❌ By default → global (all variables are global)
  ¥ To localize, we use 'local' keyboard example is
  given below:-
  func() {
    local x=50
    echo $x
}
func
EOF


#4️⃣Functions and exit status
:<< EOF
  📌 Exit status of last command becomes function’s exitstatus.
  myfunc() {
    ls /not_exist
}

myfunc
echo $?
 
 # Non-Zero---> failure

EOF


