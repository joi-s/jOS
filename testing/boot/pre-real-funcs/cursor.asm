;get cursor position
c16get:
	mov ah, 0x03
	int 0x10
	
	ret

c16set:
	;DH-Row
	;DL-Column
	mov ah, 0x02
	int 0x10

	ret

