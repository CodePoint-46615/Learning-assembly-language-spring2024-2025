.MODEL SMALL
.STACK 100H
.DATA
A DB 0AH,0DH, 'CAPITAL LETTER: $' 
B DB 0AH,0DH, 'SMALL LETTER: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    
    ADD BH,20H
   
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN


