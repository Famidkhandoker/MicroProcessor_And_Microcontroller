.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    MOV BX,50
    MOV CX,1
    
    L:
    ADD AX,CX
    INC CX
    
    CMP CX,BX
    JLE L
    
    EXIT:
    MAIN ENDP
END MAIN

//Output
AX=1275(register save)
