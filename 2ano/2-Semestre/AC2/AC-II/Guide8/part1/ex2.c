#include <detpic32.h>

static int counter = 0;

int main(void) {
    T3CONbits.TCKPS = 7; 
    PR3 = 39062; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    IPC3bits.T3IP = 3; 
    IEC0bits.T3IE = 1; 

    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void _int_(12) isr_T3(void) {
    IFS0bits.T3IF = 0; 
    if(counter == 0) {
        putChar('.');
    }
    counter != counter;
}
