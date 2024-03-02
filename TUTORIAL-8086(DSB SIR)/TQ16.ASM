TITLE MULTIPLICATION TABLE OF INPUT NO.
    .MODEL SMALL
.STACK
.DATA
    SUM     DW 0
    NUM     DW ?
    COUNT   DB 10

    STRING1 DB "ENTER THE NUMBER: $"
.CODE
MAIN PROC FAR
             MOV  AX,@DATA
             MOV  DS,AX
             MOV  AX,@STACK
             MOV  SS,AX

             LEA  DX,STRING1
             MOV  AH,09H
             INT  21H

             MOV  AH,01H
             INT  21H

             SUB  AL,30H
             SUB  AH,AH
             MOV  NUM,AX

             MOV AH,02H
             MOV DL,0AH
             INT 21H


             MOV  BX,10
    REPEAT:  
            MOV AX,NUM
             ADD  SUM,AX
             MOV  AX,SUM
             MOV  DX,00H
             MOV  CX,00H
CHECK:
             CMP  AX,0
             JZ   STOPPUSH
             DIV  BX
             PUSH DX
             INC  CX
             SUB  DX,DX
            JMP CHECK
    STOPPUSH:
             CMP  CX,00H
             JZ   EXIT
             POP  DX
             DEC  CX
             ADD  DX,30H
             MOV  AH,02H
             INT  21H
             JMP  STOPPUSH
    EXIT:    
            MOV AH,02H
             MOV DL,' '
             INT 21H
             DEC  COUNT
             JNZ  REPEAT

             MOV  AX,4C00H
             INT  21H
MAIN ENDP
    END MAIN


    
