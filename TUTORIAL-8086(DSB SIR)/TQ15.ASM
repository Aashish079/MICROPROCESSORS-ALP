TITLE DISPLAY LOWERCASE IN LEFT CORNER OF WINDOW
    .MODEL SMALL
.DATA
    MAXLEN   DB 50
    ACTLEN   DB ?
    STRING1  DB 50 DUP('$')
    STARTROW DB 3
    STARTCOL DB 10
    ENDROW   DB 21
    ENDCOL   DB 10

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
         MOV CH,STARTROW
         MOV CL,STARTCOL
         MOV DH,ENDROW
         MOV DL,ENDCOL
         INT 10H

         MOV AH,02H
         MOV BH,00H
         MOV DH,ENDROW
         MOV DL,STARTCOL
         INT 10H

         MOV AH,09H
         LEA DX,STRING1
         INT 21H

         MOV AX,4C00H
         INT 21H

MAIN ENDP
    END MAIN



