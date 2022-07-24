#include "drivers/drivers.h"
#include "libs.h"
#include "../progs/terminal.h"

typedef struct{
	int x;
	int y;
} xypos;

int main(){
	clearscreen();
	movcursor(0,0);
	lable();
	terminal_main();
}

void lable(){
	char color = 0xdd;
	
	//line one
	int i = 0;
	char line1[81];
	
	while(i < 80){
		line1[i] = '=';
		i++;
	}
	line1[i] = '\n\0';
	
	printcolor(line1, 0x05);
	
	//other lines
	// lineoff = (80 - len)/2
	int lineoff = 28;
	char l2[] = "====== ===== ======";
	char l3[] = "    == == == ==    ";
	char l4[] = "    == == == ======";
	char l5[] = "==  == == ==     ==";
	char l6[] = "====== ===== ======";
										   //
	movcursor(0,1);
	draw(l2, lineoff,0x44, 0x88, sizeof l2);
	movcursor(0,2);
	draw(l3, lineoff,0x44, 0x88, sizeof l3);
	movcursor(0,3);
	draw(l4, lineoff,0x44, 0x88, sizeof l4);
	movcursor(0,4);
	draw(l5, lineoff,0x44, 0x88, sizeof l5);
	movcursor(0,5);
	draw(l6, lineoff,0x44, 0x88, sizeof l6);
	movcursor(0,6);
	
	printcolor(line1, 0x05);
	
	//last
	char welcome1[] = "welcome to ";
	char welcome2[] = "JOS \n";
	printcolor(welcome1, 0x03);
	printcolor(welcome2, 0x05);
	movcursor(0,8);
}


