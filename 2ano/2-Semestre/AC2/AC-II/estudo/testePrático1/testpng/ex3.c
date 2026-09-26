#include <detpic32.h>

void send2displays(unsigned char value);

void delay(int ms);

int main(void) {
    TRISBbits.TRISB4 = 1; // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 10-1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence 

    TRISD = TRISD & 0xFF9F;
    TRISB = TRISB & 0x80FF;

    int sum, avg, freq, i;
    unsigned int counter = 20;

    while(1) {
        sum = 0;
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);

        int *p = (int*)(&ADC1BUF0);
        for (; p <= (int*)(&ADC1BUFA); p+=4) {
            sum += *p;
        }
        avg = sum/10;
        freq = 1 + (avg/ 255);

        send2displays(counter);
        delay(20);

        i = (i+1);
        if(i%(50/freq) == 0){
            counter = (counter - 1 + 20) % 20;
        }

        IFS1bits.AD1IF == 0;
    }
}

void send2displays(unsigned char value) {
    static const char disp7seg[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    static unsigned char displayFlag = 0;

    int digit_low = value % 10;
    int digit_high = value / 10;

    if (displayFlag == 0) {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7seg[digit_low] << 8);
    } else {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7seg[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000));
}