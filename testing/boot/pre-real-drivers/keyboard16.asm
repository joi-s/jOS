kr16char:
	mov ah, 0x00
	int 0x16 ;save key into ax: ah-scan code al-ascii
	ret


;this is less fucking janky lol
cmp16str:
	;ax- str 1
	;bx- str 2
	
	MOV SI, ax
	MOV DI, bx 
	mov cx, 4
	repe    cmpsb 
	CLD
	ret
	
