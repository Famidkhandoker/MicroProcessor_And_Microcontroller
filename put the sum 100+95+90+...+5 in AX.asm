.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    MOV BX,5
    MOV CX,100
   
    L:
    ADD AX,CX
    SUB CX,5
    
    CMP CX,BX
    JGE L
    
    EXIT:
    MAIN ENDP
END MAIN



