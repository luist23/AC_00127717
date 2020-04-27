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

int 20h