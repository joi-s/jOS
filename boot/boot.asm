[org 0x7c00]
koff equ 0x1000  ; defining the kernal offset

 
mov [BOOT_DRIVE], dl ; Remember that the BIOS sets us the boot drive in 'dl' on boot
mov bp, 0x9000 ;setup stack 
mov sp, bp	   ;^^^^^ ^^^^^



call loadkern ; jump to start (this line is verry unneccisary but whatever)
call switch_to_32bit
jmp halt
%include "boot/16bitlibs/printstring.asm"
%include "boot/16bitlibs/printchar.asm"
%include "boot/16bitlibs/newline.asm"
%include "boot/16bitlibs/disk.asm"
%include "boot/gdt.asm"
%include "boot/16bitlibs/pm.asm"

[bits 16]
loadkern:
	
	;mov ax, Hello ;print welcome message with new line
	;call pn16str  ;^^^^^ ^^^^^^^ ^^^^^^^ ^^^^ ^^^ ^^^^
	
	; setup values for the load from disk function
	mov bx, koff ;^^- kernal offset
	mov dh, 31 ;^^- number of sectors (i think, to lazy to check)
	mov dl, [BOOT_DRIVE] ;^^- disk number
	call load ;^^- put it all in motion
	
	;mov ax, Enter ; print switch msg with new line
	;call pn16str  ; ^^^^^
	
	 ;switch to 32 bit protected mode 
	
	;jmp halt ; how dare you even think of returning from such a retarded adress
	ret
; include functions to do shit


; in case i just want the cpu to sit and do nothing forever
halt:
	jmp halt


	


[bits 32]
 BEGIN_32BIT:
	call koff ;jump to the kernal entry (0x1000)
	;jmp halt
	
	
;defining vars
BOOT_DRIVE db 0
Hello db "Booting into 16bit mode :)", 0
Enter: db "Entering 32 bit mode", 0

times 510 - ($-$$) db 0
dw 0xaa55





