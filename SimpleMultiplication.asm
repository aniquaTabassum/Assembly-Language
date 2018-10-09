INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL,2
    MOV BL,3  
    PRINTN 'THE NUMBERS ARE '
    MOV DL,AL  
    ADD DL,48
    MOV AH,2
    INT 21H
     
    PRINTN
    MOV CL,DL
    SUB CL,48
    
    MOV DL, BL 
    ADD DL,48
    INT 21H  
    
    XOR AX,AX
    MOV AL,CL
    MUL BL
    
    PRINTN
    PRINTN 'THE OUTPUT IS  '    
    MOV DL,AL
    MOV AH,2
    ADD DL,48
    INT 21H
    
    
    
    MAIN ENDP
END MAIN