public static int glyph2int(char glyph, int radix){
    // deals with glyphs one by one
    // convert one glyph to int

    int i = 0;
    int c = -1;

    if (radix == 16){
        c = glyph - 'A' + 10;
    }

    i = i * radix + glyph; 


    return i;
}


static char [] buffer = new char[256];

public static int nextInt(int radix){
    // deals with bunch of glyphs

    int buffer_length;

    mips.read_s(buffer, 256);
    buffer_length = mips.retval();  


    return 0;
}

