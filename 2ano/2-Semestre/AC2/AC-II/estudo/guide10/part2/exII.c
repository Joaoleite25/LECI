#include <detpic32.h>

void configureUART1(void);
void putc1(char byte);
void delay(int ms);

int main(void) {
    configureUART1();

    while(1) {
        putc1('0x5A');
        delay(10);
    }
    return 0;
}

void configureUART1(void) {
    U1BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1;
    U1MODEbits.BRGH = 0;
    
    U1MODEbits.PDSEL = 00;
    U1MODEbits.STSEL = 0;

    U1STAbits.UTXEN = 1;
    U1STAbits.URXEN = 1;

    U1MODEbits.ON = 1;
}

void putc1(char byte) {
    while( U1STAbits.UTXBF == 1);
    U1TXREG = byte;
}

void delay(int ms) {
    resetCoreTimer();
    while( readCoreTimer() < (ms * 20000));
}