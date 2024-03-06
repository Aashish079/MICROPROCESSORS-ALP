TITLE DISPLAY IN CENTER
;------------------------------------
        .MODEL SMALL
        .STACK 32
        .DATA
MAX_LEN DB 60
ACT_LEN DB ?
STRING DB 60 DUP('$')
NEWLINE DB 0AH, '$'

;------------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
 
        MOV AH, 0AH
        LEA DX, MAX_LEN
        INT 21H
;DISPLAY CLEAR 
        MOV AH,06 
        MOV AL,00 
        MOV BH,0F0H 
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
;SET CURSOR
        MOV AH,02H ;Request set cursor
        MOV BH,00 ;Page number 0 (normal)
        MOV DH,12 ;Row 12
        MOV DL,39 ;Column 30
        INT 10H ;Call interrupt service
                
        LEA DX, STRING
        MOV AH,09H
        INT 21H

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN