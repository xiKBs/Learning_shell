#!/bin/bash 

#0️⃣What is trap REALLY?
:<< EOF
 In Bash, trap is NOT a loop, NOT a condition.
 trap = a signal catcher
 It tells Bash:---->
“When this signal comes, run THIS code instead of dying suddenly.”
EOF


#Signals — the heart of trap:
:<< EOF
  A signal is a message sent to a process.
  Signal       Name       Meaning
  SIGINT       Interrupt  Ctrl+C
  SIGTERM      Terminate  polite kill
  SIGKILL      Kill,    force kill (❌ can’t be trapped)
  EXIT         Exit       script is exiting

  📌 IMPORTANT
       --->  SIGKILL (kill -9) can NEVER be trapped.
EOF


#Why trap is needed (real reason)
:<< EOF
  Without trap ❌

  while true
do
    echo "Running..."
    sleep 1
done
  
 1)Press Ctrl+C:
 2) Bash sends SIGINT
 3) Script dies immediately
 4) No cleanup
Temporary files, locks, background jobs → ❌ left behind
 6)This is dangerous in real systems.
EOF


#Basic 'trap' syntax:-
:<< EOF
krishna@root#  trap 'commands' SIGNAL

  #always use funtion, in the place of command.

  #if SIGINAL comes run this command or block of command
  #Example 
         trap 'echo Ctrl+C pressed; exit 0' SIGINT
        while true
       do
          echo "Running..."
          sleep 1
       done

       Execution flow:
       1)while loop runs
       2)You press Ctrl+C
       3)Bash sends SIGINT
       4)trap intercepts it
       5)Custom code runs
       6)Script exits gracefully

EOF



#1️⃣Resetting a trap
 trap - SIGINT
 #Meaning:Restore default behavior



#2️⃣Multiple signals in one trap
 trap cleanup SIGINT SIGTERM EXIT
 ✔ One cleanup function
 ✔ Handles everything


 
#3️⃣Why trap + function is BEST PRACTICE
 1)Readable
 2)Maintainable
 3)Reusable
 4)Lock file ALWAYS removed
 5)Even if script crashes
 6)Prevents deadlocks
 #Example:-
:<< EOF
lock="/tmp/my.lock"

cleanup() {
    echo "Removing lock"
    rm -f "$lock"
}

trap cleanup EXIT

touch "$lock"

while true
do
    echo "Job running..."
    sleep 2
done
EOF

