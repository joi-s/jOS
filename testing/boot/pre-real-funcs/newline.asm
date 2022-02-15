nl:
	push ax
	
	mov ax, 0xa
	call p16char
	
	pop ax
	ret
