#include <detpic32.h>

void configureUART(void);
void putc(char byte);
void putstr(char *str);

int main(void) {
    TRISCbits.TRISC14 = 0;

    configureUART();
    EnableInterrupts();

    while(1) {
        IdleMode();
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

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    
    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    U2STAbits.URXISEL = 00;
}

void putc(char byte) {
    while( U2STAbits.UTXBF == 1);
    U2TXREG = byte;  
}

void putstr(char *str) {
    int i;
    for (i = 0; str[i] != '\0'; i++) {
        putc(str[i]);
    }
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF == 1) {
    char c = U2RXREG;
        if (c == '?') {
            putstr("AC-Guiao 11");
            //putChar('\r');
        } else {
            if (c == 'T') {
                LATCbits.LATC14 = 1;
            } else if (c == 't') {
                LATCbits.LATC14 = 0;
            }
            putc(c);
            //putChar('\r');
        }
        IFS1bits.U2RXIF = 0;
    }
}