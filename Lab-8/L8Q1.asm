TITLE to display a string "Programming is Fun" in the screen using string displaying function
.MODEL SMALL
.STACK 32H
;-------------------------------------------
.DATA 
    TEXT DB "PROGRAMMING IS FUN $"
;-------------------------------------------
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, TEXT
    INT 21H

    MOV AX, 4C00H
    INT 21H

    MAIN ENDP
END MAIN


