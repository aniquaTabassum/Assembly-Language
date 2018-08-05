INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
COUNT DB 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    XOR BX,BX
    MOV AH,1 
    
    TAKEINPUT:
    INT 21H  
    CMP AL,0DH
    JE STARTPRINT
    SHL BX,1
    SUB AL,48
    OR BL,AL     
    INC COUNT
    JMP TAKEINPUT
    
    STARTPRINT:  
    PRINTN
    MOV CL,16
    SUB CL, COUNT
    RCL BX,CL
    
    XOR CH,CH
    MOV CL,COUNT 
    MOV AH,2
    
    PRINTING:
    RCL BX,1
    JC PRINTONE
    MOV DL,'0'
    INT 21H
    JMP LOOPING
    
    PRINTONE:
    MOV DL,'1'
    INT 21H
    
    LOOPING:
    LOOP PRINTING
    
    MAIN ENDP
END MAIN