.MODEL SMALL
 
 
.STACK 100H
 
 
.DATA
 
 
    MSG1 DB 'ENTER A HEX DIGIT: $'
     
     
    MSG2 DB 0DH, 0AH, 'IN DECIMAL IT IS: $'
     
     
    DEC_MSG DB '00$'
    
.CODE
 
 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
 
 
    MOV AH, 1
    INT 21H      
   
 
 
    SUB AL, 'A'
    ADD AL, 10    
 
 
    MOV BL, AL    
    MOV AH, 0        
    MOV AX, BX
 
    MOV DL, 10
    DIV DL          
    ADD AL, '0' 
 
 
    MOV DEC_MSG, AL
    MOV AL, AH     
 
 
    ADD AL, '0'
    MOV DEC_MSG+1, AL
    LEA DX, MSG2
 
 
    MOV AH, 9
    INT 21H 
    LEA DX, DEC_MSG
    
    MOV AH, 9
    INT 21H
 
    MOV AH, 4CH
    INT 21H
 
 
MAIN ENDP
 
 
END MAIN
