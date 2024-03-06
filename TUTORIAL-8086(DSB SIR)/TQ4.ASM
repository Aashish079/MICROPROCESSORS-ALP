TITLE TAKE STRING INPUT AND CONVERT INTO UPPERCASE

.MODEL SMALL
.STACK 32H
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STRING1 DB 50 DUP('$')

.CODE
MAIN PROC FAR
           MOV  AX,@DATA
           MOV  DS,AX
            ;INPUT STRING
           LEA  DX,MAXLEN
           MOV  AH,0AH
           INT  21H
            ;SETTING STRING POINTERS
           LEA  SI,STRING1
           MOV  CL,ACTLEN; SET LENGTH OF THE STRING
           MOV  CH,00H

    REPEAT:
           MOV  AL,[SI]
           CMP  AL,'a'
           JC   SKIP
           CMP  AL,'z'
           JE   DO
           JNC  SKIP
    DO:    
           SUB  AL,'a' ;CONVERTING INTO UPPERCASE
           ADD  AL,'A'
           MOV  [SI],AL
    SKIP:  
           INC  SI 
           LOOP REPEAT

            ;NEW LINE
           MOV  AH,02H
           MOV  DL,0AH
           INT  21H
            ;DISPLAY STRING
           LEA  DX,STRING1
           MOV  AH,09H
           INT  21H

           MOV  AX,4C00H
           INT  21H

MAIN ENDP
    END MAIN
    


