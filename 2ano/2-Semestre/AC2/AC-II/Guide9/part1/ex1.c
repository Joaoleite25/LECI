#include <detpic32.h>

#define N 4

void send2displays(unsigned char value);
void delay(unsigned int ms);
unsigned char toBcd(unsigned char value);
void configureAll();
void _int_(4) isr_T1(void);
void _int_(12) isr_T3(void);

int volatile int voltage = 0;

int main(void){
    configureAll(); // Function to configure all (digital I/O, analog
    // input, A/D module, timers T1 and T3, interrupts)
    // Reset AD1IF, T1IF and T3IF flags
    EnableInterrupts(); // Global Interrupt Enable
    while(1) {
        IdleMode();
    }
    return 0; 
}

void _int_(4) isr_T1(void) {
    IFS0bits.T1IF = 0; 
}

void _int_(12) isr_T3(void) {
    IFS0bits.T3IF = 0; 
}

void configureAll() {
    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T1 interrupts
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag

    IPC3bits.T3IP = 1; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag

    T1CONbits.TCKPS = ; 
    PR1 = 62499; 
    TMR1 = 0; 
    T1CONbits.TON = 1; 

    T3CONbits.TCKPS = ; 
    PR3 = 3124; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 
    
    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 

    AD1CON1bits.CLRASAM = 1; 
   
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 8-1; 
   
    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 
}

void send2displays(unsigned char value){
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 
        0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;
    int dh = value >> 4;
    int dl = value & 0x0F;

    if(displayFlag == 0){
        LATD=(LATD & 0xFF9F) | (0x0020);
        LATB = (LATB & 0x80FF) | (disp7Scodes[dl] << 8); 
    }
    else{
        LATD=(LATD & 0xFF9F) | (0x0040);
        LATB = (LATB & 0x80FF) | (disp7Scodes[dh] << 8);
    }
    displayFlag = !displayFlag;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}
