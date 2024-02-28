TITLE  to read string from the user (use function that reads string) and display the string in another line
.MODEL SMALL
.STACK 32H
;-------------------------------------------
.DATA
    MAXLEN DB 10
    ACTUALLEN DB ?
    STRING DB 10 DUP('$')
    NEW_LINE DB 0DH, 0AH, "$"
;-------------------------------------------
.CODE
MAIN PROC FAR 
    MOV AX, @DATA
    MOV DS, AX
    ; read string from the user
    MOV AH, 0AH
    LEA DX, MAXLEN
    INT 21H
    ; ADD NEWLINE
    MOV AH, 09H
    LEA DX, NEW_LINE
    INT 21H

    ; display the string
    MOV AH, 09H
    LEA DX, STRING
    INT 21H

    MOV AH, 4CH
    MOV AL, 00H
    INT 21H
    MAIN ENDP
END MAIN

    