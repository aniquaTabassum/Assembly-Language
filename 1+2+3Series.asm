INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
N DB ?
SUM DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINTN "ENTER THE NUMBER N: "
    
    MOV AH,1
    INT 21H
    MOV N, AL
    SUB N,48
    
    MOV BL,N
    MOV SUM,0
    
    STARTADD:
        CMP BL,0
        JLE ENDPROG    
        ;PRINTN "ADDING"
        ADD SUM,BL
        DEC BL
        LOOP STARTADD
    ENDPROG:
    PRINT "THE SUM IS: "
    MOV DL,SUM
    MOV AH,2
    INT 21H
    
    MAIN ENDP
END MAIN