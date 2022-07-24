void memcopy(uint8_t *from, uint8_t *to, uint32_t nbytes){
	int i = 0;
	while (i < nbytes){
		*(to + i) = *(from + i);
		i++;
	}
}
