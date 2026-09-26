#include <detpic32.h>

void configureADC(void);
void configureT3(void);
void send2displays(unsigned char value);
void delay(int ms);

volatile int temp = 0;

int main(void) {
    TRISB = TRISB & 0X80FF;
    TRISD = TRISD & 0xFF9F;

    configureADC();
    configureT3();

    EnableInterrupts();
    while(1) {
        int avg = 0;
        AD1CON1bits.ASAM = 1;
        while( IFS1bits.AD1IF == 0 );

        int *p = (int*)(&ADC1BUF0);
        for (; p <= (int*)(&ADC1BUF1); p+=4) {
            avg += *p;
        }
        avg = avg / 2;
        temp = (avg * 65 + 511) / 1023 + 10;

        IFS1bits.AD1IF = 0;
        delay(200);
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

void configureT3(void) {
    T3CONbits.TCKPS = 2;
    PR3 = 35713;
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2; 
    IEC0bits.T3IE = 1; 
    IFS0bits.T3IF = 0; 
}

void send2displays(unsigned char value) {
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0) {
        LATD = (LATD & 0xFF9F) | 0X0020;
        LATB = (LATB & 0X80FF) | (disp7Scodes[digit_low] << 8);
    } else {
        LATD = (LATD & 0xFF9F) | 0X0040;
        LATB = (LATB & 0X80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < ms * 20000);
}

void _int_(12) isr_T3(void) {
    send2displays((temp / 10) << 4| (temp % 10));
    IFS0bits.T3IF = 0; 
}