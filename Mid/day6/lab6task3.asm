.MODEL SMALL 
.STACK 100H
.DATA 
A DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,00                   ; 100+95+90+...+5 terms
    MOV BX,100 
    
    MOV CX,20
    
    SUM:
    ADD DX,BX
    SUB BX,5
    MOV A,DX
    
    LOOP SUM 
