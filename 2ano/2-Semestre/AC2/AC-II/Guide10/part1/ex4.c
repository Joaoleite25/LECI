#include <detpic32.h>

void putstr(char *str);
void delay(int ms);
void configureUART2(void);
void putc(char byte);

int main(void) {
    // Configure UART2 (115200, N, 8, 1)
    configureUART2();
    while(1) {
        putstr("String de teste\n");
        delay(1000);
    }
    return 0;
}
    
void putstr(char *str) {
    // use putc() function to send each charater ('\0' should not be sent)
    int i;
    for(i = 0; str[i] != '\0'; i++) {
        putc(str[i]);
    }
} 

void putc(char byte) {
    // wait while UART2 UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
} 

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000));
}

configureUART2(void) {
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    U2BRG = (PBCLK + 8 * 600) / (16 * 600) - 1;
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