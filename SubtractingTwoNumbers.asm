.MODEL SMALL
.STACK 100H     
.DATA
A DB ?
B DB ?  
MSG1 DB 'ENTER THE FIRST NUMBER: $' 
MSG2 DB 0DH,0AH,'ENTER THE SECOND NUMBER NUMBER: $'  
SUM DB 0DH,0AH,'THE SUM IS: $'
.CODE
MAIN PROC
       MOV AX,@DATA
       MOV DS,AX
       
       LEA DX,MSG1
       MOV AH,9
       INT 21H
       
       MOV AH,1
       INT 21H
       MOV A, AL 
       SUB A,48
       
       LEA DX, MSG2
       MOV AH,9
       INT 21H
       
       MOV AH,1
       INT 21H
       MOV B,AL
       SUB B,48
       
       
       
       LEA DX, SUM
       MOV AH,9
       INT 21H 
       
         
       MOV DL,A
       SUB DL,B  
       ADD DL,48
       
       MOV AH,2
       INT 21H
       
       MAIN ENDP
END MAIN