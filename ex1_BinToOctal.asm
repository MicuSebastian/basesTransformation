.DATA
  OCT_Out   DB  "00", 13, 10, '$'     
  MSG db "Binary to octal: $"

.CODE   

main PROC
    mov ax, @DATA                   
    mov ds, ax  
    
    mov ah, 09h
    lea dx, MSG 
    int 21h

    mov di, OFFSET OCT_Out         
    mov ax, 1101b  ; Binary number            
    call IntegerToOctalCalculated    
    mov ah, 09h                     
    mov dx, OFFSET OCT_Out         
    int 21h                        

    mov ax, 4C00h                  
    int 21h                         
main ENDP

IntegerToOctalCalculated PROC
    mov bx, 1                      
    and bl, 0Fh                    
    cmp bl, 10                      
    jl .1                         
    add bl, 7                      
    .1:
    add bl, 30h                    
    mov [di+0], bl 
    mov bx, 5
    and bl, 0Fh                    
    cmp bl, 10                      
    jl .2                         
    add bl, 7                      
    .2:
    add bl, 30h 
    mov [di+1], bl                

    ret
IntegerToOctalCalculated ENDP

END main 