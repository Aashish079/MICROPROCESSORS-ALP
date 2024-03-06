TITLE PRINT A STRING IN A WINDOW
;----------------------------------
        .MODEL SMALL
        .STACK 32
        .DATA
STRING DB 'PROGRAMMING IN ASSEMBLY LANGUAGE IS FUN$'
NEWLINE DB 0AH, '$'

;------------------------------------
        .CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
 
        MOV AH,06 ;Request scroll
        MOV AL,00 ;Scroll one line
        MOV BH,0F0H ;REVERSE ATTRIBUTES
        MOV CX,0514H ;From row 5, column 20  through
        MOV DX,143CH ; row 20, column 60  (window)
        INT 10H

        MOV AH,02H ;Request set cursor
        MOV BH,00 ;Page number 0 (normal)
        MOV DH,12 ;Row 12
        MOV DL,30 ;Column 30
        INT 10H ;Call interrupt service
        
        LEA DX, STRING
        MOV AH,09H
        INT 21H

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN