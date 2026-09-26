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

void putc(char x)
{
    // wait while UTXBF == 1 (UxSTA register)
    while (U2STAbits.UTXBF == 1)
        ;
    // Copy byte2send to the UxTXREG register
    U2TXREG = x;
}

char getc(void)
{
    // Wait while URXDA == 0 (UxSTA register)
    while (U2STAbits.URXDA == 0)
        ;
    // Return UxRXREG
    return U2RXREG;
}

void putstr(char *y)
{
    while (*y != '\0')
    {
        putc(*y);
        y++;
    }
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

    TRISCbits.TRISC14 = 0;

    while (1)
    {
        IdleMode();
    }
    return 0;
}

void _int_(32) isr_uart2(void)
{
    if (IFS1bits.U2RXIF == 1) // UART2 Rx interrupt flag is set
    {
        // Read character from FIFO (U2RXREG)
        int x = U2RXREG;
        // Clear UART2 Rx interrupt flag
        if (getc() == 'T')
        {
            LATCbits.LATC14 = 1;
        }
        else if (getc() == 't')
        {
            LATCbits.LATC14 = 0;
        }
        putstr('nigga');
        IFS1bits.U2RXIF = 0;
    }
}
