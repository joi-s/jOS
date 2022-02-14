; nsbu = (not set by user)

; print string function for 16 bit real mode
16pstr:
  ; ax- adress of the string
  ; bx-(nsbu)-
  ; save reg
  push ax
  push bx
  
  ;get char at bx into ax 
  mov bx, ax
  mov ax, [bx]
  
.loop:
  ; call print char
  call 16pchar
  ; get char at bx into ax 
  inc bx
  mov ax, [bx]
  cmp ax, '$'
  
  ; bring back reg
  pop ax
  pop bx 
  
  ;return
  ret
