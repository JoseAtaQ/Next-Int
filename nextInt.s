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

nitA:           nop                     #;
                blt $t0, 'A'            #if (glyph >= 'A'){
        initF:          nop             #        ;      
                        bgt $t0, 'F'    #        if (glyph <= 'F'){
consA:          nop                     #;          
                                sub $t3, $t0, 'A' #        c = glyph - 'A'
                                addi $t3, 10      #        c = c + 10;
                                        #        }
        forwadF:        nop             #        ;       
                                        #}
forwardA:       nop                     #;

inita:          nop                     #;         
                blt $t0, 'a'            #if (glyph >= 'a'){
        initf:          nop             #        ;      
                        bgt $t0, 'f'    #        if (glyph <= 'f'){
consa:          nop                     #;                
                                sub $t3, $t0, 'A' #        c = glyph - 'a'
                                addi $t3, 10      #        c = c + 10;
                                        #        }
        forwadf:        nop             #        ;            
                                        #} 
forwada:        nop                     #;

init0:          nop                     #;            
                blt $t0, '0'            #if (glyph >= '0'){
        init9:          nop             #        ;      
                        bgt $t0, '9'    #        if (glyph <= '9'){
cons0:          nop                     #;                
                                sub $t3, $t0, '0'#       c = glyph - '0';
                                        #        }
        forwad9:        nop             #        ;            
                                        #}
forwad0:        nop                     #;

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

                move $t1, $a0
            
                #$t4:                   int buffer_length;
                #$t5                    int i;
                li $t6, 0               #int r = 0;
                li $t7, 0               #int value = 0;
                li $t8, 256             #mips.read_s(buffer, 256);
                la $t9, buffer          #$t9: buffer
                read_s($t9, $t8)
                                        #buffer_length = mips.retval();    
            #i = 0;
fnit:       ;
loop:       for (; buffer[i] != '\0';){       
body:           ;
                value = glyph2int(buffer[i], radix);// gives me the value of a glyph following the index
        initr:  ;      
                if (value != -1){
        consr:      ;   
                    r = r * radix;
                    r = r + value;
                }
        forwadr:;
                i ++;
                continue loop;
            }// end for
done:       ;       
    return r;
}// end nextInt


#// java complete: Fri Nov 10 15:27:52 PST 2023

#// java tac complete: Fri Nov 10 16:46:50 PST 2023
