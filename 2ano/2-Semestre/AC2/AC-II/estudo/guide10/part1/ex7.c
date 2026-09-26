#include <detpic32.h>

void configureUART(void);
void putc(char byte);
void delay(int ms);

int main(void) {
    configureUART();

    int counter = 0;

    while(1) {
        counter = (counter + 1) % 10;
        putc(0x30 + counter);
        putChar('\r');
        delay(200);
    }
    return 0;
}

void configureUART(void) {
    U2BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1;
    U2MODEbits.BRGH = 0;
 
    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 0;
    
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
   
    U2MODEbits.ON = 1;
}

void putc(char byte) {
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte; 
}

void delay(int ms) {
    resetCoreTimer();
    while( readCoreTimer() < (ms * 20000));
}