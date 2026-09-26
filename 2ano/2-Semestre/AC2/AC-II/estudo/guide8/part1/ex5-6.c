#include <detpic32.h>

void configureT1(void);
void configureT3(void);
void configurePorts(void);

int main(void) {
    configurePorts();
    configureT1();
    configureT3();

    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void configurePorts(void) {
    TRISDbits.TRISD0 = 0;
    TRISDbits.TRISD2 = 0;

    TRISEbits.TRISE1 = 0;
    TRISEbits.TRISE3 = 0;
    
    LATDbits.LATD0 = 0;
    LATDbits.LATD2 = 0;

    LATEbits.LATE1 = 0;
    LATEbits.LATE3 = 0;
}

void configureT1(void) {
    T1CONbits.TCKPS = 6; 
    PR1 = 62499; 
    TMR1 = 0; 
    T1CONbits.TON = 1; 

    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T1 interrupts
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag
}

void configureT3(void) {
    T3CONbits.TCKPS = 4; 
    PR3 = 49999; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    IPC3bits.T3IP = 3; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
}

void _int_(4) isr_T1(void) {
    putChar('1');
    IFS0bits.T1IF = 0;
    LATDbits.LATD0 = !LATDbits.LATD0;
    LATEbits.LATE1 = !LATEbits.LATE1;
}

void _int_(12) isr_T3(void) {
    putChar('3');
    IFS0bits.T3IF = 0;    
    LATDbits.LATD2 = !LATDbits.LATD2;
    LATEbits.LATE3 = !LATEbits.LATE3;
}
