.text


boot:
  cli		; no interrupts
	xor ax, ax	; zero out
	mov ds, ax
	mov es, ax
	mov ss, ax
	
	jmp main






times 510-($-$$) db 0	
dw 0xaa55		; mark as bootable
