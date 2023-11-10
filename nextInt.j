public static int glyph2int(char glyph, int radix){
    // deals with glyphs
    // converts glyph to digits

    int i = 0;
    int c = 0;

    if (glyph >= 'A' && glyph <= 'F'){
        c = glyph - 'A' + 10;
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
    int i;
    int j;
    int r = 0;
    int buffer_length;
    int c;

    mips.read_s(buffer, 256);
    buffer_length = mips.retval();

    for (i = 0; buffer[i] != '\0'; i++){

        r = buffer[i] * radix + buffer[i+1];
        if (buffer[i] > radix){
            buffer[i] = '\0';
        }
        
        /*c = glyph2int(buffer[i], radix);
        for (j = 0; c != -1; j++){
            r = c * radix + c; 
        }*/
    }// end for  
    
    return r;
}// end nesInt

