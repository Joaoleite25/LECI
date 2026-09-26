#include <detpic32.h>

void send2displays(unsigned char value, int disp_select);

int main(void) {
    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 

    AD1CON1bits.CLRASAM = 1; 
   
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 4-1; 
   
    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 

    TRISD = TRISD & 0xFF9F;
    TRISB = TRISB & 0x80FF;
    TRISB = TRISB | 0x0002;
    TRISEbits.TRISE4 = 0;

    int sum, avg, port_value, disp_value, volt;

    while(1) {
        sum = 0;
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0); 

        int *p = (int*)(&ADC1BUF0);
        for (; p <= (int*)(&ADC1BUF4); p+=4) {
            sum += *p;
        }
        avg = sum/4;
        volt = avg/(1023/9);
        printInt(avg, 2 | 10 << 16);         
        putChar('\r');

        port_value = PORTB & 0x0002;
        if (port_value == 0) {
            disp_value = 0;
        } else {
            disp_value = 1;
        }
        send2displays(volt, disp_value);
        resetCoreTimer();
        while(readCoreTimer() < 166666);
        int i;
        i = (i + 1) % 20;
        if (i == 0) {
            LATEbits.LATE4 = !LATEbits.LATE4;
        }
        IFS1bits.AD1IF == 0;
    }
    return 0;
}

void send2displays(unsigned char value, int disp_select) {
    static const char disp7codes[] = {0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39};

        int digit_low = value & 0x0F;
        int digit_high = value >> 4;

        if (disp_select == 0) {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | (disp7codes[digit_low] << 8);
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | (disp7codes[digit_high] << 8);
        }
}

