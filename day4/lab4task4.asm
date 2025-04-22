.model small
.stack 100h
.data
    msg1 db 'Enter a number(0-9): $'
    msg2 db 10,13,'Less than 5$'
    msg3 db 10,13,'Greater than 5$'
    msg4 db 10,13,'Equal to 5$'
    num db ?
.code
start:
    mov ax, @data
    mov ds, ax

    ; Display "Enter a number: "
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Read a single character input
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to integer
    mov num, al

    ; Compare input with 5
    mov cl, 5
    cmp num, cl
    je equal
    jl less
    jg greater

less:
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp exit

greater:
    mov ah, 9
    lea dx, msg3
    int 21h
    jmp exit

equal:
    mov ah, 9
    lea dx, msg4
    int 21h

exit:
    mov ah, 4Ch
    int 21h

end start
