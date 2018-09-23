INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A CHARACTER:$'
MSG2 DB 0DH,0AH,'THE UPPERCASE IS:$'
 
.CODE
MAIN PROC            
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    ADD CL,32
    
    LEA DX, MSG2
    MOV AH,9
    INT 21H   
    
    MOV DL,CL
    MOV AH,2
    INT 21H
    
   ; MOV AH,2
    
    
    MOV AH,4CH
    MAIN ENDP
END MAIN
    