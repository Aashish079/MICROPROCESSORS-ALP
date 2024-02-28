TITLE program to find the sum of the following series up to 20 terms and store the result 2 x 3 + 4 x 5 + ... to 20 terms
.MODEL SMALL
.STACK 32H

.DATA
RESULT DW 0

.CODE
    MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX

    MOV CX, 14H
    MOV AX, 2H
    MOV BX, 3H

SUM_LOOP: 
    MUL BX
    ADD RESULT, AX
    MOV AX, BX
    INC AX
    ADD BX, 2H
    LOOP SUM_LOOP

    MOV AH, 4CH
    MOV AL, 00H
    INT 21H
    MAIN ENDP
END MAIN