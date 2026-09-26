#include <detpic32.h>

#include <detpic32.h>

void configureAll(void);

int main(void) {
    configureAll();
    // Configure all (digital I/O, analog input, A/D module)
    // Configure interrupt system
    EnableInterrupts(); // Global Interrupt Enable
    // Start A/D conversion
    AD1CON1bits.ASAM = 1;
    while(1) {
        // all activity is processed by the ISR
        LATDbits.LATD11 = 0;
    }
    return 0; 
}

void _int_(27) isr_adc(void) {
    LATDbits.LATD11 = 1;  // 1111 0111 1111 1111
    int adc_value = ADC1BUF0;
    AD1CON1bits.ASAM = 1;
    IFS1bits.AD1IF = 0; // Reset AD1IF flag 
}

void configureAll(void) {
    TRISDbits.TRISD11 = 0;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 
   
    AD1CON1bits.CLRASAM = 1; 

    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 1-1; 

    AD1CHSbits.CH0SA = 4; 

    AD1CON1bits.ON = 1; 

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts 
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag 
    IEC1bits.AD1IE = 1; // enable A/D interrupts 
}