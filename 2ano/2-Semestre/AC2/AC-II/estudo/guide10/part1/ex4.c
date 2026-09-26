#include <detpic32.h>

void configureUART(void);
void putc(char byte);
void delay(int ms);
void putstr(char *str);

int main(void) {
    configureUART();

    while(1) {
        putstr("String de teste\n");         
        delay(1000);
    }
    return 0;
}

void configureUART(void) {
    U2BRG = (PBCLK + 8 * 600) / (16 * 600) - 1;
    U2MODEbits.BRGH = 0;
 
    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 0;
    
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
   
    U2MODEbits.ON = 1;
}

void putc(char byte) {
    while( U2STAbits.UTXBF == 1);
    U2TXREG = byte;
    
}

void delay(int ms) {
    resetCoreTimer();
    while( readCoreTimer() < (ms * 20000));
}

void putstr(char *str) {
    int i;
    for (i = 0; str[i] != '\0'; i++) {
        putc(str[i]);
    }
}