.model small
.stack 100h

.data 
a db "single value input:$"


.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1  ;single value input
    int 21h
    mov bl,al ;take input and push it 
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21h
    main endp

end
    
    