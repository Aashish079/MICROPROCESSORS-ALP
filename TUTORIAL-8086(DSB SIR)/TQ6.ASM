TITLE CONVERT TO UPPERCASE OF STRING STORED IN MEMORY
.MODEL SMALL
.DATA
    STRING1 DB "aA5hI54$"

.CODE
MAIN PROC FAR
              MOV AX,@DATA
              MOV DS,AX

              LEA SI,STRING1

    REPEAT:   
              MOV AL,[SI]
              CMP AL,'$'
              JE  ENDOFCHAR ; EXIT
              CMP AL,'a'
              JC  NEXTCHAR
              CMP AL,'z'
              JZ  CONVERT
              JNC NEXTCHAR
    CONVERT:  
              SUB AL,'a'
              ADD AL,'A'
              MOV [SI],AL

    NEXTCHAR: 
              INC SI
              JMP REPEAT

    ENDOFCHAR:
              LEA DX,STRING1
              MOV AH,09H
              INT 21H

              MOV AX,4C00H
              INT 21H

MAIN ENDP
    END MAIN
    


