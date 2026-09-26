#include <detpic32.h>

void configureADC(void);
void configureT5(void);
void send2displays(unsigned char value);
void delay(int ms);
char toBcd(char value);

volatile int tens = 0; 

int main(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    configureADC();
    configureT5();
    EnableInterrupts();
    AD1CON1bits.ASAM = 1;

    while(1) {
        IdleMode();
    }

    return 0;
}

void configureADC(void) {
    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 
    
    AD1CON1bits.CLRASAM = 1; 
    
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 4-1; 
    
    AD1CHSbits.CH0SA = 4; 
   
    AD1CON1bits.ON = 1; 
    
    IPC6bits.AD1IP = 3; 
    IFS1bits.AD1IF = 0; 
    IEC1bits.AD1IE = 1; 
}

void configureT5(void) {
    T5CONbits.TCKPS = 2; 
    PR5 = 35713; 
    TMR5 = 0; 
    T5CONbits.TON = 1;

    IPC5bits.T5IP = 2; 
    IEC0bits.T5IE = 1; 
    IFS0bits.T5IF = 0;
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

char toBcd(char value) {
    return (value / 10) << 4| (value % 10); 
}

void _int_(20) isr_T5(void) {
    send2displays(toBcd(tens));
    IFS0bits.T5IF = 0;
}

void _int_(27) isr_adc(void) {
    int avg = 0;
    int *p = (int*)(&ADC1BUF0);
    for(; p <= (int*)(&ADC1BUF3); p+=4) {
        avg += *p;
    }
    avg = avg / 4;
    tens = (avg * 28 + 511) / 1023 + 4;
    IFS1bits.AD1IF = 0; 
    delay(40);
    AD1CON1bits.ASAM = 1;
}