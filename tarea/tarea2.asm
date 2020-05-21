
org     100h
section .text
        
        mov     bp, array
        mov     di, 0h
define: mov     al, [bp+di]
        mov     [200h+di],al
        inc     di
        cmp     di, 10h
        jbe     define

        mov     ax, 0d
        mov     di, 0h
suma:   add     ax , [200h+di]
        inc     di
        cmp     di, 10h
        jbe     suma

        mov     bx, 10d
        div     bx
        mov     [210h], ax

        int 20h
section .data

array db 23,4,5,2,26,6,12,15,12,3
;array db 23,4,5,2,26,23,4,5,3,4