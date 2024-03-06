TITLE DISPLAY20X20
;------------------------------------
        .MODEL SMALL
        .STACK 32
        .DATA
MAX_LEN DB 14
ACT_LEN DB ?
STRING DB 14 DUP('$')
NEWLINE DB 0AH, '$'
;------------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 0AH
        LEA DX, MAX_LEN
        INT 21H

        MOV AH,06 
        MOV AL,00 
        MOV BH,0F0H ;
        MOV CX,0000H ; starting
        MOV DX,1414H ; row 20, column 20 (window)
        INT 10H

        MOV CX,0AH
        MOV BH,00 ;Page number 0 (normal)
        MOV DH,0AH ;Row 12
        MOV AH,02H ;Request set cursor
        MOV DL,0AH ;Column 30
        INT 10H ;Call interrupt service

        LEA DX, STRING
        MOV AH,09H
        INT 21H

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN