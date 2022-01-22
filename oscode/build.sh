rm main.bin

echo "start"
nasm main.asm -o main.bin

kvm main.bin
