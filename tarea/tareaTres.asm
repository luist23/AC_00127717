
org     100h
section .text
        
        ;mov     ax, 120d 
        mov     ax, 60d
        ;mov     ax, 180d
        mov     bx, 0d
        ;mov     bx, 60d
        mov     [200h], ax
        mov     [210h], bx

define: mov     di, bx
        cmp     di, 0d
        jne     solve

        mov     bp, array
        mov     di, 0h
error:  mov     al, [bp+di]
        mov     [220h+di],al
        inc     di
        cmp     di, 5h
        jbe     error
        jmp     fin

solve:  div     bx  ;ley de ohm voltage entre resistencia
        mov     [220h], ax

fin:    int 20h
section .data

;array db 23,4,5,2,26,6,12,15,12,3
array db "error"