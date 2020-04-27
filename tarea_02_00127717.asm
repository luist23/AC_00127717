; parte I   : 00127717 -> (2+7+7+1+7)/5 = 4.8 -> 5: En el segundo

org     100h
        mov     ax, 0000h
        add     ax, 2d
        add     ax, 7d
        add     ax, 7d
        add     ax, 1d
        add     ax, 7d
        mov     cl, 5d
        div     cl


        mov     cl, "E"
        mov     [200h], cl

        mov     cl, "n"
        mov     [201h], cl
        mov     [20Ah], cl
        
        mov     cl, " "
        mov     [202h], cl
        mov     [205h], cl

        mov     cl, "e"
        mov     [203h], cl
        mov     [207h], cl

        mov     cl, "l"
        mov     [204h], cl
        mov     cl, "s"
        mov     [206h], cl
        mov     cl, "g"
        mov     [208h], cl
        mov     cl, "u"
        mov     [209h], cl
        mov     cl, "d"
        mov     [20Bh], cl
        mov     cl, "o"
        mov     [20Ch], cl
        

    ;parte II 

    mov     ax, 0000h
        mov     al, 2d
        mov     bx, 210h
        mov     cx, 2d
nay:    mul     cx
        mov     [bx], ax
        cmp     ah, 00h
        ja      two
        je      one
two:    add     bx, 2h
        jmp     nex
one:    add     bx, 1h
nex:    cmp     bx, 21Fh
        jb      nay

    ; parte III

    mov     ax, 0000h
    mov     ax, 0d
    mov     [220h], ax  ; F0 = 0
    mov     ax, 1d
    mov     [221h], ax  ; F1 = 1
    mov     bx, 222h

fibona:   mov     ax, 0000h
    mov     [bx], ax
    sub     bx, 2h
    mov     al, [bx]
    add     bx, 1h
    add     ax, [bx]
    add     bx, 1h
    mov     [bx], ax
    add     bx, 1h
    cmp     bx, 22Fh
    jb      fibona

int 20h