nl:
	push ax
	
	mov ax, 0xa
	call p16char
	mov ax, 0xd
	call p16char


	pop ax
	ret

