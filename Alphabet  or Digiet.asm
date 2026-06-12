.MODEL SMALL
.STACK 100H
.DATA
STR1 DB "Enter character: $"
STR2 DB "Alphabet$"
STR3 DB "Digit$"

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
    
    CMP BL,'A'
    JGE L
    JMP S
    
    L:
    CMP BL,'Z'
    JLE ALPHA
    
    S:
    CMP BL,'0'
    JGE L1
    
    L1:
    CMP BL,'9'
    JLE DIGIT
    
    ALPHA:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H


    MOV AH,9
    LEA DX,STR2
    INT 21H
    JMP EXIT

    DIGIT:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AH,9
    LEA DX,STR3
    INT 21H

EXIT:

MAIN ENDP
END MAIN