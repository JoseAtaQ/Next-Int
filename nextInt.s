.data                                 
buffer:       .space 256                
                .text                
                .globl nextInt
                .globl glyph2int

                .include "macros/syscalls.s"    
                .include "macros/subroutine.s"
                .include "macros/stack.s"
                .macro dec(%reg)
                  addi %reg, %reg, -1
                .end_macro
                

glyph2int:      nop                     #public static int glyph2int(char glyph, int radix){
                #$t0: glyph
                #$t1: radix

                move $t0, $a0           
                move $t1, $a1                                              

                #$t2: i                 #int i = 0;
                #$t3: c                 #int c = 0;
                li $t2, 0
                li $t3, 0

initA:          nop                     #;
                                        #if (glyph >= 'A' && glyph <= 'F'){
consA:                                  #   ;          
                                        #   c = glyph - 'A' + 10;
                                        #}
forwardA:                               # ;

inita:                                  #;         
                                        #if (glyph >= 'a' && glyph <= 'f'){
consa:                                  #    ;                
                                        #    c = glyph - 'a' + 10;
                                        #} 
forwada:                                #;

init0:                                  #;            
                                        #if (glyph >= '0' && glyph <= '9'){
cons0:                                  #    ;                
                                        #    c = glyph - '0';
                                        #}
forwad0:                                #;

init:                                   #;            
                blt $t2, $t1, forwad    #if (c >= radix){
cons:           nop                     #    ;
                        li $t3, -1      #    c = -1;
                                        #}
forwad:         nop                     #;        
                move $v0, $t3           #return c;

                                        #}// end glyph2int
                
                                        #static char [] buffer = new char[256];

nextInt:        nop                     #public static int nextInt(int radix){
            
                #$t4:                   int buffer_length;
                #$t5                    int i;
                li $t6, 0               #int r = 0;
                li $t7, 0               #int value = 0;
                #$t8                    mips.read_s(buffer, 256);
                #$t9                    buffer_length = mips.retval();                                     #    i = 0;
fnit:       ;
loop:       for (; buffer[i] != '\0';){       
body:           ;
                value = glyph2int(buffer[i], radix);// gives me the value of a glyph following the index
        initF:  ;      
                if (value != -1){
        consF:      ;   
                    r = r * radix;
                    r = r + value;
                }
        forwadF:;
                i ++;
                continue loop;
            }// end for
done:       ;       
    return r;
}// end nextInt


// java complete: Fri Nov 10 15:27:52 PST 2023

// java tac complete: Fri Nov 10 16:46:50 PST 2023
