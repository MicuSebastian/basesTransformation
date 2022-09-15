.DATA 
    NUMBER dw 80 ; hexa number       
    MSG db "Hexa to octal: $"   
    
.CODE 
    MAIN PROC FAR 
        MOV AX, @DATA 
        MOV DS, AX 
    
        mov ah, 09h
        lea dx, MSG 
        int 21h                      
     
        mov ax, NUMBER 
        CALL PRINT 
        MOV AH,4CH 
        INT 21H 
  
    MAIN ENDP   
PRINT PROC 

    mov cx,0 
    mov dx,0 

label1:
    cmp ax,0 
    je print1 
    mov bx, 8 
    div bx 
    push dx 
    inc cx 
    xor dx,dx 
    jmp label1 

print1: 
    cmp cx,0 
    je exit
    pop dx 
    add dx,48 
    mov ah,02h 
    int 21h 
    dec cx 
    jmp print1 

exit: 
    ret 

PRINT ENDP 
END MAIN 