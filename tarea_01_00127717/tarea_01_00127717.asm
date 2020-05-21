org     100h ;Necesario para ensamblar archivos .COM

mov ax, 8A4Fh; mov ah, 8Ah  mov al, 4Fh
mov     bh, 5Dh
;mov     cl, "A"

;mov     [200h], ax; mov[200h], al mov [201h], ah
;ejemplo de direcciones de la 200 a la 210
;200 201 202 203 204 205 206 207 208 209 20A 20B 2C 20D 20E 20F 210

mov     cl, "A"
mov [203h], cl
mov     cl, "G"
mov [204h], cl
mov     cl, "O"
mov [205h], cl
mov     cl, "N"
mov [206h], cl
mov     cl, "I"
mov [207h], cl
mov     cl, "Z"
mov [208h], cl
mov     cl, "A"
mov [209h], cl
mov     cl, "S"
mov [20Ah], cl

mov     cl, "C"
mov [215h], cl
mov     cl, "A"
mov [216h], cl
mov     cl, "R"
mov [217h], cl
mov     cl, "L"
mov [218h], cl

mov     cl, "L"
mov [226h], cl
mov     cl, "E"
mov [227h], cl

mov     cl, "D"
mov [235h], cl
mov     cl, "I"
mov [236h], cl
mov     cl, "C"
mov [237h], cl
mov     cl, "E"
mov [238h], cl
mov     cl, "S"
mov [239h], cl

mov     cl, "N"
mov [246h], cl
mov     cl, "O"
mov [247h], cl

mov     cl, "A"
mov [257h], cl

mov     cl, "L"
mov [266h], cl
mov     cl, "A"
mov [267h], cl

mov     cl, "V"
mov [276h], cl
mov     cl, "I"
mov [277h], cl
mov     cl, "D"
mov [278h], cl
mov     cl, "A"
mov [279h], cl




int 20h