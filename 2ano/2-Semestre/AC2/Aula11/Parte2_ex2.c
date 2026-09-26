#include <xc.h>

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

void UART2_Init(void)
{
    U2MODE = 0;          
    U2MODEbits.BRGH = 0;  
    U2BRG = 21;           

    U2STA = 0;             
    U2STAbits.UTXEN = 1; 
    U2STAbits.URXEN = 1;  

    U2MODEbits.UARTEN = 1;   
}

void UART2_Interrupt_Init(void)
{
    IEC1bits.U2TXIE = 1; 
    IEC1bits.U2RXIE = 1; 

    IPC8bits.U2IP = 2;    
    IPC8bits.U2IS = 0;   

    IFS1bits.U2TXIF = 0;  
    IFS1bits.U2RXIF = 0;  
}

void IdleMode(void)
{
    __builtin_wait();        
}

void UART2_SendString(const char *s)
{
    while (txbuf.nchar > 0);  // Espera até que o buffer esteja vazio

    int i = 0;
    while (s[i] != '\0' && i < 100)
    {
        txbuf.mem[i] = s[i];
        i++;
    }

    txbuf.nchar = i;
    txbuf.posrd = 0;

    IEC1bits.U2TXIE = 1;      // Habilita interrupção de transmissão da UART2
}

int main(void)
{
    UART2_Init();       
    UART2_Interrupt_Init(); 
    __builtin_enable_interrupts(); 

    while(1)
    {
        IdleMode();   
    }

    return 0;
}