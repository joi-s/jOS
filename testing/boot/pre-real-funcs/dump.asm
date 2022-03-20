dump:
	mov ax, str
	mov bx, ax
  	mov ax, [bx]
.loop:
  ; call print char
  call p16char

  ; get char at bx into ax 
  inc bx
  mov ax, [bx]
  cmp ax, '+'
  jne .loop
  jmp hlt