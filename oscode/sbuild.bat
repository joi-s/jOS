del main.bin
del main.lnkd
pause
cls

python linker.py main.asm
pause
cls

nasm main.lnkd -o main.bin
pause
cls

qemu -L "C:\Program Files\qemu" main.bin
Pause