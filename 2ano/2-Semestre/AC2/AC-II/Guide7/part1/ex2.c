#include <detpic32.h>

volatile unsigned char voltage = 0; // Global variable

void send2displays(unsigned char value) {
    static const char display7seg[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    static char displayFlag = 0;
    
    unsigned char digit_low = value % 10;
    unsigned char digit_high = value / 10;

    if (displayFlag == 0) {
        LATB = (LATB & 0x00FF) | (display7seg[digit_high] << 8);
        LATDbits.LATD5 = 1;  // Ativa display mais significativo
        LATDbits.LATD6 = 0;
    } else {
        LATB = (LATB & 0x00FF) | (display7seg[digit_low] << 8);
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;  // Ativa display menos significativo
    }

    displayFlag = !displayFlag;
}
int main(void) {
    unsigned int cnt = 0;
    // Configure all (digital I/O, analog input, A/D module, interrupts)
    TRISB = TRISB & 0x00FF;
    TRISD = TRISD & 0xFF9F;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7; 
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 16-1; 
    AD1CHSbits.CH0SA = 4; 
    AD1CON1bits.ON = 1; 
 
    IPC6bits.AD1IP = 2;
    IFS1bits.AD1IF = 0;
    IEC1bits.AD1IE = 1;

    EnableInterrupts(); // Global Interrupt Enable
    while(1) {
        if(cnt == 0) // 0, 200 ms, 400 ms, ... (5 samples/second)
        {
            // Start A/D conversion
            AD1CON1bits.ASAM = 1;

        }
        // Send "voltage" value to displays
        send2displays(voltage);
        cnt = (cnt + 1) % 20;
        // Wait ?? ms
    }
    return 0;
}

void _int_(27) isr_adc(void) {
    int i;
    int sum = 0;
    int *p = (int*) &ADC1BUF0;

    for (i = 0; i < 8; i++) {
        sum += p[i*4];
    }
    int avg = sum / 8;
    voltage = (avg * 33 + 511) / 1023;

    IFS1bits.AD1IF = 0; 
} 