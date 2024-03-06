TITLE COUNT VOWELS IN STRING
    .MODEL SMALL
.STACK 32H
.DATA
    MAXLEN     DB 50
    ACTLEN     DB ?
    STRING1    DB 50 DUP('$')
    STRING2    DB "THE TOTAL NO. OF VOWELS ARE: $"
    VOWELCOUNT DB 0

.CODE
MAIN PROC FAR
              MOV  AX,@DATA
              MOV  DS,AX

              LEA  DX,MAXLEN
              MOV  AH,0AH
              INT  21H

              MOV  AH,02H
              MOV  DL,0AH
              INT  21H


              LEA  SI,STRING1
              MOV  CL,ACTLEN
              MOV  CH,0

    REPEAT:   
              MOV  AL,[SI]
              CMP  AL,'A'
              JZ   COUNT
              CMP  AL,'E'
              JZ   COUNT
              CMP  AL,'I'
              JZ   COUNT
              CMP  AL,'O'
              JZ   COUNT
              CMP  AL,'U'
              JZ   COUNT

              CMP  AL,'a'
              JZ   COUNT
              CMP  AL,'e'
              JZ   COUNT
              CMP  AL,'i'
              JZ   COUNT
              CMP  AL,'o'
              JZ   COUNT
              CMP  AL,'u'
              JZ   COUNT
              JMP  DONTCOUNT
    COUNT:    
              INC  VOWELCOUNT
    DONTCOUNT:
              INC  SI
              LOOP REPEAT

              MOV  AH,09H
              LEA  DX,STRING2
              INT  21H

              MOV  AL,VOWELCOUNT
              MOV  AH,00H
              MOV  DX,00H
              MOV  CL,00H
              MOV  BX,10D

    REPEAT1:  
              CMP  AX,0
              JE   ENDPUSH
              DIV  BX
              PUSH DX
              SUB  DX,DX
              INC  CL
              JMP  REPEAT1

    ENDPUSH:  
              CMP  CL,0
              JE   EXIT
              POP  DX
              ADD  DX,30H
              DEC  CL

              MOV  AH,02H
              INT  21H
              JMP  ENDPUSH
    EXIT:     
              MOV  AX,4C00H
              INT  21H

MAIN ENDP
    END MAIN