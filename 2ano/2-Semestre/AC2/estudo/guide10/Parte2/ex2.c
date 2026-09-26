#include <detpic32.h>

void putc1(char byte);
void configUART1(void);
void delay(int x);

int main(void)
{
    // Configure UART1 (115200, N, 8, 1)
    configUART1();

    while (1)
    {
        putc1('0x5A');
        // wait 1 s
        delay(1000);    // 
    }

    return 0;
}

void putc1(char byte)
{
    // wait while UART1 UTXBF == 1
    while (U1STAbits.UTXBF == 1);
    
    // Copy "byte" to the U1TXREG register
    U1TXREG = byte;
}

void configUART1(void)
{
    // Configure UART1:
    // 1 - Configure BaudRate Generator
    U1BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1; // (PBCLICK + 2 * baudrate) / (4 * baudrate) - 1
    U1MODEbits.BRGH = 0;                                // Manual
    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U1MODEbits.PDSEL = 00; // 8 bits sem paridade
    U1MODEbits.STSEL = 0;  // 1 stop bit
    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U1STAbits.UTXEN = 1; // enable
    U1STAbits.URXEN = 1; // enable
    // 4 – Enable UART2 (see register U2MODE)
    U1MODEbits.ON = 1; // enable
}

void delay(int x){
    resetCoreTimer();
    while (readCoreTimer() < 20000 * x);
}
