#include <detpic32.h>

void send2displays(unsigned char value) {
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0) {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    } else {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000)); 
}

int main(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    
    int sum, avg, tens, i = 0;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 

    AD1CON1bits.CLRASAM = 1; 
   
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 4-1; 
   
    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 
    
    while(1) {
        if (i == 0) {
            sum = 0;
            AD1CON1bits.ASAM = 1; 
            while(IFS1bits.AD1IF == 0); 
            int *p = (int*)(&ADC1BUF0);

            for(; p <= (int*)(&ADC1BUFF); p+=4) {
                sum += *p;
                IFS1bits.AD1IF == 0;
            }
            avg = sum / 4;
            tens = (avg*33 + 511) / 1023;
        }
        send2displays(((tens/10) << 4) | (tens % 10));
        delay(10);
        i = (i + 1) % 20;
    }
    return 0;
}
