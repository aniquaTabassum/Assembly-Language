INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    CALL CUSTOM_FUNCTION
    PRINTN "I AM BACK IN MAIN"
    
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP        

CUSTOM_FUNCTION PROC
        PRINTN "ENTERED CUSTOM FUNCTION"
        RET
    CUSTOM_FUNCTION ENDP
END MAIN