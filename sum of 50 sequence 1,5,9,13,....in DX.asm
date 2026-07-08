.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,0
    MOV BX,50
    MOV CX,1
    MOV AX,1
   
    L:
    ADD DX,AX
    ADD AX,4
    ADD CX,1
    
    CMP CX,BX
    JLE L
    
    EXIT:
    MAIN ENDP
END MAIN




