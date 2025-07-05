.model small
.stack 100h
.data
a db ?
b db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov a,al 
    
    mov ah,1
    int 21h
    mov b,al 
    
     
    add a,al 
    sub a,30h
    
    mov ah,2
    mov dl,a
    int 21h
    




