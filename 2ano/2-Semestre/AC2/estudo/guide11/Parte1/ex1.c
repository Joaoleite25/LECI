#include <detpic32.h>

void configUART2(void)
{
    U2BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 0;

    U2STAbits.UTXEN = 0;
    U2STAbits.URXEN = 1;

    U2MODEbits.ON = 1;

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;

    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    U2STAbits.URXISEL = 00;
}

int main(void)
{
    // Configure UART2: 115200, N, 8, 1
    // Configure UART2 interrupts, with RX interrupts enabled
    // and TX interrupts disabled :
    // enable U2RXIE, disable U2TXIE(register IEC1)
    // set UART2 priority level(register IPC8)
    // clear Interrupt Flag bit U2RXIF(register IFS1)
    // define RX interrupt mode(URXISEL bits)
    configUART2();

    // Enable global Interrupts
    EnableInterrupts();

    while (1)
    {
        IdleMode();
    }
    return 0;
}
