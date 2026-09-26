#include <detpic32.h>

void configureUART(void);
void putc(char byte);
void putstr(char *str);

int main(void) {
    TRISB = TRISB & 0XFFF0;
    TRISEbits.TRISE7 = 0;

    configureUART();
    EnableInterrupts();
    while(1) {
        IdleMode();
    }

    return 0;
}

void configureUART(void) {
    U2BRG = (PBCLK + 8 * 9600) / (16 * 9600) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 10;
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
    while(*str != '\0') {
        putc(*str++);
    }
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF) {
        int value = PORTB & 0X000F;
        char c = U2RXREG;
        LATEbits.LATE7 = !LATEbits.LATE7;
        putc(c);
        putc('\n');
        if (c == 'D') {
            putstr("DSD=");
            putc((value/10) + '0');
            putc((value%10) + '0');
            putc('\n');
        } 
        IFS1bits.U2RXIF = 0;  
    }
}