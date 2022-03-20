
[bits 16]
[org 0x7c00]

boot:
	cli
	xor ax, ax	
	mov ds, ax
	mov es, ax
	mov ss, ax
	
	jmp .main
.main:
	call term
	
	jmp hlt

hlt:
	mov ax, hltmsg
	call pn16str
	jmp .loop
.loop:
	jmp .loop



%include "pre-real-funcs/printstring.asm"
%include "pre-real-funcs/printchar.asm"
%include "pre-real-funcs/newline.asm"
%include "pre-real-funcs/cursor.asm"
%include "pre-real-drivers/keyboard16.asm"
%include "pre-real-term/termmain.asm"
%include "data.asm"


times 510-($-$$) db 0
dw 0xaa55       ; mark as bootable
