TITLE  A program that takes a string and count the number of words in the string. Display the count in decimal format

.MODEL SMALL 
.STACK 32H
.DATA
    MAXLEN DB 50
    ACTLEN DB ?
    STR DB 50 DUP('$')

.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

    ;Read STRING
    LEA DX, MAXLEN
    MOV AH, 0AH
    INT 21H
    
    MOV CH, 00
    MOV CL, ACTLEN
    MOV DX, 00H ; COUNTER FOR WORD
    LEA SI, STR

    SUB AX,AX
REPEAT: CMP BYTE PTR[SI], ' '
    JNE SKIP
    INC AX
SKIP: INC SI
    LOOP REPEAT
    
    ;DISPLAY NUM
    MOV BX, 10
    MOV CX, 00
    SUB DX,DX

    L1:CMP AX, 00
    JE BREAK1
    DIV BX
    PUSH DX
    INC CX
    SUB DX, DX
    JMP L1
    ;NEW LINE
BREAK1:MOV AH, 02
    MOV DL, 0AH
    INT 21H

    POP DX
    ADD DX, 30H
    MOV AH, 02H
    INT 21H
    LOOP BREAK1

    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN