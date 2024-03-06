TITLE Take string as input from user, print each word in a separate line with first word capitalized.
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

        ;Take string input
        LEA DX, MAXLEN
        MOV AH, 0AH
        INT 21H
        ;NewLine
        MOV AH, 02H
        MOV DL, 0AH
        INT 21H

        ;Core logic
        LEA SI, STR

        ;For the first word
        CMP byte ptr[SI], 'a'
        JC SKIP
        CMP byte ptr[SI], 'z'
        JZ DO
        JNC SKIP
    DO: SUB byte ptr [SI], 'a'
        ADD byte ptr [SI], 'A'

    SKIP: MOV DL, [SI]
        MOV AH, 02H
        INT 21H

        INC SI
        ;REST OF THE WORDS
Repeat: CMP BYTE PTR [SI], '$'
        JE EXIT
        CMP BYTE PTR [SI], ' '
        JNZ Continue

        MOV AH, 02H
        MOV DL, 0AH
        INT 21H

        INC SI
        SUB BYTE PTR [SI], 'a'
        ADD BYTE PTR [SI], 'A'

    Continue:
        MOV AH, 02H
        MOV DL,[SI]
        INT 21H
        INC SI
        JMP Repeat

    EXIT: MOV AX, 4C00H
        INT 21H

    MAIN ENDP
END MAIN 
