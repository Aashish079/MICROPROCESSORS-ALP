;Write a program to find the sum of square of odd numbers(upto 255). Read n from the user and display the sum as the decimal format. (also try to display the sum in Hexadecimal format)
.MODEL SMALL
.STACK 32H
.DATA
    MAXLEN DB 10
    ACTLEN DB ?
    NUM DB 10 DUP('$'); STRING OF ASCII NUMBERS ENTERED BY THE USER
    NUM1 DW 0 ; HEX CONVERTED NUM
    RESULT DW 0
    RESULTCARRY DB 0

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
    MUL NUM1;
    MOV NUM1, AX;
    MOV BH,00
    ADD NUM1, BX 
    INC SI
    LOOP CONV

    ; CALULATE THE SUM
    MOV CX, NUM1
    MOV AX,00
    MOV BX,0001H
    SUM:MOV AX, BX
    MUL BX
    ADD RESULT, AX
    JNC SKIP
    INC RESULTCARRY
SKIP:
    ADD BX, 2
    LOOP SUM

    ;DISPLAY
    MOV BX, 10
    MOV CX, 00
    SUB AH, AH
    MOV AL, RESULTCARRY
    L1:CMP AX, 00
    JE BREAK1
    DIV BX
    PUSH DX
    INC CX
    SUB DX,DX
    JMP L1
    BREAK1: 
            CMP CX, 0
            JE EX
            POP DX
            ADD DX, 30H
            MOV AH, 02H
            INT 21H
            DEC CX
            JMP BREAK1
    EX:
    ;DISPLAY
        
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
