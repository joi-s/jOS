kr16char:
	mov ah, 0x00
	int 0x16
	ret


;super fucking janky lol
cmp16str:
	; ax- adress of the string1
  	; bx- adress of the string2
  	
  	mov ax, prompt
	mov bx, prompt
  	;save string2
    push bx

    ;string 1
    mov bx, ax ;mov string adress into bx
  	mov ax, [bx] ;mov char into ax
  	mov [tax], ax ;save char in tax
	mov [ac], bx ;save adress in ac

	;restore string2 into ax
	pop bx
	mov ax, bx

	mov bx, ax ;mov string adress into bx
  	mov ax, [bx] ;mov char into ax
  	mov [tbx], ax ;save char in tbx
	mov [bc], bx ;save adress in bc
	
	jmp .loop

	ret
.loop:
	;get chars into ax and bx
	mov ax, [tax]
	mov bx, [tbx]
	
	;test if they are the same
	cmp al, bl
	
	;if al != bl jmp .not
	jne .not 

	;if al == bl jmp .loop2
	je .loop2

	ret
	
.loop2:
	;get char into ax (we know they are the same if we are at this point)
	mov ax, [tax]
	;check if its zero
	cmp al, 0
	;jump to is if it is
	je .is
	
	jne .loop3
	
	ret
.loop3:
	;inc the addresses
	
	;string 1
    mov bx, ac ;mov string adress into bx
  	inc bx ; incriment 
  	mov [ac], bx ;save adress in ac

  	;string 2
    mov bx, bc ;mov string adress into bx
  	inc bx ; incriment 
  	mov [bc], bx ;save adress in bc
  	
  	ret
.not:
	mov ax, 1
	call p16char
	mov [zf], ax
	ret
.is:
	mov ax, 0
	call p16char
	mov [zf], ax
	ret
