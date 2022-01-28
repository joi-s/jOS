rm main.bin
rm main.lnkd

echo "start"
python linker.py main.asm 

nasm main.lnkd -o main.bin

kvm main.bin
