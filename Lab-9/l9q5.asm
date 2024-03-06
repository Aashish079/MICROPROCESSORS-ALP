;---------------------------------
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
        MOV BH,0F0H ;Cyan background, black foreground
        MOV CX,0000H ;From row 12, column 25 through
        MOV DX,184FH ; row 18, column 54 (window)
        INT 10H

        MOV AH,02H ;Request set cursor
        MOV BH,00 ;Page number 0 (normal)
        MOV DH,00 ;Row 12
        MOV DL,00 ;Column 30
        INT 10H ;Call interrupt service
        
        MOV BX, 00H
        MOV DL, STRING[BX]   ;MOV DL, STRING[BX]
NEXT1:  CMP DL, ' '
        JNE SKIP
        
        ;GET CURSOR STATUS
        MOV AH, 03H
        MOV BH, 00
        INT 10H

        ;SET CURSOR WITH INCREMENTED ROW( FOR NEXT LINE :)  )
        MOV AH, 02H
        INC DH
        INT 10H
        JMP SKIP_PRINT

SKIP:   MOV AH, 02H
        INT 21H
SKIP_PRINT: INC BX
        MOV DL, STRING[BX]
        CMP DL, '$'
        JNE NEXT1

        MOV AX, 4C00H
        INT 21H
MAIN ENDP
      END MAIN