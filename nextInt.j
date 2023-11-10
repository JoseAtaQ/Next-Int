public static int glyph2int(char glyph, int radix){
    // deals with one glyph
    // convert one glyph to int

    int i = 0;
    int c = -1;

    // special case base 16
    if (radix == 16 || glyph >= 'a'){
        c = glyph - 'A' + 10;
    } 

    return c;
}


static char [] buffer = new char[256];

public static int nextInt(int radix){
    // deals with bunch of glyphs
    int i;
    int r = 0;
    int buffer_length;

    mips.read_s(buffer, 256);
    buffer_length = mips.retval();


    for (i = 0; buffer[i] != '\0'; i++){
        r = buffer[i] * radix + buffer[i+1];  
    }

    return r;
}

