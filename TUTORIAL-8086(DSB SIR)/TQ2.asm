TITLE ADD 10 NUMBERS WHICH ARE BETWEEN 30 AND 100 ONLY AND DISPLAY THE SUM IN HEX
.MODEL SMALL
.STACK 32H
.DATA
    ARR  DW 10,70,26,79,70,30,130,40,100,150
    STRING  DB "THE SUM OF NUMBERS IS: $"
    SUM DW ?
.CODE
MAIN PROC FAR
           MOV  AX,@DATA
           MOV  DS,AX

           LEA  SI,ARR
           MOV  AX,0; SUM=0
           MOV  CX,10; Counter
           ;Summing the numbers
    REPEAT:
           CMP [SI],30
           JC SKIP
           CMP [SI],100
           JNC  SKIP
           ADD  AX,[SI]
        SKIP:INC  SI
           INC SI
           LOOP REPEAT

        ;For getting the HexaDecimal Value
           MOV DX,0
           MOV CX,0
           MOV BX,10H; For getting HEX DIGITS

    REPEAT2:
           CMP AX,0
           JZ NEXT ;Break condition if done with all digits
           DIV BX   ;Dividing the AX by 10, DX:AX/BX
           PUSH DX ;Pushing the Remainder DX:AX Remainder:Quotient
           SUB DX,DX ;Clearing the DX
           INC CX   ; Count for popping later on
           JMP REPEAT2

    NEXT:
            CMP CX,0
            JZ EXIT
            POP DX
            ADD DX,30H
            DEC CX
            MOV AH,02H
            INT 21H
            JMP NEXT

    EXIT:
           MOV  AX,4C00H
           INT  21H


MAIN ENDP
    END MAIN
