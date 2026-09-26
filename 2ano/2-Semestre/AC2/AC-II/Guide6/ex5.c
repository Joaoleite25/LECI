#include <detpic32.h>

int main(void) {
    int soma, media, count, tensao;

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;

    AD1CON1bits.CLRASAM = 1;

    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 4-1;

    AD1CHSbits.CH0SA = 4;

    AD1CON1bits.ON = 1;

    while(1) {
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);
        int *p = (int *)(&ADC1BUF0);
        

        for (; p <=  (int *)(&ADC1BUFF); p+=4) {  
           soma += *p; 
           count +=1;
        }
        media = soma / count;
        tensao = (media * 33 + 511)/1023;

        printStr("Media: ");
        printInt(media, 10 | 4 << 16);    
        putChar(' ');

        printStr("Tensao: ");
        printInt(tensao / 10, 10);        
        putChar('.');
        printInt(tensao % 10, 10);        
        putChar('V');
        putChar('\n');

        IFS1bits.AD1IF = 0;              
    }
    return 0;
}