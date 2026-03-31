#!/bin/bash

#chmod usage - changeMod

#1️⃣ 3. Numeric (Octal) Mode — Core Concept
Each permission has value:
r = 4
w = 2
x = 1
Add them:
Permission   Value
rwx          7
rw-          6
r-x          5
r--          4

Example:
Bash: chmod 755 file
Meaning:
user = 7 → rwx
group = 5 → r-x
others = 5 → r-x



#2️⃣. Symbolic Mode (Flexible)
Instead of numbers:
Bash: chmod u+x file #👉 Adds execute permission to user

More examples:
chmod g-w file     # remove write from group
chmod o=r file     # others only read
chmod u+rwx file   # full access to user

⚡. Pro-Level Tricks -->
📌Combine multiple changes:
Bash: chmod u+x,g-w,o=r file

📌 Copy permissions:
Bash: chmod --reference=file1 file2




