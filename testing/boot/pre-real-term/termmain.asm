.text
term:
	;print welcome msg
	mov ax, wel
	call pn16str
	
	;print mode msg
	mov ax, mode16
	call pn16str
	
	mov bx, usivar
	mov [bc], bx ;save adress in bc
	
	jmp .loop	
	jmp hlt
.loop:
	;print "->"
	mov ax, prompt
	call p16str
	mov ax, 0
	mov bx, usivar
	call .userinp;user input handler
	mov ax, usivar
	mov bx, c1
	call cmp16str
	je .c1e
	jmp .loop ; jump to loop
	jmp hlt ; if it dare returns jmp to halt 
.commhandle:
	mov ax, usivar
	mov bx, c1
	call cmp16str
	je .c1e
	ret
.c1e:
	mov ax, bob
	call pn16str
	jmp .loop
.userinp:
	call kr16char; get key pressed
	
	call .store ; store that shit
	
	call p16char; 
	
	cmp al, 0x0D
	jne .userinp
	
	mov al, 0
	dec bx
	call .store
	call nl
	
	ret
.store:
	;string 1
    mov [bx], al ;mov string adress into bx
	inc bx
	ret
