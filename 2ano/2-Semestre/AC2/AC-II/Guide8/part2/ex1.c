#include <detpic32.h>

int main(void) {
    T2CONbits.TCKPS = 4; 
    PR2 = 49999; 
    TMR2 = 0; 
    T2CONbits.TON = 1; 



    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void _int_(8) isr_T2(void) {

}

void _int_(7) isr_INT1(void) {

}
