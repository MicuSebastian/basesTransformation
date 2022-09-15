include emu8086.inc

DIS MACRO STR
    MOV AH,09H
    LEA DX,STR
    INT 21H
ENDM 

DATA SEGMENT
    CP1 DB 20 DUP('$')
    CP2 DB 20 DUP('$')
    NUMBER DW 12 ; decimal number
DATA ENDS

START:
         MOV AX,DATA
         MOV DS,AX
         LEA SI,CP1
         MOV AX,NUMBER
         MOV BH,00
         MOV BL,2
         
      loop1:
         DIV BL
         ADD AH,'0'
         MOV [SI],AH
         MOV AH,00
         INC SI
         INC BH
         CMP AL,00
         JNE loop1

         MOV CL,BH
         LEA SI,CP1
         LEA DI,CP2
         MOV CH,00
         ADD SI,CX
         DEC SI

      loop2:
         MOV AH,[SI]
         MOV [DI],AH
         DEC SI
         INC DI
         LOOP loop2

         PRINT "Decimal to binary: "
         DIS CP2  
         PRINTN 
         MOV AH,4CH
         INT 21H 

END START  