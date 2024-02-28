TITLE TO DISPLAY the same string using character reading function (use current address operator $ to count the no of characters

.MODEL SMALL
.STACK 32H
;-------------------------------------------
.DATA
    STRING DB "Programming is fun"
    LEN DW $-STRING
;-------------------------------------------
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, LEN
    LEA BX, STRING
DISP: MOV AH, 02H
    MOV DL, [BX]
    INT 21H
    INC BX
LOOP DISP

    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN