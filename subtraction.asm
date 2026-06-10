.MODEL SMALL 
.STACK 100H
.DATA
STR DW "Enter the first digit: $"
STR2 DW "Enter the second digit: $"
STR3 DW "Subtraction: $"
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,STR
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
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
    MOV CH,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,STR3
    INT 21H
    
    SUB BH,CH
    
    ADD BH,48
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MAIN ENDP
END MAIN

//output
//Enter the first digit:5
//Enter the second digit:2
//Subtraction:3
    
