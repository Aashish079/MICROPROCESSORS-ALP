TITLE TO CAPITALIZE VOWELS ONLY

.MODEL SMALL
.STACK 32H
.DATA
    MAXLEN DB 50
    ACTLEN DB 0
    STR DB 50 DUP('$')

.CODE
    MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 0AH
        LEA DX, MAXLEN 
        INT 21H

        LEA SI, STR

        MOV CH, 00H 
        MOV CL, ACTLEN

    REPEAT:CMP BYTE PTR [SI], 'a'
        JE CAPITALIZE 
        CMP BYTE PTR [SI], 'e'
        JE CAPITALIZE
        CMP BYTE PTR [SI], 'i'
        JE CAPITALIZE  
        CMP BYTE PTR [SI], 'o'
        JE CAPITALIZE 
        CMP BYTE PTR [SI], 'u'
        JE CAPITALIZE
        JMP DontCapitalize
CAPITALIZE: SUB BYTE PTR[SI], 'a' 
        ADD BYTE PTR[SI], 'A'

DontCapitalize: MOV AH, 02H
        MOV DL, [SI]
        INT 21H

        INC SI

        LOOP REPEAT

        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
END MAIN