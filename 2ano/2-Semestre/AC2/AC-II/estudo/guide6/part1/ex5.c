#include <detpic32.h>

int main(void) {
    int sum, avg, count, tens;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 

    AD1CON1bits.CLRASAM = 1; 
   
    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 4-1; 
   
    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 

    while(1) {
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

        printInt(tens / 10, 10);
        putChar('.');
        printInt(tens % 10, 10);
        putChar(' ');
    }
    return 0;
}