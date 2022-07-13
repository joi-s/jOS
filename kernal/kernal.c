void test(){
	char* vram = (char*) 0xb8000;
	*vram = "|";
	return;
}

void main(){
	test();
	return;
}
