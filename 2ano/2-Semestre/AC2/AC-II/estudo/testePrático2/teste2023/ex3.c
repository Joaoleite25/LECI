#include <detpic32.h>

void configureUART(void);
void putc(char byte);
void putstr(char *str);

volatile int counter = 0;

int main(void) {
    TRISE = TRISE & 0xFFF0;
    configureUART();
    EnableInterrupts();

    while(1) {
        IdleMode();
    }
    return 0;
}

void configureUART(void) {
    U2BRG = (PBCLK + 8 * 2400) / (16 * 2400) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 01;
    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;

    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    U2STAbits.URXISEL = 00;
}

void putc(char byte) {
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char *str) {
    int i = 0;
    while(str[i] != '\0') {
        putc(str[i]);
        i++;
    }
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF) {
        char c = U2RXREG;
        putc(c);
        putc('\n');
        if (c == 'F') {
            counter = (counter + 1) % 10;
        } else if (c == 'C') {
            counter = 0;
            putstr("VALOR MINIMO\n");
        }
        LATE = (LATE & 0XFFF0) | counter;
        IFS1bits.U2RXIF = 0;
    }
}

