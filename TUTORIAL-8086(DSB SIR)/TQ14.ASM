TITLE DISPLAY UPPERCASE STRING IN WINDOW
    .MODEL SMALL
.DATA
    MAXLEN   DB 100
    ACTLEN   DB ?
    STRING1  DB 100 DUP('$')
    STARTROW DB 2
    STARTCOL DB 10
    ENDROW   DB 22
    ENDCOL   DB 70

.CODE
MAIN PROC FAR
           MOV AX,@DATA
           MOV DS,AX

           LEA DX,MAXLEN
           MOV AH,0AH
           INT 21H

           MOV AH,00H
           MOV AL,03H
           INT 10H

           MOV AH,06H
           MOV AL,00H
           MOV BH,1FH
           MOV CH,STARTROW
           MOV CL,STARTCOL
           MOV DH,ENDROW
           MOV DL,ENDCOL
           INT 10H

           MOV AH,02H
           MOV BH,00H
           MOV DH,STARTROW
           MOV DL,STARTCOL
           INT 10H

           LEA SI,STRING1
           MOV BL,ACTLEN


    REPEAT:
           MOV AL,[SI]
           CMP AL,'a'
           JC  NEXT
           CMP AL,'z'
           JE  DO
           JNC NEXT
    DO:    
           SUB AL,'a'
           ADD AL,'A'
    NEXT:  
           INC SI

           MOV AH,03H
           INT 10H

           CMP DL,ENDCOL
           JNZ SKIP
           INC STARTROW
           MOV AH,02H
           MOV DH,STARTROW
           MOV DL,STARTCOL
           INT 10H


    SKIP:  
           MOV AH,02H
           MOV DL,AL
           INT 21H
            
           DEC BL
           JNZ REPEAT


           MOV AX,4C00H
           INT 21H
MAIN ENDP
           END MAIN
