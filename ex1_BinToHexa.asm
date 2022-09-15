.DATA
  HEX_Map   DB  '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
  HEX_Out   DB  "00", 13, 10, '$'     
  MSG db "Binary to hexa: $"

.CODE   

main PROC
    mov ax, @DATA                   
    mov ds, ax  
    
    mov ah, 09h
    lea dx, MSG 
    int 21h

    mov di, OFFSET HEX_Out         
    mov ax, 1101b  ; Binary number            
    call IntegerToHexCalculated    
    mov ah, 09h                     
    mov dx, OFFSET HEX_Out         
    int 21h                        

    mov ax, 4C00h                  
    int 21h                         
main ENDP

IntegerToHexCalculated PROC
    mov bx, ax                      
    and bl, 0Fh                    
    cmp bl, 10                      
    jl .1                         
    add bl, 7                      
    .1:
    add bl, 30h                    
    mov [di+0], bl                 

    ret
IntegerToHexCalculated ENDP

END main                          