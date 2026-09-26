#include <detpic32.h>

void configureUART(void);
void putc(char byte);
void delay(int ms);

int main(void) {
    configureUART();

    while(1) {
        putc('+');
        delay(1000);
    }
    return 0;
}

void configureUART(void) {
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    U2BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1;
    U2MODEbits.BRGH = 0;
    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 0;
    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    // 4 – Enable UART2 (see register U2MODE) 
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