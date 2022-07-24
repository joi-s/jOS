[bits 32]
vram equ 0xb8000
mode equ 0x0f

p32test:
	pusha
	mov edx, vram

.pstr:
	mov bl, [eax]
	mov bh, mode
	
	cmp bl, 0
	je .done
	
	mov [edx], bx
	
	add eax, 1
	add edx, 2
	
	jmp .pstr
	
.done:
	popa
	ret
	
