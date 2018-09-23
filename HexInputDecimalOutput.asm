.MODEL SMALL
.STACK 100H
.DATA
A DB ?   
D DB ?
MSG1 DB 0DH,0AH,'ENTER THE HEX CHARACTER:$'
MSG2 DB 0DH,0AH,'THE DECIMAL VALUE IS:$'  
MSG3 DB 0DH,0AH,'I AM HERE $' 
PA DB '10 $'
PB DB '11 $'
PC DB '12 $'
PD DB '13 $'
PE DB '14 $'
PF DB '15 $'     
AGAIN DB 0DH,0AH,'ENTER Y TO PRINT AGAIN, N TO EXIT $'  
NEW DB 0DH,0AH,'$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    START:
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV A,AL
    
    CMP A,'A'
    JGE PRINTCHAR
    CMP A,'a'
    JGE PRINTCHAR
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
              
    MOV AL,A           
    MOV DL,AL
    MOV AH,2
    INT 21H
    JMP ENDPROG
    
    PRINTCHAR:
              LEA DX, MSG2
              MOV AH,9
              INT 21H     
              
              CMP A,'A'
              JE PRINTA
              CMP A,'a'
              JE PRINTA 
              
              CMP A,'B'
              JE PRINTB
              CMP A,'b'
              JE PRINTB 
              
              CMP A,'C'
              JE PRINTC
              CMP A,'c'
              JE PRINTC
              
              CMP A,'D'
              JE PRINTD
              CMP A,'d'
              JE PRINTD
              CMP A,'E'
              JE PRINTE
              CMP A,'e'
              JE PRINTE
              CMP A,'F'
              JE PRINTF
              CMP A,'f'
              JE PRINTF   
    PRINTA:
    LEA DX, PA   
    MOV AH,9
    INT 21H
    JMP ENDPROG
    
    
    PRINTB: 
    LEA DX, PB   
    MOV AH,9
    INT 21H
    JMP ENDPROG
    
    PRINTC:
    LEA DX, PC   
    MOV AH,9
    INT 21H
    JMP ENDPROG
    
    PRINTD: 
    LEA DX, PD   
    MOV AH,9
    INT 21H
    JMP ENDPROG
    
    PRINTE:    
    LEA DX, PE   
    MOV AH,9
    INT 21H
    JMP ENDPROG
    
    PRINTF:    
    LEA DX, PF   
    MOV AH,9
    INT 21H
    JMP ENDPROG
    
    
              
    ENDPROG:
    LEA DX, AGAIN
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV D,AL
    
    CMP D,'Y'
    JE START
    MOV AH,4CH
    MAIN ENDP
END MAIN
    