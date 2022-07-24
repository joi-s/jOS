#define vram 0xb8000
#define mode 0x0f
#define rows 25
#define coloms 80


void print(char *str){
	//initial vals
	int offset = getcursor();
	int i = 0;
	
	//str loop
	while(str[i] != 0){
		if (str[i] == '\n'){
			offset = nl(offset);	
			offset += 2;
		} else {
			printchar(str[i], offset);
			offset += 2;
		}
		
		i++;
	}
	setcursor(offset);
}
void printcolor(char *str, char color){
	//initial vals
	int offset = getcursor();
	int i = 0;
	
	//str loop
	while(str[i] != 0){
		if (str[i] == '\n'){
			offset = nl(offset);	
			offset += 2;
		} else {
			printcharcolor(str[i], offset,color);
			offset += 2;
		}
		
		i++;
	}
	setcursor(offset);
}
int nl(int offset){
	return getoffset(0, ((offset/ (2*coloms)) +2));
}
void printchar(char c, int offset){
	//setup modes
	char *vmem = (char *) vram;
	char charmode = mode;
	
	//print the char
	vmem[offset] = c;
	vmem[offset+1] = charmode;
}
void printcharcolor(char c, int offset, char charmode){
		//setup modes
	char *vmem = (char *) vram;
	
	//print the char
	vmem[offset] = c;
	vmem[offset+1] = charmode;
}
int getoffset(int x, int y){
	int off = y-1;
	off *= 160;
	x-=1;
	off += x*2;
	return off;
}
void clearrow(int row){
	int offset = getoffset(0,row);
	
	for (int i=0; i< coloms; i++){
		printchar(' ', offset);
		offset += 2;
	}
	
}
void drawsquare(int color, int x, int y){
	char *vmem = (char *) vram;
	char c = '0';
	int offset = getoffset(x,y);
	vmem[offset] = c;
	vmem[offset+1] = color;
}
void clearscreen(){
	int i = 1;
	
	while (i <= rows){
		clearrow(i);
		i++;
	}
}
void draw(char *line,int off ,char color, char backcolor, int len){
	//initial vals
	int offset = getcursor();
	int i = 0;
	
	//str loop
	while (i <= off){
		printcharcolor(' ', offset, backcolor);
		i++;
		offset += 2;
	}
	
	i = 0;
	
	while(line[i] != 0){
		if (line[i] == ' '){
			printcharcolor(' ', offset, backcolor);
			offset += 2;
		} else {
			printcharcolor(line[i], offset,color);
			offset += 2;
		}	
		i++;
	}
	
	i = 0;
	
	while (i < coloms - len - off){
		printcharcolor(' ', offset, backcolor);
		i++;
		offset += 2;
	}
	
}

void scroll(){
	memcopy(
		(uint8_t * )(getoffset(0,1) + vram),
		(uint8_t * )(getoffset(0,0) + vram),
		coloms * (rows - 1) *2
	);
	
	
}
