.model small
.stack 100h

.data
    prompt db "ENTER A CHARACTER (A-Z): $"
    newline db 13,10,'$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, prompt
    int 21h

    mov ah, 1
    int 21h
    mov dl, al

    cmp dl, 'A'
    jl skip_display     

    cmp dl, 'Z'
    jg skip_display   

    
    mov ah, 2
    int 21h

    skip_display:
    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 4Ch
    int 21h
main endp

end main
