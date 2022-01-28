.data
prompt db "->", 0
.code

cons:
	nop
.loop:
	jmp .loop
