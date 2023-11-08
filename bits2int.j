
public static int get_bit(){
	int result;
	int c;

	mips.read_d();
    c = mips.retval();

	if (c == 0){
		result = 0;
	}
	if (c == 1){
		result = 1;
	}else {
		result = -1;
	}
	return result;

} // end get_bit


public static int bits2int(){
	int bits;

	bits = get_bit();
	return bits;
}


