
public static int get_bit(){

	int c;

	mips.read_d();
    c = mips.retval();

	if (c == 0){
		return 0;
	}
	else if (c == 1){
		return 1;
	}else {
		return -1;
	}

} // end get_bit


public static int bits2int(){
	int bits;

	bits = get_bit();
	return bits;
}


