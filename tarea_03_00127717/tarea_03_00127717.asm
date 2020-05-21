    org 	100h

section .text
	
	call 	texto	
	call 	cursor
	;mov		dl, 1h
	call 	phraseA
	call 	phraseB
	call 	phraseC
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, [flag + si] ; fila
	mov 	bh, 0h
	int 	10h
	ret

phraseA:	mov 	di, 35d
lupiA:	mov 	cl, [msg+di-35d]
	mov 	si, 0h
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupiA
	ret

phraseB:	mov 	di, 15d
lupiB:	mov 	cl, [array+di-15d]
	mov 	si, 1h
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, lenA
	jb	lupiB
	ret

phraseC:	mov 	di, 29d
lupiC:	mov 	cl, [arrayB+di-29d]
	mov 	si, 2h
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, lenB
	jb	lupiC
	ret


section .data
msg	db 	"Agonizas Carl..."
len 	equ	$-msg+35d
array db 	"Le dices NO a la vida... "
lenA 	equ	$-array+15d
arrayB db 	"Por lo tanto NO estas vivo!!!."
lenB 	equ	$-arrayB+29d
flag db 5,12,18


