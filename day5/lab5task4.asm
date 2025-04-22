.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    mov ah,1
    int 21h
    MOV cl,al
    mov ch,0
    int 21h
    MOV Bl,al
    mov bh,0
    int 21h
    mov ah,0
     
    
    
    CMP AX,BX 
    JNL END_IF
    CMP BX,CX
    JNL ELSE2
    
    MOV AX,0     ;TRUE
    JMP END_IF
    
    ELSE2:
    MOV BX,0 
    
    END_IF:  
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
