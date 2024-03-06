;Write a program to find the sum of numbers from 1 to n. Read n from the user and display the sum as the decimal format. (also try to display the sum in Hexadecimal format)
.MODEL SMALL
.STACK 32H
.DATA
    MAXLEN DB 10
    ACTLEN DB ?
    NUM DB 10 DUP('$'); STRING OF ASCII NUMBERS ENTERED BY THE USER
    NUM1 DW 0 ; HEX CONVERTED NUM

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

    SUM: ADD AX, BX
    INC BX
    LOOP SUM

    ;DISPLAY
    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    
    MOV BX, 10
    MOV CX, 00

    L1:CMP AX, 00
    JE BREAK1
    DIV BX
    PUSH DX
    INC CX
    SUB DX,DX
    JMP L1
    BREAK1: POP DX
            ADD DX, 30H
            MOV AH, 02H
            INT 21H
            LOOP BREAK1
        
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
