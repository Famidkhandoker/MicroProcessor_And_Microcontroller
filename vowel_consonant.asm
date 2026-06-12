.MODEL SMALL
.STACK 100H
.DATA
STR DW "Enter letter: $"
VOWEL DW "It is a vowel.$"
CONS DW "It is a consonant.$"

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

    CMP BH,'A'
    JE VOW

    CMP BH,'E'
    JE VOW

    CMP BH,'I'
    JE VOW

    CMP BH,'O'
    JE VOW

    CMP BH,'U'
    JE VOW

    CMP BH,'a'
    JE VOW

    CMP BH,'e'
    JE VOW

    CMP BH,'i'
    JE VOW

    CMP BH,'o'
    JE VOW

    CMP BH,'u'
    JE VOW

    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AH,9
    LEA DX,CONS
    INT 21H
    JMP EXIT

VOW:

    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AH,9
    LEA DX,VOWEL
    INT 21H

EXIT:

MAIN ENDP
END MAIN



