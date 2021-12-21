rm constvars.obj
rm main.obj
rm out.bin
rm out.bin.new

echo "start"
nasm -f elf64 main.asm -o main.obj
nasm -f elf64 constvars.asm -o constvars.obj

gcc -m64 -nostdlib -nodefaultlibs -lgcc main.obj constvars.obj -r linker.ld -o out.bin

objcopy -O binary out.bin out.bin.new

kvm -fda out.bin.new
