#include <stdint.h>


unsigned char port_in(uint16_t port){
	unsigned char result;
	asm("in %%dx, %%al": "=a" (result) : "d" (port));
	return result;
}
void port_out(uint16_t port,uint8_t data){
	asm("out %%al, %%dx" : : "a" (data), "d" (port));
} 
