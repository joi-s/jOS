;bits 16
org 0x7c00

boot:
	cli
	cld
	xor ax,ax
	mov ds, ax
.loop 
	jmp scr
	jmp .loop

.haltloop:
	jmp .haltloop
//include console.asm
scr:
	;gets into graphics mode
	mov ah, 0x00
	mov al, 0x04
	int 0x10
	;go to screen 1
	mov ah, 0x05
	mov al, 1
	int 0x10
	;sets paramitors for graphics
	mov ah, 0x0c
	mov al, 5
	mov cx, 0
	mov dx, 0
        mov bl, 0
	mov bh, 1 
	int 0x10
	mov bh, 1
.loop:
        ;sets mode and prints
	mov ah, 0x0c
	int 0x10

        add bl, 1
        cmp bl, 5
	je .color
        
	jmp .line
.line:
	add cx, 1
	cmp cx, 320
	je .linedown
	jmp .loop
.linedown:
	mov cx, 0
	add dx, 1
        cmp dx, 200
        jne .loop 
	jmp .cls
        jmp .loop
.cls:
       	mov ah, 0x05
	mov al, 2
	int 0x10
	jmp .loop
.hlt:
	jmp .hlt
.color:
        mov bl, 0
        add al, 1
	cmp al, 16
	je .res
	jmp .loop
.res:
	mov al, 0
	jmp .loop
.done
	jmp .done

times 510 - ($-$$) db 0

dw 0xaa55

