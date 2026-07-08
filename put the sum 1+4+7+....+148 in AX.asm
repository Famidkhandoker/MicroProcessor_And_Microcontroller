.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    MOV BX,148
    MOV CX,1
   
    L:
    ADD AX,CX
    ADD CX,3
    
    CMP CX,BX
    JLE L
    
    EXIT:
    MAIN ENDP
END MAIN



