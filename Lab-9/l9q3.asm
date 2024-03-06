TITLE DISPLAY AT THE CENTRE OF LINE
;------------------------------------
        .MODEL SMALL
        .STACK 32
        .DATA
MAX_LEN DB 24
ACT_LEN DB ?
STRING DB 24 DUP('$')
NEWLINE DB 0AH, '$'
;------------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 0AH
        LEA DX, MAX_LEN
        INT 21H

        MOV AH,06 ;Request scroll
        MOV AL,01 ;Scroll one line
        MOV BH,0F0H ;Cyan background, black foreground
        MOV CX,0000H ;From row 12, column 25 through
        MOV DX,184FH ; row 18, column 54 (window)
        INT 10H

        MOV CX,0AH
        MOV BH,00 ;Page number 0 (normal)
        MOV DH,00 ;Row 12
NEXT:   MOV AH,02H ;Request set cursor
        MOV DL,39 ;Column 30
        INT 10H ;Call interrupt service

        MOV DL, STRING[BX]
        MOV AH, 02H
        INT 21H
        INC BX
        INC DH
        LOOP NEXT

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN