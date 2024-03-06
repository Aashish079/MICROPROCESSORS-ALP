;Write a program to add ten 16-bit numbers stored in memory and store and display the result in decimal format.
.MODEL SMALL
.STACK 32H

.DATA
ARR DW 2342,2342,2342,2342,2342,2342,2342,2342,2342,2342

.CODE
    MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 10
    MOV DX, 0 ; CARRY
    MOV AX, 0 ; SUM

    LEA SI, ARR

REPEAT:ADD AX, [SI]
    JNC SKIP
    INC DX
SKIP:INC SI
    INC SI 
    LOOP REPEAT

    ;DISPLAY CODE
    MOV BX, 10D
LOOP1:CMP AX, 0
    JE BREAK1
    DIV BX
    PUSH DX
    SUB DX,DX
    INC CX
    JMP LOOP1

 BREAK1: CMP CX, 0
    JE BREAK2
    POP DX
    ADD DX,30H
    MOV AH, 02H
    INT 21H
    LOOP BREAK1

BREAK2: MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
