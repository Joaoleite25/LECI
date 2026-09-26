#include <detpic32.h>

void configureUART2(void);
void configurePorts(void);
void putc(char byte);
void putstr(char *str);

int main(void) {
    configureUART2();
    configurePorts();

    while(1) {
        while( U2STAbits.TRMT == 0);
        LATD = LATD | 0x0800;
        putstr("12345");
        LATD = LATD & 0xF7FF;
    }
    return 0;
}

void configureUART2(void) {
    U2BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 0;

    U1STAbits.UTXEN = 1;
    U1STAbits.URXEN = 1;

    U1MODEbits.ON = 1;
}

void configurePorts(void) {
    TRISD = TRISD & 0xF7FF;
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
