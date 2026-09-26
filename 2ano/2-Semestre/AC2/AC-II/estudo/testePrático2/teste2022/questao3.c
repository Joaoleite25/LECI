#include <detpic32.h>

void configureUART2(void);
void putc(char byte);
void putstr(char *str);

volatile int counter = 15;

int main(void) {
    TRISE = TRISE & 0xFFE1;

    configureUART2();
    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void configureUART2(void) {
    U2BRG = (PBCLK + 8 * 9600) / (16 * 9600) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;
    
    IPC8bits.U2IP = 2;             
    IEC1bits.U2RXIE = 1;        
    IFS1bits.U2RXIF = 0;
}

void putc(char byte) {
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char *str) {
    int i;
    for (i = 0; str[i] != '\0'; i++) {
        putc(str[i]);
    }
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF) {
        char c = U2RXREG;
        if (c == 'U') {
            counter = (counter+1)%16;
        } else if (c == 'R') {
            counter = 0;
            putstr("RESET\n");
        }
        LATE = (LATE & 0xFFE1) | (counter << 1);
        IFS1bits.U2RXIF = 0;
    }
}

