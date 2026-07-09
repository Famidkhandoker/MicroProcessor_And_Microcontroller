.MODEL SMALL
.STACK 100H
.DATA
N DW 5
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    MOV BX,1
    MOV CX,N
    
   L:
   ADD AX,BX
   ADD BX,2
   
   LOOP L
            
   EXIT:         
   MAIN ENDP
END MAIN

//Output:
AX = 25



