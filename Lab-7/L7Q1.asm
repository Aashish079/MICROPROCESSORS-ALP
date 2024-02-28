;Write an assembly language program to sum numbers from 0 to 255.
TITLE to sum numbers from 0 to 255
.MODEL SMALL
.STACK 100H
;---------------------------------------------------------
.DATA
    count DW 0FFH
    init DW 0000H
;---------------------------------------------------------
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, count
    MOV AX, init
    MOV BX, init

SUM_LOOP :
    ADD AX, BX
    INC BX
    LOOP SUM_LOOP
    
    MOV DX, AX

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

