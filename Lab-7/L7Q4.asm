TITLE to generate a third table which contains 1FFFH if the corresponding data in first table is less than that of second table, else store 0000
.MODEL SMALL
.STACK 64
;-------------------------------------------
.DATA
    TABLE1 DW 5 DUP(4545H), 5 DUP(5555H)
    TABLE2 DW 5 DUP(5555H), 5 DUP(4545H)
    TABLE3 DW ?
;-------------------------------------------
.CODE
MAIN PROC FAR
	MOV AX, @DATA
	MOV DS, AX	
	MOV BX, 0
	MOV CX, 0AH	
	COMPARE:
	MOV AX, TABLE1[BX]
	CMP AX, TABLE2[BX]
	JL SMALLER
	MOV TABLE3[BX], 0000H
	JMP NEXT	
	SMALLER:
	MOV TABLE3[BX], 1FFFH	
	NEXT:
	ADD BX, 2
	LOOP COMPARE	
	MOV AX, 4C00H
	INT 21H
MAIN ENDP
	END MAIN
