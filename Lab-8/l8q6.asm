; Why is this code not working?
; TITLE TO DISPLAY ENTERED STRING'S WORDS IN DIFFERENT LINES
; .MODEL SMALL
; .STACK 32H
; ;-------------------------------------------
; .DATA
; MAXLEN DB 50
; ACTLEN DB ?
; STRING DB 50 DUP ('$')
; ;-------------------------------------------
; 	.CODE
; MAIN PROC FAR
; 	MOV AX, @DATA
; 	MOV DS, AX	
; 	;Read String
; 	MOV AH, 0AH
; 	LEA DX, MAXLEN
; 	INT 21H
;     ;Display String
;     MOV BX, 0
; 	DISPLAY:
; 	MOV AH, 02H
; 	MOV AL, STRING[BX]
; 	CMP AL, ' '
; 	JE NEWWORD
; 	MOV DL, AL
; 	INT 21H
; 	JMP CONTINUE	
; 	NEWWORD:
;     ;Display New Line
; 	MOV DL, 0DH
;     INT 21H
;     MOV DL, 0AH
;     INT 21H	

; 	CONTINUE:
; 	INC BX
; 	LOOP DISPLAY	
; 	MOV AX, 4C00H
; 	INT 21H	
;     MAIN ENDP
; END MAIN

TITLE TO DISPLAY ENTERED STRING'S WORDS IN DIFFERENT LINES
.MODEL SMALL
.STACK 64
;-------------------------------------------
.DATA
LEN DB 50
	DB ?
STRING DB 51 DUP (?)
.CODE
;-------------------------------------------
MAIN PROC FAR
	MOV AX, @DATA
	MOV DS, AX	
	MOV AH, 0AH
	MOV DX, OFFSET LEN
	INT 21H	
	MOV CL, LEN[1]
	MOV BX, 00H	
	MOV AH, 02H
	MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H	
	DISPLAY:
	MOV AH, 02H
	MOV AL, STRING[BX]
	CMP AL, ' '
	JE NEWWORD
	MOV DL, AL
	INT 21H
	JMP CONTINUE	
	NEWWORD:
	MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H	
	CONTINUE:
	INC BX
	LOOP DISPLAY	
	MOV AX, 4C00H
	INT 21H	
MAIN ENDP
END MAIN