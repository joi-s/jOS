[bits 16]
global boot

.text

bd: db 0

boot:
	mov [bd], dl
	cli
	xor ax, ax	
	mov ds, ax
	mov es, ax
	mov bx, ax
	cli
	mov ss, bx

	cld
	jmp .main
.main:
	mov al, 'h'
	mov ah, 0x0e
	int 10h
	call load_kern
	mov al, 'p'
	mov ah, 0x0e
	int 10h
	
	
	
	jmp hlt
	
	
load_kern:

	
	
	mov bx, 0x1000
	mov dh, 2
	mov dl, [bd]
	call loaddisk
	
	mov ah, 00h
	mov al, 00h
	int 0x10
	call 0x1000
	ret

loaddisk:
	pusha
	push dx
	
	mov ah, 0x02
	mov al, dh
	mov cl, 0x02
	
	mov ch, 0x00
	mov dh, 0x00
	
	int 0x13
	jc hlt
	pop dx
	cmp al, dh
	jne hlt
	popa
	ret
	
hlt:
	mov al, 'e'
	mov ah, 0x0e
	int 10h
	mov al, 'n'
	mov ah, 0x0e
	int 10h
	mov al, 'd'
	mov ah, 0x0e
	int 10h
	jmp .hlt
.hlt:
	jmp .hlt

times 510-($-$$) db 0
dw 0xaa55       ; mark as bootable
