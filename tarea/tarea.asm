; parte I   : 00127717 -> (2+7+7+1+7)/5 = 4.8 -> 5: En el segundo

org     100h

    ;primer caso valor fijo de compra diez y tres por galon
    mov     cl, 36d;25d;10d valor dado
    mov     [200h], cl
    mov     cl, 6d;5d;3d galones dados
    mov     [210h], cl

    mov     ax, [200h]
    mov     bl, [210h]

    div     bl
    mov     [220h] , al
       
    int 20h