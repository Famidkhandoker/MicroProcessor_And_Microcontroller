.MODEL SMALL
.STACK 100H
.DATA
STR1 DB "Enter the first letter: $"
STR2 DB "Enter the second letter: $"
STR3 DB "The letters in alphabetical order: $"

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9
    LEA DX,STR1
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

    CMP BH,CH
    JLE PRINT1

    MOV DL,CH
    MOV AH,2
    INT 21H

    MOV DL,BH
    INT 21H
    JMP EXIT

PRINT1:
    MOV DL,BH
    MOV AH,2
    INT 21H

    MOV DL,CH
    INT 21H

EXIT:

MAIN ENDP
END MAIN



