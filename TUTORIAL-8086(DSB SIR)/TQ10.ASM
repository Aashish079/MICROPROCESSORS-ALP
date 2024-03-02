TITLE DISPLAY ASCII CHARS FROM 32 TO 127 ON WINDOW (5,10) AND(20,70)

    .MODEL SMALL
.DATA
    STARTROW   DB 12
    STARTCOL   DB 25
    ENDROW     DB 18
    ENDCOL     DB 54
    COLOUR     DB 1FH
    ASCIISTART DB 32
    ASCIIEND   DB 127

.CODE
MAIN PROC FAR
                MOV AX,@DATA
                MOV DS,AX

                MOV AH,00H
                MOV AL,03H
                INT 10H

                MOV AH,06H
                MOV AL,00H
                MOV CH,STARTROW
                MOV CL,STARTCOL
                MOV DH,ENDROW
                MOV DL,ENDCOL
                MOV BH,COLOUR
                INT 10H

                MOV AH,02H
                MOV BH,00H
                MOV DH,STARTROW
                MOV DL,STARTCOL
                INT 10H


                MOV AL,ASCIISTART
    REPEAT:     
                CMP AL,ASCIIEND
                JE  STOPDISPLAY

                MOV AH,03H
                MOV BH,00H
                INT 10H

                CMP DL,ENDCOL
                JNZ DISP

                ADD STARTROW,1
                MOV AH,02H
                MOV DH,STARTROW
                MOV DL,STARTCOL
                INT 10H


    DISP:       
                MOV DL,AL
                MOV AH,02H
                INT 21H
                INC AL
                JMP REPEAT

    STOPDISPLAY:
                MOV AX,4C00H
                INT 21H

MAIN ENDP
    END MAIN
