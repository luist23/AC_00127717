org	100h

section .text



	call 	texto  	;iniciamos modo texto
	;xor 	si, si 	;lo mimso que: mov si, 0000h
	;call	Gato

    mov	bl, 00001111b   ;atributos amarillo:1110 verde:0010
    mov	dh, 5h	; fila inicial
    mov	dl, 5h         ; columna inicial
    mov	bp, carnex      ; casilla inicial
	mov si, lenCarnex
    call 	w_strng

    mov	bl, 00001111b   ;atributos amarillo:1110 verde:0010
    mov	dh, 8h	; fila inicial
    mov	dl, 20h         ; columna inicial
    mov	bp, comentario      ; casilla inicial
	mov si, lenComentario
    call 	w_strng

    call kb
    int 20h




	mov	bl, 00001111b   ;atributos amarillo:1110 verde:0010
    mov	dl, 5h         ; columna inicial
    mov	bp, msg3      ; casilla inicial
	mov si, len3
    call 	w_strng
	
	

	;mov 	si, 1h 	;lo mimso que: mov si, 0000h
digitos:
    xor 	si, si
    call 	digi         ;digito uno
	mov	[400h], al
	call  borr
    mov     al, "+"
    mov [401h], al
    call 	digi         ;digito dos
	mov	[402h], al
	call borr
	mov 	si, 3h
    mov	bl, 00101110b   ;atributos amarillo:1110 verde:0010
    mov	dl, 30h         ; columna inicial
    mov	bp, 400h      ; casilla inicial
    call 	w_strng

	call  mis
	mov     al, "="
    mov [403h], al

	mov		al, [400h]
	sub 	al,	30h
	mov		cl, [402h]
	sub 	cl,	30h
	add 	al,cl
	add		al,30h

	call	masD
	

	mov	si, 3h
	mov	bl, 01000110b   ;atributos amarillo:1110 verde:0010
    mov	dl, 33h         ; columna inicial
    mov	bp, 403h      ; casilla inicial
    call 	w_strng

    call kb
    int 20h
    ;validar
    
masD:
	cmp	al, "9"
	jle	masD2
	sub al, 10d
	mov		cl, "1"
	mov 	[404h], cl
	mov		[405h], al
	ret
masD2:
	mov		[404h], al
	ret


digi:call 	kb 
	xor		si, si
lupi: cmp 	si, 10h ;  cinco letras
	je	fracaso
	;mov		cl, [validacion+si] ; CS:0300h en adelante
	cmp 	al, [validacion+si] 
	je 		exito
	inc 	si
	jmp 	lupi
fracaso:
	call borr
	mov	bl, 00001111b   ;atributos amarillo:1110 verde:0010
    mov	dl, 5h         ; columna inicial
    mov	bp, msg      ; casilla inicial
	mov si, len
    call 	w_strng
	;call kb
	call digi
exito: 
	ret
borr:	mov	bl, 00000000b   ;atributos amarillo:1110 verde:0010
    mov	dl, 5h         ; columna inicial
    mov	bp, msg      ; casilla inicial
	mov si, len3
    call 	w_strng
	ret


mis:mov	bl, 00001111b   ;atributos amarillo:1110 verde:0010
    mov	dl, 5h         ; columna inicial
    mov	bp, msg2      ; casilla inicial
	mov si, len2
    call 	w_strng

	call kb
	cmp 	al, "S" ;  cinco letras
	jne	mis
	call borr
	ret
	


mostrar:
	mov	bl, 01000110b ; atributo de caracter (cafe:0110)(rojo:0100)
    ;mov     bh, 0h
	call 	w_strng

	call 	kb	; solo detenemos la ejecución

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb:	mov	ah, 00h ;subrutina que detiene la ejecución hasta recibir
	int 	16h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL

w_strng:mov	ah, 13h
	mov 	al, 01h ; asigna a todos los caracteres el atributo de BL,
			; actualiza la posición del cursor
	mov 	bh, 00h ; número de página
	;mov	bl, 00001111b ; atributo de caracter (cafe:0110)(rojo:0100)
	mov	cx, si ; tamaño del string (SI, porque todavía guarda la última posición)
	;mov	dl, 43h ; columna inicial
	;mov	dh, 15h	; fila inicial
	; Como esta interrupción saca el string de ES:BP, tenemos que poner los valores correcpondientes
	push 	cs ; Segmento actual en el que está guardado nuestro string
	pop	es ; Puntero al segmento que queremos 
	;mov	bp, 400h ; Dirección inicial de nuestra cadena de texto
	; ES:BP equals CS:300h 
	int 10h
	ret

section .data

validacion	db 	"1234567890"
msg db "No Cumple"
len equ	$-msg
msg2 db "S para calcular"
len2 equ	$-msg2
msg3 db "Ingrese dos digitos"
len3 equ	$-msg3
carnex db "Notas :  2 7 7 1 7.   Promedio : 4.8 -> 5"
lenCarnex equ	$-carnex
comentario db "En el segundo :'v"
lenComentario equ $-comentario