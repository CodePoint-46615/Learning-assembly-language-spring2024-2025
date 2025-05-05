.MODEL small
.STACK 100h
.DATA
    msg db "Hello world $"
.CODE
    MAIN PROC   
        
    mov ax,@DATA
    mov ds,ax
    
    continueprint:
        mov ah,09h
        lea dx,msg
        int 21h
        
        mov ah,02h
        mov dx,0Dh
        int 21h
        mov dx,0Ah
        int 21h
        
        jmp continueprint ;label name is continueprint
                
    MAIN ENDP
END MAIN
