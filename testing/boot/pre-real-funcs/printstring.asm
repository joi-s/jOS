
; nsbu  (not set by user)

; print string function for 16 bit real mode
p16str:
  ; ax- adress of the string
  ; bx-(nsbu)

  ; save reg
  push ax
  push bx

  ;get char at bx into ax 
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

  ; bring back reg
  pop ax
  pop bx

  ret


pn16str:
  ; ax- adress of the string
  ; bx-(nsbu)

  ; save reg
  push ax
  push bx

  ;get char at bx into ax 
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
  
  ;print new line 
  call nl

  ; bring back reg
  pop ax
  pop bx

  ret
