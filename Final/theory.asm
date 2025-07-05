.model small
.stack 100h
.data 
a equ 2h ;a=2h 
b db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bl,a 
    
    mov ah,2
    add bl,30h 
    mov dl,bl
    int 21h 
    
    mov ah,1
    int 21h
    mov b,al  
    
    mov ah,2
    mov dl,b
    int 21h
    
    mov bx,9h 
    dec bx
   ; neg bx
    
    mov ah,4ch
    int 21h
    main endp
end main
