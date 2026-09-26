#include <detpic32.h>

char getc(void);
void putc(char byte);
void configUART2(void);

int main(void)
{
    // Configure UART2 (115200, N, 8, 1)
    configUART2();

    int c;
    while (1)
    {
        // Read character using getc()
        c = getc();
        // Send character using putc()
        putc(c);
    }

    return 0;
}

char getc(void)
{
    // Wait while URXDA == 0
    while (U2STAbits.URXDA == 0);
    
    // Return U2RXREG
    return U2RXREG;
}

void putc(char byte)
{
    // wait while UART2 UTXBF == 1
    while (U2STAbits.UTXBF == 1)
        ;

    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
}

void configUART2(void)
{
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    U2BRG = (PBCLK + 2 * 115200) / (4 * 115200) - 1; // (PBCLICK + 2 * baudrate) / (4 * baudrate) - 1
    U2MODEbits.BRGH = 1;                             // Manual
    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U2MODEbits.PDSEL = 00; // 8 bits sem paridade
    U2MODEbits.STSEL = 0;  // 1 stop bit
    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U2STAbits.UTXEN = 1; // enable
    U2STAbits.URXEN = 1; // enable
    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1; // enable
}
