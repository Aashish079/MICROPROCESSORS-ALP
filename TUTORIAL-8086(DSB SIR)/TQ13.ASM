TITLE VOWELS TO UPPERCASE
    .MODEL SMALL
.STACK
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STRING1 DB 50 DUP('$')
    STRING2 DB "THE FINAL STRING IS: $"
    STRING3 DB 50 DUP('$')

.CODE
MAIN PROC FAR
                MOV  AX,@DATA
                MOV  DS,AX
                MOV  AX,@STACK
                MOV  SS,AX

                LEA  DX,MAXLEN
                MOV  AH,0AH
                INT  21H

                MOV  AH,02H
                MOV  DL,0AH
                INT  21H


                LEA  SI,STRING1
                MOV  CL,ACTLEN
                MOV  CH,0

                LEA  DI,STRING3

    REPEAT:     
                MOV  AL,[SI]
                CMP  AL,'A'
                JZ   CONVERT
                CMP  AL,'E'
                JZ   CONVERT
                CMP  AL,'I'
                JZ   CONVERT
                CMP  AL,'O'
                JZ   CONVERT
                CMP  AL,'U'
                JZ   CONVERT

                CMP  AL,'a'
                JZ   CONVERT
                CMP  AL,'e'
                JZ   CONVERT
                CMP  AL,'i'
                JZ   CONVERT
                CMP  AL,'o'
                JZ   CONVERT
                CMP  AL,'u'
                JZ   CONVERT
                JMP  DONTCONVERT
    CONVERT:    
                SUB  AL,'a'
                ADD  AL,'A'
    DONTCONVERT:
                MOV  [DI],AL
                INC  SI
                INC  DI
                LOOP REPEAT

                MOV  AH,09H
                LEA  DX,STRING2
                INT  21H

                LEA  DX,STRING3
                INT  21H

                MOV AX,4C00H
                INT 21H

MAIN ENDP
    END MAIN

    
