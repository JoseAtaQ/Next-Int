
public static int get_bit(){
	int bit;
	int c;

	mips.read_c();
    c = mips.retval();

	if (c == 0){
		bit = 0;
	}
	else if (c == 1){
		bit = 1;
	}else {
		bit = -1;
	}
	return bit;
} // end get_bit


public static int bits2int(){
	int bits;

	return get_bit();
	
}


