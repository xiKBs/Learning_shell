#!/bin/bash

echo "Before while loop OPTIND is $OPTIND"
sleep 0.5
while getopts "ab" opt; do
  echo "OPTIND is $OPTIND"
  sleep 0.5
done

📌Why shift $((OPTIND - 1))?
After parsing options, you may still have positional arguments left.
Bash: shift $((OPTIND - 1))
👉 This removes processed options.

:<< EOF
Initial value of OPTINDS is 1, 
with each move it increase by one
EOF
