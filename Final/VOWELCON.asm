.model small
.stack 100h
.data
v db 10,13,'Vowel$'
c db 10,13,'Consonant$' 
I db 10,13,'INVALID$'
ME db 10,13,'EQUAL$'
mes db 'Enter a letter: $'
.code
main proc
    mov ax,@data
    mov ds,ax 
     
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H 
    MOV CH,AL 
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ADD BL,CH 
    SUB BL,30H
    ADD BL,CL
    
    SUB BL,30H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
     
    CMP BL,1
    JE PP
    PP: 
    mov ah,9
    lea dx,me
    int 21h
    JMP EXIT
    mov ah,9
    lea dx,mes
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al 
    
    CMP BH,65
    JL INV
    CMP BH,90
    JG CHK
    CHK:
    CMP BH,97
    JL INV
    CMP BH,122
    JG INV
    
    cmp bh, 65 ;A 
    je vol
    cmp bh,97
    je vol 
    
     cmp bh,69 ;e 
    je vol
    cmp bh,101
    je vol
    
     cmp bh, 73 ;i 
    je vol
    cmp bh, 105
    je vol
    
     cmp bh, 79;o 
    je vol
    cmp bh,111
    je vol
    
     cmp bh, 85 ;u 
    je vol
    cmp bh,117
    je vol
    
    mov ah,9
    lea dx,c
    int 21h 
    
    jmp exit 
    
    vol:
    mov ah,9
    lea dx,v
    int 21h 
    
    jmp exit
    
    INV:
      mov ah,9
    lea dx,I
    int 21h 
        
     exit:   