.MODEL SMALL 
.STACK 100H
.DATA 
A DW ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,0                    ; 1+5+9+13.....50 terms
    MOV BX,1 
    
    MOV CX,50
    
    SUM:
    ADD DX,BX
    ADD BX,4
    MOV A,DX
    
    LOOP SUM 
