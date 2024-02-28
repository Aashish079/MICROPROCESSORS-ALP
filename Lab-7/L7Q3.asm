TITLE to add corresponding numbers from two tables and generate a third table
.MODEL SMALL
.STACK 32H
;-------------------------------------------
.DATA
    TABLE1 DW 10 DUP(5555H)
    TABLE2 DW 10 DUP(4545H)
    TABLE3 DW 10 DUP(?)
;-------------------------------------------
.CODE    
MAIN PROC FAR
	MOV AX, @DATA
	MOV DS, AX	
	MOV BX, 0
	MOV CX, 0AH	
	SUMLOOP:
	MOV AX, TABLE1[BX]
	ADD AX, TABLE2[BX]
	MOV TABLE3[BX], AX
	ADD BX, 2
	LOOP SUMLOOP	
	MOV AX, 4C00H
	INT 21H
MAIN ENDP
	END MAIN
