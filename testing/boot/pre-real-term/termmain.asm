.text
term:
	mov ax, wel
	call pn16str
	mov ax, mode16
	call pn16str
	jmp .loop
.loop:
	mov ax, prompt
	call p16str
	call .userinp
	jmp .loop
	jmp hlt
.userinp:
	call kr16char
	call .store
	call p16char
	
	cmp al, 0x0D
	jne .userinp
	
	call nl
	
	ret
.store:
	ret
