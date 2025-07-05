.model small
.stack 100h
.data
    prompt db 'TYPE A HEX NUMBER (0 TO FFFF): $'
    error db 0Dh, 0Ah, 'ILLEGAL HEX DIGIT, TRY AGAIN: $'
    binaryMsg db 0Dh, 0Ah, 'IN BINARY IT IS $'
    resultMsg db 0Dh, 0Ah, 'after changing even number of bit set 1 there: $'
    evenOddMsg db 0Dh, 0Ah, 'The resultant number is: $'
    even db 'even$'
    odd db 'odd$'
    hexNum dw 0
    binaryNum dw 0
    resultNum dw 0
    digitCount db 0

.code
main proc
    mov ax, @data
    mov ds, ax

input_loop:

    mov ah, 09h
    lea dx, prompt
    int 21h

    
    mov hexNum, 0
    mov digitCount, 0

read_hex:
    
    mov ah, 01h
    int 21h

    
    cmp al, 0Dh
    je process_input

    ; Validate hex digit (0-9, A-F)
    cmp al, '0'
    jb invalid_char
    cmp al, '9'
    jbe valid_digit
    cmp al, 'A'
    jb invalid_char
    cmp al, 'F'
    ja invalid_char

valid_digit:
    
    sub al, '0'
    cmp al, 9
    jbe numeric
    sub al, 7       

numeric:
    
    mov cl, 4
    shl hexNum, cl
    mov ah, 0
    add hexNum, ax

    
    inc digitCount
    cmp digitCount, 4
    jb read_hex
    jmp process_input

invalid_char:
    
    mov ah, 09h
    lea dx, error
    int 21h
    jmp input_loop

process_input:
    
    mov ah, 09h
    lea dx, binaryMsg
    int 21h

    
    mov bx, hexNum
    mov cx, 16       
    mov binaryNum, bx 

display_binary:
    rol bx, 1        
    jc print_one
    mov dl, '0'
    jmp print_char
print_one:
    mov dl, '1'
print_char:
    mov ah, 02h
    int 21h
    loop display_binary

    
    mov bx, binaryNum
    mov ax, 05555h   
    or bx, ax        
    mov resultNum, bx

    
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    
    mov bx, resultNum
    mov cx, 16

display_result_binary:
    rol bx, 1
    jc print_one2
    mov dl, '0'
    jmp print_char2
print_one2:
    mov dl, '1'
print_char2:
    mov ah, 02h
    int 21h
    loop display_result_binary

    
    mov ah, 09h
    lea dx, evenOddMsg
    int 21h

    mov bx, resultNum
    test bx, 1       
    jz is_even
    lea dx, odd
    jmp display_even_odd
is_even:
    lea dx, even
display_even_odd:
    mov ah, 09h
    int 21h

    
    mov ah, 4Ch
    int 21h

main endp
end mainresult_binary:
    rol bx, 1
    jc print_one2
    mov dl, '0'
    jmp print_char2
print_one2:
    mov dl, '1'
print_char2:
    mov ah, 02h
    int 21h
    loop display_result_binary

    ; Check if result is even or odd
    mov ah, 09h
    lea dx, evenOddMsg
    int 21h

    mov bx, resultNum
    test bx, 1       ; Test least significant bit
    jz is_even
    lea dx, odd
    jmp display_even_odd
is_even:
    lea dx, even
display_even_odd:
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main