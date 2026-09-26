#include <detpic32.h>

volatile int counter = 0;

void confUART2(void)
{
    U2BRG = (PBCLK + 8 * 2400) / (16 * 2400) - 1;
    U2MODEbits.BRGH = 0;
    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 1;
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;
    U2STAbits.URXISEL = 0;
}

void putc(char c)
{
    // wait while UTXBF == 1 (UxSTA register)
    while (U2STAbits.UTXBF == 1);
    // Copy byte2send to the UxTXREG register
    U2TXREG = c;
}

void putstr(char *x)
{
    while (*x != '\0')
    {
        putc(*x);
        x++;
    }
    
}

int main(void)
{
    TRISE &= 0xFFF0;

    confUART2();

    EnableInterrupts();
    while (1)
    {
        IdleMode();
    }

    return 0;
}

void _int_(32) isr_uart2(void) // Replace VECTOR by the A/D vector
// number - see "PIC32 family data
// sheet" (pages 74-76)
{
    if (IFS1bits.U2RXIF)
    {
        char c = U2RXREG;
        putc(c);

        if (c == 'F')
        {
            counter = (counter + 1) % 10;
        }
        else if (c == 'C')
        {
            counter = 0;
            putstr("VALOR MINIMO");
        }
        
        LATE = (LATE & 0xFFF0) | counter;

        IFS1bits.U2RXIF = 0; // Reset U2RXIF flag
    }
}
