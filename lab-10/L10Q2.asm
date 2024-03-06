;Write a program to find the sum of the following series up to the terms specified by the user and display the result in decimal format. (also try to display the sum in Hex format)
;2 x 4 + 3 x 6 + ... to n terms
.MODEL SMALL
.STACK 32H
.DATA 
    MAXLEN DB 10
    ACTLEN DB ?
    NUM DB 10 DUP('$'); STRING OF ASCII NUMBERS ENTERED BY THE USER
    N DW 0 ; HEX CONVERTED NUM
    NUM1 DW 2
    NUM2 DW 4
    RESULT DW 0;
.CODE 
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    ; READ NUM FROM USER
    MOV AH, 0AH
    LEA DX, MAXLEN
    INT 21H

    ;CONVERT INTO HEX
    MOV CH, 00H
    MOV CL, ACTLEN 
    LEA SI, NUM

    CONV:MOV BL, [SI]
    SUB BL, 30H
    MOV AL, 10
    MUL N;
    MOV N, AX;
    MOV BH,00
    ADD N, BX 
    INC SI
    LOOP CONV

    ;Calculate result
    MOV CX, N
    MOV NUM1, 2
    MOV NUM2, 4

    SUM: MOV AX, NUM1
    MUL NUM2
    ADD RESULT, AX
    ADD NUM1, 1
    ADD NUM2, 2
    LOOP SUM

    ;Display Result
    MOV DX, 00
    MOV BX, 10 ;For Decimal Op

    MOV AX, RESULT;

PUSHLOOP:CMP AX, 00
    JE BREAK1
    DIV BX
    PUSH DX
    SUB DX,DX
    INC CX
    JMP PUSHLOOP

BREAK1:POP DX
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    LOOP BREAK1

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN