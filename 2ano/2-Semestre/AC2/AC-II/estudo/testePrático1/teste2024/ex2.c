#include <detpic32.h>

void delay(int ms);

void send2displays(unsigned char value);

int main(void) {
    TRISD = TRISD & 0xFF9F;
    TRISB = TRISB & 0x80FF;
    TRISEbits.TRISE1 = 0;

    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence 

    int sum, avg;

    while(1) {
        LATEbits.LATE1 = 0;

        AD1CON1bits.ASAM = 1; // Start conversion 
        while(IFS1bits.AD1IF == 0); // Wait while conversion not done 

        int *p = (int*)(&ADC1BUF0);
        for(; p<= (&ADC1BUF1); p+=4) {
            sum += *p;
        }
        avg = sum / 2;
        printInt(avg, 16 | 3 << 16);
        putChar(' ');

        avg = (avg * 9) /1023;

        LATE = (LATE & 0xFFFD) | 0x0002;
        send2displays(avg);

        LATEbits.LATE1 = 1;

        IFS1bits.AD1IF == 0;
        delay(166);

    }
    return 0;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms*20000));
}

void send2displays(unsigned char value) {
    static const char disp7seg[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    LATB = (LATB & 0x80FF) | (disp7seg[value] << 8);
}

