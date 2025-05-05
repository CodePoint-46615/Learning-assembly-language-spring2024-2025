.MODEL SMALL
.STACK 100H
.DATA 
MSG DB 0AH,0DH, "HELLO WORLD$"  
A DB 0AH,0DH, "ENTER NUMBER 1: $"
B DB 0AH,0DH, "ENTER NUMBER 2: $"  
C DB 0AH,0DH, "RESULT: $"
.CODE
MAIN PROC  
    ;1 FOR SINGLE INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR STRING OUTPUT   
    
    ;MOV AH,2
    ;MOV DL,10
    ;INT 21H
    ;MOV DL,13
    ;INT 21H
    
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H  
    
    MOV AH,9
    LEA DX,A
    INT 21H 
            
    ;TAKING INPUT FROM USER        
    MOV AH,1
    INT 21H
    MOV BH,AL
    
   MOV AH,9
    LEA DX,B
    INT 21H 
    
    ;TAKING INPUT FROM USER        
    MOV AH,1
    INT 21H
    MOV CH,AL 
    
    ADD CH,BH
    SUB CH,30H 
    
    MOV AH,9
    LEA DX,C
    INT 21H 
    
    ;OUTPUT
    MOV AH,2
    MOV DL, CH
    INT 21H 
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END



