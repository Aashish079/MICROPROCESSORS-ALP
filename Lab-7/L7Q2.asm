TITLE Sum of 10 16-bit numbers 
.MODEL SMALL
.STACK 32H
;-------------------------------------------
.DATA
    NUMBERS DW 10 DUP(5) 
    SUM DW 0
;-------------------------------------------
.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 0AH 
    MOV AX, 0000H ; To accumulate the sum
    LEA BX, NUMBERS 

SUM_LOOP:
    ADD AX, [BX] ; 
    ADD BX, 2 ; move BX to the next number (2 bytes for a 16-bit number)
    LOOP SUM_LOOP

    MOV SUM, AX ; store the sum in the 'sum' variable

    MOV AX, 4C00H
    INT 21H
    MAIN ENDP
END MAIN