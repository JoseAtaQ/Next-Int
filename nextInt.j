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
    int i;
    int j;
    int r = 0;
    int buffer_length;
    int fir;
    int sec = 0;
    

    mips.read_s(buffer, 256);
    buffer_length = mips.retval();

    //while(buffer[i] != '\0' && buffer[i] != -1)

    for (i = 0; buffer[i] != '\0'; i++){
        fir = glyph2int(buffer[i], radix);
        if (fir == -1){
            break;
        }
        for (j = i+1; buffer[j] != '\0'; j++){
            sec = glyph2int(buffer[j], radix);
            if (sec == -1){
                break;
            }    
        }   
        r = fir * radix + sec;
       
        
    }// end for  
    
    return r;
}// end nextInt

