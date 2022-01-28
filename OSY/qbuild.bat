del main.bin
del main.lnkd
python linker.py main.asm
nasm main.lnkd -o main.bin

qemu -L "C:\Program Files\qemu" main.bin


Pause