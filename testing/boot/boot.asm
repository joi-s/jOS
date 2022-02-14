boot:
	cli
	xor ax, ax	
	mov ds, ax
	mov es, ax
	mov ss, ax
	
	jmp main
main:
	nop


times 510-($-$$) db 0	
dw 0xaa55		; mark as bootable
