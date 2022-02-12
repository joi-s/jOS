.text
.code16gcc

.globl kernalload
push %cs
pop %ax
movw %ax, %ds
movw %ax, %es
movw %ax
