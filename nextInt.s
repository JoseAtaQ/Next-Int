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

initA:           nop                    #;
                blt $t0, 'A' forwardA   #if (glyph >= 'A'){
        initF:          nop             #        ;      
                        bgt $t0, 'F' forwadF   # if (glyph <= 'F'){
consA:          nop                     #;          
                                sub $t3, $t0, 'A' #        c = glyph - 'A'
                                addi $t3, $t3, 10 #        c = c + 10;
                                        #        }
        forwadF:        nop             #        ;       
                                        #}
forwardA:       nop                     #;

inita:          nop                     #;         
                blt $t0, 'a' forwada    #if (glyph >= 'a'){
        initf:          nop             #        ;      
                        bgt $t0, 'f' forwadf   # if (glyph <= 'f'){
consa:          nop                     #;                
                                sub $t3, $t0, 'A' #        c = glyph - 'a'
                                addi $t3, $t3, 10 #        c = c + 10;
                                        #        }
        forwadf:        nop             #        ;            
                                        #} 
forwada:        nop                     #;

init0:          nop                     #;            
                blt $t0, '0' forwad0    #if (glyph >= '0'){
        init9:          nop             #        ;      
                        bgt $t0, '9' forwad9   # if (glyph <= '9'){
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
                la $t2, buffer          #$t3: buffer[i]       
                add $t2, $t2, $t5
                lb $t3, 0($t2) 

                li $t5, 0               #i = 0;
fnit:           nop                     #;

loop:           beq $t3, '\0' done      #for (; buffer[i] != '\0';){       
body:           nop                     #;
                call glyph2int $t3 $t1  #       value = glyph2int(buffer[i], radix);
                move $t7, $v0
        initr:          nop             #       ;      
                        beq $t7, -1 forwadr #   if (value != -1){
        consr:          nop             #       ;   
                                mul $t6, $t6, $t1  #  r = r * radix;
                                add $t6, $t6, $t7  #  r = r + value;
                                        #       }
        forwadr:        nop             #       ;
                addi $t5, $t5, 1        # i++;
                b loop                  # continue loop
                                        # }// end for
done:           nop                     # ;       
        move $v0, $t6                   # return r;
        jr $ra
                                        #}// end nextInt


#// java complete: Fri Nov 10 15:27:52 PST 2023

#// java tac complete: Fri Nov 10 16:46:50 PST 2023

#// Mips bad output: Sat Nov 11 22:12:54 PST 2023
