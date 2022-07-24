void movcursor(int x, int y){
	uint16_t loc = y*80+x;
	port_out(0x3d4, 14);
	port_out(0x3d5, loc >> 8);
	port_out(0x3d4, 15);
	port_out(0x3d5, loc);
}
void setcursor(int offset){
	int loc = offset/2;
	port_out(0x3d4, 14);
	port_out(0x3d5, loc >> 8);
	port_out(0x3d4, 15);
	port_out(0x3d5, loc);
}
int getcursor(){
	port_out(0x3d4, 14);
	int pos = port_in(0x3d5) << 8 ;
	port_out(0x3d4, 15);
	pos += port_in(0x3d5);
	return pos * 2;
}
