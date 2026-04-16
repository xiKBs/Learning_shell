#!/bin/bash

#introducing regex- regular exprresion:-




#1️⃣Dot('.'):-
:<< EOF
📌Important Behavior:-
  '.' = exactly ONE character
  It does NOT match:
  Empty space (no character)
  Newline (unless special mode is enabled)

📌you want literal dot (.)
If you actually want to match a real dot, use: '\.'
Example: file\.txt
Matches: file.txt

EOF



#2️⃣asterisk('*'):- 
:<< EOF
📌 ab*: matches its previous char as much as possible.
Matches:
  "a" ✅ (b appears 0 times)
  "ab" ✅
  "abb" ✅
  "abbbb" ✅
  ❌ Does NOT match:
  "b" only (because a is required first) 

📌.* (VERY IMPORTANT ⭐)
  . → matches any character (कोई भी अक्षर)
  * → 0 or more times
  👉 So: 
  .*  =  "anything, any length"
  Matches:
  ""
  "hello"
  "123@#"

  'first '.' matches a character then asterisk repeats dot as long as string is there.'


📌.*? non-greedy
  matches minimum one or we can say first possible match
  ex: string- <a>hello</a>
  bash: grep -E "<.*?>" file.txt
  matches: <a> 'but with greedy it can match entire line"

EOF


#Start of line (^)
Bash: grep "^hello" file.txt
👉 Line must start with "hello"

#End of line ($)
Bash: grep "world$" file.txt
👉 Line must end with "world"

#Character classes:
Bash: grep "[aeiou]" file.txt
👉 Any vowel
Bash: grep "[0-9]" file.txt
👉 Any digit




#3️⃣Character Classes(fucking good):-
  
   👉 Syntax: [ ... ]
   ✔ It matches ONLY ONE character from inside the brackets.

   ✅ Example: [abc]
   → matches: a OR b OR c
   ✔ Important:
   It matches one character at a time
   NOT "abc" together

   2. Range inside Character Class:
   You can define ranges using -
   ✅ Example: [a-z]
   → matches all lowercase letters
   → matches uppercase
   ➡️:[0-9]
   → matches digits

   3. Multiple ranges:
   bash: [a-zA-Z0-9]
   → matches:
   lowercase    #Either
   uppercase
   digits

   4.Negated Character Class
   If you add ^ at the beginning → it means NOT
   ✅ Example: [^a-z]
   → matches anything EXCEPT lowercase letters
   ⚠️ Important:
   ^ means negation ONLY inside []
   Outside → it means start of string

   5.Special Characters Inside []
   bash: [.*+]
   -> matches excactly the same(. or * or +) not special
   ❗ Exceptions (still special):
   ^ → negation (only at start)
   - → range
   ']' → closes class
   \ → escape

   6.Escaping In Character Class
   When needed:
   bash: [\-]
   → matches '-'

   7.Predefined Character Classes (Shortcuts)
   These are very common:
   🔸 \d
   → digit
   \d = [0-9]
   🔸 \D
   → non-digit
   \D = [^0-9]
   🔸 \w
   → word character
   \w = [a-zA-Z0-9_]
   🔸 \W
   → non-word
   \W = [^a-zA-Z0-9_]
   🔸 \s
   → whitespace
   space
   tab
   newline
   🔸 \S
   → non-whitespace

   8.Intersection (Advanced - not in all regex engines):-
   Some regex engines support:
   [a-z&&[^aeiou]]
   → all consonants
   ⚠️ Not supported In basic tools like grep

   📌[a-z]{3}
   → exactly 3 letters

   9.POSIX Character Classes (Linux / Bash):-
   Syntax: [[:class:]]
   Common ones:
    Class           Meaning
    [[:digit:]]     digits
    [[:alpha:]]     letters
    [[:alnum:]]     letters + digits
    [[:lower:]]     lowercase
    [[:upper:]]     uppercase
    [[:space:]]     whitespace
    ex:
    ✅ Example:
    [[:alpha:]]
    → same as [a-zA-Z]

    8.Plus (+):
    "Match the previous character (or group) one or more times"

    9.optional('?'):-
    "Match the previous character 0 or 1 time"
    ✅ Example:
    Regex: colou?r
    Matches:
    ✅ color
    ✅ colour
    ❌ Not match:
    colouur (more than 1 u)
    👉 Because u? = optional

    10.Difference: +, *, ?
    Symbol              Meaning
    +                   1 or more 
    *                   0 or more
    ?                   0 or 1 
