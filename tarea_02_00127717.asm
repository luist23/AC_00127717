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


int 20h