#include <detpic32.h>

volatile int *pau;
volatile int adc_value;

int main(void)
{
    // Configure all (digital I/O, analog input, A/D module)
    TRISBbits.TRISB4 = 1;  // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7;  // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 1 - 1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
                        // This must the last command of the A/D
                        // configuration sequence

    // Configure interrupt system
    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag
    IEC1bits.AD1IE = 1; // enable A/D interrupts

    EnableInterrupts(); // Global Interrupt Enable

    LATB = (LATB & 0x80FF);
    LATD = (LATD & 0xFF9F);         //1111 0111 1001 1111
    LATDbits.LATD11 = 0;

    // Start A/D conversion
    AD1CON1bits.ASAM = 1; // Start conversion
    while (1)
    {
        IdleMode(); // consumo de energia
        // all activity is processed by the ISR
    }
    return 0;
}

// Interrupt Handler
void _int_(27) isr_adc(void)
{
    // Reset RD11 (LATD11 = 0)
    LATDbits.LATD11 = 0;
    // Read ADC1BUF0 value to "adc_value"
    adc_value = ADC1BUF0;
    // Start A/D conversion
    AD1CON1bits.ASAM = 1; // Start conversion 
    // Set RD11 (LATD11 = 1)
    LATDbits.LATD11 = 1;
    // Reset AD1IF flag
    IFS1bits.AD1IF = 0;   // Reset AD1IF flag
}
