TITLE to generate and store a multiplication table of a number stored as NUM1
.MODEL SMALL
.STACK 32H
;-------------------------------------------
.DATA
    NUM1 DW 0002H
    TABLE DW ?
;-------------------------------------------
.CODE
MAIN PROC FAR
	MOV AX, @DATA
	MOV DS, AX	
	MOV AX, 0
	MOV BX, 0
	MOV CX, 10	
	MULTIPLY:
	ADD AX, NUM1
	MOV TABLE[BX], AX
	ADD BX, 2
	LOOP MULTIPLY	
	MOV AX, 4C00H
	INT 21H
MAIN ENDP
	END MAIN
