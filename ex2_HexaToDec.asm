DATA SEGMENT
     NUM DW 25H ; HEX NUMBER
     RES  DB 10 DUP ('$')   
     MSG DB "Hex to decimal: $"
DATA ENDS
CODE SEGMENT

START:    
   
    MOV AX,DATA
    MOV DS,AX  
    
    MOV AH,09H
    LEA DX,MSG
    INT 21H
   
    MOV AX,NUM
      
    LEA SI,RES
    CALL HEX2DEC
   
    LEA DX,RES
    MOV AH,9
    INT 21H 
            
    MOV AH,4CH
    INT 21H        
CODE ENDS
HEX2DEC PROC NEAR
    MOV CX,0
    MOV BX,10
   
LOOP1: MOV DX,0
       DIV BX
       ADD DL,30H
       PUSH DX
       INC CX
       CMP AX,9
       JG LOOP1
     
       ADD AL,30H
       MOV [SI],AL
     
LOOP2: POP AX
       INC SI
       MOV [SI],AL
       LOOP LOOP2
       RET
HEX2DEC ENDP           
   
END START