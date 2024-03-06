;Write a program to find the sum of square of odd numbers(upto 255). Read n from the user and display the sum as the decimal format. (also try to display the sum in Hexadecimal format)
TITLE TO FIND SUM OF SQUARE
.MODEL SMALL
.STACK 32H
.DATA
    MAXLEN  DB 10
    ACTLEN  DB ?
    NUMSTR  DB 10 DUP('$')
    NUM DW 0
    RESULT DW 0
    RESULTCARRY DW 0
    STRING1 DB "ENTER NUMBER LESS THAN 255: $"
    STRING2 DB "THE RESULT OF SERIES IS: $"

.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX
        ;Display message
         MOV AH,09H
         LEA DX,STRING1
         INT 21H
        ;Input number as string
         MOV AH,0AH
         LEA DX,MAXLEN
         INT 21H
        ;New line
         MOV DL,0AH
         MOV AH,02H
         INT 21H
        ;Display Answer MSG
        MOV AH,09H
        LEA DX,STRING2
        INT 21H

        ;Conv to HEX
        MOV CL,ACTLEN
        MOV CH,00H
        LEA SI,NUMSTR
REPEAT1:
        MOV BL,[SI]
        MOV BH,0
        SUB BL,30H
        MOV AX,10
        MUL NUM
        MOV NUM,AX
        ADD NUM,BX
        INC SI
        LOOP REPEAT1

        ;Core Logic
        MOV CX,NUM
        MOV CH,0
        MOV BX,1

 REPEAT2:
        MOV AX,BX
        MUL BX
        ADD RESULT,AX
        ADC RESULTCARRY,DX
    SKIP:
        ADD BX,2
        LOOP REPEAT2

        ;Display the Number
        MOV CX,0
        MOV BX,10
REPEAT3:
        CMP RESULTCARRY,0
        JNE RUN
        CMP RESULT,0
        JE EXIT
    RUN:
        MOV DX,0
        MOV AX, RESULTCARRY
        DIV BX
        MOV RESULTCARRY,AX
        MOV AX,RESULT
        DIV BX
        MOV RESULT,AX
        PUSH DX
        INC CX
        SUB DX,DX
        JMP REPEAT3

EXIT:
    CMP CX,0
    JE ENDD
    POP DX
    ADD DX,30H
    MOV AH,02H
    INT 21H
    DEC CX
    JMP EXIT 


 ENDD:
         MOV AX,4C00H
         INT 21H

MAIN ENDP
    END MAIN