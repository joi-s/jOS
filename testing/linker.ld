ENTRY(boot);
SECTIONS{
	. = 0x7c00;
	.text.start : {boot.bin}
	. = 0x1000;
	.text: {ker.o(.text)}
	.data : {*(.data)}
	.bss  : {*(.bss)}
}

