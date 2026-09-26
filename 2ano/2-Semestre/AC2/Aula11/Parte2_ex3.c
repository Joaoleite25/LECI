#include <xc.h>
#include <string.h>

#define SYSCLK 40000000
#define BRGVAL ((SYSCLK / (16 * 115200)) - 1)

typedef struct
{
    char mem[100];
    int nchar;
    int posrd;
} t_buf;

volatile t_buf txbuf;

void UART2_Init(void)
{
    U2MODE = 0;
    U2BRG = BRGVAL;
    U2MODEbits.BRGH = 0;

    U2STA = 0;
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    U2MODEbits.UARTEN = 1;
}

void UART2_Interrupts_Init(void)
{
    IEC1bits.U2RXIE = 0;          // RX interrupt disabled
    IEC1bits.U2TXIE = 0;          // TX interrupt disabled

    IPC8bits.U2IP = 2;            // Priority level 2
    IPC8bits.U2IS = 0;            // Subpriority 0

    U2STAbits.UTXISEL = 0;        // Interrupt when TXREG is empty
}

void __attribute__((vector(_UART2_TX_VECTOR), interrupt(ipl2), no_auto_psv)) isr_uart2(void)
{
    if (IFS1bits.U2TXIF)
    {
        if (txbuf.nchar > 0)
        {
            U2TXREG = txbuf.mem[txbuf.posrd++];
            txbuf.nchar--;
        }
        else
        {
            IEC1bits.U2TXIE = 0;
        }
        IFS1bits.U2TXIF = 0;
    }
}

void putstrInt(char *s)
{
    while (txbuf.nchar > 0);

    int i = 0;
    while (s[i] != '\0' && i < 100)
    {
        txbuf.mem[i] = s[i];
        i++;
    }

    txbuf.nchar = i;
    txbuf.posrd = 0;

    IEC1bits.U2TXIE = 1;
}

int main(void)
{
    UART2_Init();
    UART2_Interrupts_Init();
    __builtin_enable_interrupts();

    txbuf.nchar = 0;
    while (1)
    {
        putstrInt("Test string which can be as long as you like, up to a maximum of 100 characters\n");
        while (txbuf.nchar > 0); // Aguarda até a transmissão completar
    }

    return 0;
}
