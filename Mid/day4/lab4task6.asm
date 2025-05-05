.MODEL small
.STACK 100h
.DATA    
.CODE
    MAIN PROC
        mov bh,0h
              
        mov ah,01h
        int 21h
        mov bl,al
        
        mov ah,02h
        mov dx,0Dh
        int 21h
        mov dx,0Ah
        int 21h
        
        checkCondition:
            cmp bh,32h
                jl print
                jg end
                
        print:
            mov ah,02h
            mov dl,bl
            int 21h
            
            inc bh
            
            jmp checkCondition
            
        end:
            mov ah,4Ch
            int 21h
                
    MAIN ENDP
END MAIN
