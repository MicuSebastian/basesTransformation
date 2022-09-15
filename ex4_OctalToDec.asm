org 100h  

.DATA        
    MSG db "Octal to decimal: $"
.CODE 
    MAIN PROC FAR 
        MOV AX, @DATA 
        MOV DS, AX 
    
        mov ah, 09h
        lea dx, MSG 
        int 21h
  
    MAIN ENDP

push ax
push cx
push dx
push si
mov dx,50o  ; Octal number
mov ax,dx 
mov si,10
xor cx,cx  

label1:
    xor dx,dx 
    div si
    push dx 
    inc cx
    or ax,ax
    jnz label1                          

mov ah,02h

label2:
    pop dx
    add dx,"0"
    int 21h 
    loop label2 

end:
    pop si
    pop dx
    pop cx
    pop ax  
    
ret
