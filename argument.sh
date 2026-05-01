#!/bin/env bash

#0️⃣basics knowledge:-
:<< EOF
Special Variables for Arguments
Bash gives you built-in variables to access these:
📌 Positional Parameters
  Variable         Meaning
   $0              Script name
   $1              First argument
   $2              Second argument
   $3              Third argument
   ...             and so on
   $#              Number of Arguments
   $*,$@           all arguments

   📌🔥 Key Difference
   Case                $@              $*
   With quotes         Separate args   One combined string
EOF

echo "First arguement is $1"
echo "second arguement is $2"
echo "script name is $0"


#1️⃣argument Handling normal jindagi:-
  
  showValueOfD1() {
        echo value of dollar1 is $1.
  }

  while [[ $# -gt 0 ]]; do
        showValueOfD1 $@
        case $1 in
                --name|-n)
                        name=$2
                        echo name found
                        shift
                        showValueOfD1 $@;;
                 --age|-a)
                        age=$2
                        echo age found
                        shift
                        showValueOfD1 $@;;
                   --*|-*)
                        echo "unknown command $1"
                        exit ;;
        esac
        shift
   done

   echo your details are below:-
   echo name: $name
   echo age : $age


  
#2️⃣argument Handling with mentoss jindagi:-
 
 #Basic Syntax
 Bash
 #!/bin/bash

verbose=false
  while getopts "n:a:v" opt
  do
    case $opt in
      n) name="$OPTARG" ;;
      a) age="$OPTARG" ;;
      v) verbose=true ;;
      ?) echo "Usage: $0 -n name -a age [-v]" ; exit 1 ;;
     esac
   done

  if $verbose; then
    echo "Verbose mode enabled"
  fi
  echo "Name: $name"
  echo "Age: $age"

 #📌If an option does NOT need a value, don’t use :(colon).

🔹 1. Important Concepts
   Term          Meaning
   getopts       Built-in parser
   "n:a:"        Options string
   n             flag -n
   :             means "this option needs a value"
   $opt          current option
   $OPTARG       value of option

   2.Special Variables (VERY IMPORTANT)
   ✅ $OPTARG
   Stores the value of an option
   Example: -f file.txt → OPTARG=file.txt
   ✅ $OPTIND
   Index of next argument to process
   Starts from 1
   Changes automatically(via optind)
   To know more about vi linux/optind.sh



#3️⃣argument handling with mentoss jindagi:-

#When user gives invalid input:

while getopts "ab" opt; do
  case $opt in
    a) echo "Option a" ;;
    b) echo "Option b" ;;
    ?) echo "Invalid option: -$OPTARG" ;;
  esac
done

Example:
Bash: bash script.sh -c
"ab" → only -a and -b are valid
-c → ❌ invalid
👉 So:
opt = ?
OPTARG = c (only in silent mode, otherwise empty)

➡️Terminal: script.sh: illegal option -- c
(via bash only in normal mode)
plus:
your case option: Invalid option: -c (again 'c' in silent mode)
#📌in silent mode bash prints no error it gives you full controll

➡️silent mode: while getopts ":ab" opt; do(colon atbeginning)


#When user gives empty argument:-

while getopts ":a:" opt; do
  case $opt in                    #Silent_mode=true
    a) echo "Value: $OPTARG" ;;
    :) echo "$0: Missing argument for -$OPTARG" ;;
    ?) echo "$0: Invalid option for -$OPTARG";;
  esac
done

#📌:) only works when you use silent mode (: at beginning)
#alway use ':)' prior to '?)'.

Missing argument
Bash: bash script.sh -a
👉 Output:
Missing argument for -a
👉 What happens internally:
opt = :
OPTARG = a (again in silent mode)
✔️ So :) block runs

#Keyconcept: $OPTARG ka value sirf silent mode main defined hota hain.
