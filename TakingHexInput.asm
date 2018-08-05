INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CL,4
    XOR BX,BX
    
    MOV AH,1
    
    TAKEINPUT:
        INT 21H
        CMP AL,0DH
        JE STARTPRINTING   
        CMP AL, 'A'
        JGE CHARACTER
        SUB AL,48
        JMP SHIFT
        
   CHARACTER:
   
        SUB AL, 37H
        
   SHIFT:
        SHL BX,CL
        OR BL,AL
        JMP TAKEINPUT
        
   STARTPRINTING:     
        PRINTN
        MOV AH,2
        MOV DL,BL
        INT 21H
        
   MOV AH, 4CH
   INT 21H
   MAIN ENDP
END MAIN