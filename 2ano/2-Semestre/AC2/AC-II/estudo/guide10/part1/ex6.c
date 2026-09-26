#include <detpic32.h>

void configureUART(void);
void putc(char byte);
char getc(void);

int main(void) {
    configureUART();

    while(1) {
        char c = getc();
        putc(c);
        
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

char getc(void) {
    while(U2STAbits.URXDA == 0);
    return U2RXREG;
}
