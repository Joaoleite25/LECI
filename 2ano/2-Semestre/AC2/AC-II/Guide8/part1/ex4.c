#include <detpic32.h>

static int counter = 0;

int main(void) {
    T3CONbits.TCKPS = 4; 
    PR3 = 49999; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    T1CONbits.TCKPS = 2; 
    PR1 = 62499; 
    TMR1 = 0; 
    T1CONbits.TON = 1; 

    IPC3bits.T3IP = 3;
    IEC0bits.T3IE = 1; 
    IFS0bits.T3IF = 0; 

    IPC1bits.T1IP = 1; 
    IEC0bits.T1IE = 1; 
    IFS0bits.T1IF = 0; 

    TRISE = TRISE & 0xFFF5;
    LATE = LATE & 0xFFF5;

    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void _int_(12) isr_T3(void) {
    putChar('3');
    LATEbits.LATE3 = !LATEbits.LATE3;
    IFS0bits.T3IF = 0; 
}

void _int_(4) isr_T1(void) {
    putChar('1');
    LATEbits.LATE1 = !LATEbits.LATE1;
    IFS0bits.T1IF = 0; 
}
