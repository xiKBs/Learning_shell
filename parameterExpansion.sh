#!/bin/bash

#Bash Parameter Expansion

${var:-X}
: << EOF
1.:- (Default value – return only.)
2.Agar var unset OR empty ho → X return.
3.Agar var me value ho → wahi return.
4.❌ Assign nahi karta.
EOF


${var:=X}
:<< EOF 
1.:=  (Default + ASSIGN)
2.Agar var unset OR empty ho:
 --> X assign bhi karega.
 --> X return bhi karega.
3.Agar var me value ho → kuch nahi karega.
EOF


${var:+X}
:<< EOF
1.:+  (Alternate value)
2.Agar var set AND non-empty ho → X return.
3.Agar var empty / unset ho → kuch nahi.
4.❌ Assign nahi karta.
EOF


${var:?Error message}
:<< EOF
1.Agar var empty / unset ho → error + script stop.
2.Agar value ho → wahi return.
EOF


${var-X}
:<< EOF
1.- (ONLY hyphen, no colon)
2.Agar var ONLY unset ho → X
3.Agar var empty ho → empty hi rahega
EOF


:<< EOF
🔥 One-look cheat table

  Syntax   Return  Assign  Condition
1.  :-      ✅       ❌     unset OR empty
2.  :=      ✅       ✅     unset OR empty
3.  :+      ✅       ❌     set & non-empty(Like toggle)
4.  :?      ❌       ❌     error if missing
5.  -       ✅       ❌     only unset

EOF
