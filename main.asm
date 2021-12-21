bits 16
;org 0x7c00

section .text
	global boot

boot:
	cli
	cld
	xor ax,ax
	mov ds, ax
.loop:
	mov si, vars.test
	jmp print_string
	
.haltloop:
	jmp .haltloop

print_string:
	mov ah, 0x0e
.repeat:
	lodsb
	or al,al
	jz .done
	int 0x10
	jmp .repeat 
.done:
	ret

%include "constvars.asm"

times 510 - ($-$$) db 0

dw 0xaa55

