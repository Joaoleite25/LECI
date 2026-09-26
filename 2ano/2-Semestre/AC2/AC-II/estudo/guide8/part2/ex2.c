#include <detpic32.h>

void configureT2(void);
void configurePorts(void);

int main(void) {
    configureT2();
    configurePorts();

    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void configureT2(void) {
    T2CONbits.TCKPS = 7; 
    PR2 = 39062; 
    TMR2 = 0; 
    T2CONbits.TON = 1; 

    IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag
}

void configurePorts(void) {
    TRISDbits.TRISD8 = 1;
    TRISEbits.TRISE0 = 0;

    LATEbits.LATE0 = 0;

    INTCONbits.INT1EP = 0;     
    IPC1bits.INT1IP = 2;       
    IFS0bits.INT1IF = 0;      
    IEC0bits.INT1IE = 1;       
}

void _int_(8) isr_T2(void) {
    static int count = 0;
    count++;
    putChar('+');
    if (count > 5) {
        LATEbits.LATE0 = 0;
        count = 0;
        T2CONbits.TON = 0; 
    }  
    IFS0bits.T2IF = 0; 
}

void _int_(7) isr_INT1(void) {
    LATEbits.LATE0 = 1;
    T2CONbits.TON = 1; 
    IFS0bits.INT1IF = 0;
}





