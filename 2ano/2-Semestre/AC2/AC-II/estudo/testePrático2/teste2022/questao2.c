#include <detpic32.h>

void send2displays(unsigned char value);
void delay(int ms);
void configureADC(void);
void configureT2(void);

volatile int temp = 0;

int main(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    configureADC();
    configureT2();

    EnableInterrupts();
    while(1) {
        int i, avg = 0;

        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0); 

        int *p = (int*)(&ADC1BUF0);
        for(i = 0; i < 2; i++) {         // SMPI = 1 ⇒ 2 samples
            avg += p[i*4];                   // ADC1BUF0, ADC1BUF4
        }
        avg = avg/2;
        temp = (avg * 50 + 511) / 1023 + 15; 
        IFS1bits.AD1IF = 0;
        delay(100);
    }
    return 0;
}

void configureADC(void) {
    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 
    
    AD1CON1bits.CLRASAM = 1; 

    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 2-1; 
    
    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 
}

void configureT2(void) {
    T2CONbits.TCKPS = 2;
    PR2 = 41665;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2; 
    IEC0bits.T2IE = 1; 
    IFS0bits.T2IF = 0; 
}

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
    while(readCoreTimer() < ms * 20000);
}

void _int_(8) isr_T2(void) {
    send2displays((temp/10) << 4 | temp % 10);
    IFS0bits.T2IF = 0;
}
