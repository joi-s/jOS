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


print_string:
	mov ah, 0x0e
.repeat:
	lodsb
	cmp al,0
	je .done
	int 0x10
	jmp .repeat 
.done:
	jmp .done


scr:
	;gets into graphics mode
	mov ah, 0x00
	mov al, 0x04
	int 0x10
	;sets paramitors for graphics
	mov ah, 0x0c
	mov al, 1
	mov cx, 0
	mov dx, 0
        mov bl, 0
.loop:
        ;sets mode and prints
	mov ah, 0x0c
	int 0x10

        add bl, 1
        cmp bl, 10
	je .color
        
        ;continues to loop      
        jmp .loop2
.loop2:
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
        mov ah, 0x0c
	mov al, 1
	mov cx, 0
	mov dx, 0
        mov bl, 0
        ret
.color:
        mov bl, 0
        add al, 1
	cmp al, 4
	je .res
	jmp .loop2
.res:
	mov al, 0
	jmp .loop2
.done
	jmp .done

times 510 - ($-$$) db 0

dw 0xaa55

