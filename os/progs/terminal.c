const char startp[] = "(";
const char endp[] = ")->";

void terminal_main(){
	char startmsg[] = "JOS terminal program version 0.0.1 \n";
	
	printsysprompt();
	print(startmsg);
	printprompt();
}
void printsysprompt(){
	char sysprompt[] = "system";
	print(startp);
	printcolor(sysprompt, 0x0a);
	print(endp);
}
void printprompt(){	
	char prompt[] = "user";
	print(startp);
	printcolor(prompt, 0x0c);
	print(endp);

	
	
}
