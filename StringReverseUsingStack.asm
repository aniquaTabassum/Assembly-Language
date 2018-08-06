INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    XOR CX,CX
    MOV AH,1
    
    INPUT:
        INT 21H
        CMP AL, 0DH
        JE STARTPRINT
        INC CX
        PUSH AX
        JMP INPUT
        
    STARTPRINT:
        MOV AH,2
        PRINTN
        
    PRINTING:
        POP DX
        INT 21H
        LOOP  PRINTING 
        
    MOV AH,4CH
    MAIN ENDP
END MAIN