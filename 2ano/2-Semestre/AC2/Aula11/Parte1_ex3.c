#include <xc.h>
#include "UART2.h"

TRISCbits.TRISC14 = 0;  // Configura RC14 como saída
LATCbits.LATC14 = 0;    // Garante que o LED está inicialmente desligado

void __attribute__((vector(_UART2_RX_VECTOR), interrupt(ipl2), no_auto_psv)) isr_uart2(void)
{
    if (IFS1bits.U2RXIF)
    {
        char c = U2RXREG;

        while (U2STAbits.UTXBF);
        U2TXREG = c;

        if (c == '?')
        {
            const char *msg = "AC2-Guiao 11";
            while (*msg)
            {
                while (U2STAbits.UTXBF);
                U2TXREG = *msg++;
            }
        }
        else if (c == 'T')
        {
            LATCbits.LATC14 = 1;
        }
        else if (c == 't')
        {
            LATCbits.LATC14 = 0;
        }

        IFS1bits.U2RXIF = 0;
    }
}

int main(void)
{
    UART2_Init();
    UART2_Interrupt_Init();
    TRISCbits.TRISC14 = 0;
    LATCbits.LATC14 = 0;
    __builtin_enable_interrupts();

    while (1)
    {
        IdleMode();
    }

    return 0;
}

// UART2_Init function
void UART2_Init(void) {
    U2MODE = 0;          
    U2MODEbits.BRGH = 0;  
    U2BRG = 21;           

    U2STA = 0;             
    U2STAbits.UTXEN = 1; 
    U2STAbits.URXEN = 1;  

    U2MODEbits.UARTEN = 1;   
}

// UART2_Interrupt_Init function
void UART2_Interrupt_Init(void) {
    IEC1bits.U2TXIE = 0; 
    IEC1bits.U2RXIE = 1; 

    IPC8bits.U2IP = 2;    
    IPC8bits.U2IS = 0;   

    IFS1bits.U2RXIF = 0;  

    U2STAbits.URXISEL = 0;    
}

// IdleMode function
void IdleMode(void) {
    __builtin_wait();        
}

// UART2_Interrupt_Init function
void UART2_Interrupt_Init(void) {
    IEC1bits.U2TXIE = 0; 
    IEC1bits.U2RXIE = 1; 

    IPC8bits.U2IP = 2;    
    IPC8bits.U2IS = 0;   

    IFS1bits.U2RXIF = 0;  

    U2STAbits.URXISEL = 0;    
}

// UART2_Init function
void UART2_Init(void) {
    U2MODE = 0;          
    U2MODEbits.BRGH = 0;  
    U2BRG = 21;           

    U2STA = 0;             
    U2STAbits.UTXEN = 1; 
    U2STAbits.URXEN = 1;  

    U2MODEbits.UARTEN = 1;   
}
