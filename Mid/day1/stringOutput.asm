.model small        ;model type 
.stack 100h         ;address

.data               ;data segment
a db "Hello World$"


.code               ;code segment
main proc           ;main procedure such as main function (procedure starts from here)
    
    mov ax, @data   ;access to the dot segment
    mov ds, ax      ;
    mov ah, 9       ;9 for string output
    lea dx, a       ;lea = load effective address
    int 21h         ;output for black screen 
    
    mov ah, 4ch     ;ending message
    int 21h         ;message window
    main endp       ;process end here
                    ;code end
end
