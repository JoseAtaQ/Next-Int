
public static int get_bit(){
	int bit = -1;
	int c;

	mips.read_c();
    c = mips.retval();

	if (c == '0'){
		bit = 0;
	}
	if (c == '1'){
		bit = 1;
	}	
	return bit;
} // end get_bit


public static int bits2int(){
	int bits;
	int i;
	int x;
	int [] arr;
	arr = new int [5];
	
	for (bits = get_bit(); bits != -1; bits = get_bit()){
		arr[i] = bits;
		x = arr;
	}	
	return x;
	
}


