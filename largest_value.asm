.MODEL SMALL
.STACK 100H
.DATA
STR1 DB "Enter first value: $"
STR2 DB "Enter second value: $"
STR3 DB "Enter third value: $"
STR4 DB "The largest value is: $"

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9
    LEA DX,STR1
    INT 21H

    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AH,9
    LEA DX,STR2
    INT 21H

    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AH,9
    LEA DX,STR3
    INT 21H

    MOV AH,1
    INT 21H
    MOV DH,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    CMP BL,CL
    JGE CHECK3
    MOV BL,CL

CHECK3:
    CMP BL,DH
    JGE PRINT
    MOV BL,DH

PRINT:
    MOV AH,9
    LEA DX,STR4
    INT 21H 
    
    MOV AH,2
    MOV DL,BL
    INT 21H

MAIN ENDP
END MAIN