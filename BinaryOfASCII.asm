INCLUDE 'EMU8086.INC'
.MODEL SMALL
.DATA      
N DB ? 
I DB ?    
NUM DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX            
    
    XOR AL,AL
    PRINTN "ENTER A NUMBER: "
    MOV AH,1
    INT 21H
    MOV N,AL     
    
    PRINTN 
    XOR BL,BL
    OR BL,N
    
    MOV I,'8'
    SUB I,48  
    MOV NUM,0
    
    PRINT:
    CMP I,0
    JE ENDPRINT
    SHL BL,1
    JC PRINT_ONE
    JMP PRINT_ZERO
    
    
    PRINT_ZERO:
    PRINT "0" 
    DEC I
    JMP PRINT
   
    PRINT_ONE: 
     INC NUM
    PRINT "1" 
    DEC I    
   
    JMP PRINT
    
    ENDPRINT:       
    PRINTN 
    ADD NUM,48
    PRINT "NUMBER OF 1 IS: "    
    MOV DL,NUM
    MOV AH,2    
    INT 21H
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    