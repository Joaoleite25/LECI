#include <detpic32.h>

int main(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    int sum, avg, tens;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 

    AD1CON1bits.CLRASAM = 1; 
   
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 2-1; 
   
    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 

    while(1) {
        sum = 0;
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0); 
        int *p = (int*)(&ADC1BUF0);

        for (; p <= (int*)(&ADC1BUF1); p+=4) {
            sum += *p;
            printInt(ADC1BUF0, 16 | 3 << 16);
            putChar(' ');
        }
        putChar('\n');

        avg = sum/2;
        tens = (avg*33 + 511) / 1023;
        
        if (tens < 12) {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | 0x7700;        // 0011 1111 0000 0000
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | 0x7C00;        // 0111 1100 0000 0000
        }
        
        IFS1bits.AD1IF == 0;

    }
        
}
