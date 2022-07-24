global entry
[bits 32]

entry:
	[extern main]
	call main
	jmp $ ;incase kernal has the nerve to return
