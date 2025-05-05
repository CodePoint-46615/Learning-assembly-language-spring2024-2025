.model small ; Use small memory model (separate code and data segments)
 
.stack 100h  ; Allocate 256 bytes of stack space

.data    ; Data segment
 
    msg db 'Hello, AIUB$'; String to display (must end with $ for INT 21h function 09h)

.code  ; Code segment begins

main proc ; Start of main procedure
    
    mov ax, @data  ; Load the address of the data segment into AX
    mov ds, ax     ; Move AX into DS to initialize it
    lea dx, msg    ; Load the address of MSG into DX
    
    mov ah, 09h    ; Function 09h: Display string
    int 21h        ; Call DOS interrupt to display the string
    
    mov ah, 4ch    ; Function 4Ch: Terminate program
    int 21h        ; Call DOS interrupt to exit
     
main endp ; End of main procedure
end main  ; Tell assembler where program execution starts
    