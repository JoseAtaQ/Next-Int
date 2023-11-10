public static int glyph2int(char glyph, int radix){
    // deals with glyphs
    // converts glyph to digits

    int i = 0;
    int c = 0;

    if (glyph >= 'A' && glyph <= 'F'){
        c = glyph - 'A' + 10;
    } 
    if (glyph >= 'a' && glyph <= 'f'){
        c = glyph - 'a' + 10;
    } 
    if (glyph >= '1' && glyph <= '9'){
        c = glyph - '0';
    }
    if (c >= radix){
        c = -1;
    } 
    return c;

}


static char [] buffer = new char[256];

public static int nextInt(int radix){
    // deals with bunch of glyphs
    int buffer_length;
    int i;
    int r = 0;
    int value = 0;
    

    mips.read_s(buffer, 256);
    buffer_length = mips.retval();

    for (i = 0; buffer[i] != '\0'; i++){

        value = glyph2int(buffer[i], radix);// gives me the value of a glyph following the index
        if (value != -1){
            r = r * radix + value;
        }
    }// end for  
    return r;
}// end nextInt


// Task 1 complete: Fri Nov 10 15:21:31 PST 2023

// java complete: Fri Nov 10 15:27:52 PST 2023
