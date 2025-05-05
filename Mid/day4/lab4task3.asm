.MODEL small
.STACK 100h
.DATA
    msg1 db "Positive $"
    msg2 db "Negative $"
.CODE
    MAIN PROC  
        
        mov ax,@DATA
        mov ds,ax
        
        mov ah,01h
        int 21h
        mov bl,al
        
        check:
            cmp bl,"-"
                je takeInputAgain
                jne print
        
        takeInputAgain:
            mov ah,01h
            int 21h
            
            mov ah,02h
            mov dx,0Dh
            int 21h
            mov dx,0Ah
            int 21h
            
            mov ah,09h
            lea dx, msg2
            int 21h
            
            jmp end
            
        print:
            mov ah,02h
            mov dx,0Dh
            int 21h
            mov dx,0Ah
            int 21h
        
            mov ah,09h
            lea dx, msg1
            int 21h
            
            jmp end
            
        end:
            mov ah,4Ch
            int 21h
                
    MAIN ENDP
END MAIN
