#include <xc.h>

void UART2_Init(void) {
    U2MODE = 0;          
    U2MODEbits.BRGH = 0;  
    U2BRG = 21;           

    U2STA = 0;             
    U2STAbits.UTXEN = 1; 
    U2STAbits.URXEN = 1;  

    U2MODEbits.UARTEN = 1;   
}

void UART2_Interrupt_Init(void) {
    IEC1bits.U2TXIE = 0; 
    IEC1bits.U2RXIE = 1; 

    IPC8bits.U2IP = 2;    
    IPC8bits.U2IS = 0;   

    IFS1bits.U2RXIF = 0;  

    U2STAbits.URXISEL = 0;    
}


void IdleMode(void) {
    __builtin_wait();        
}

void __attribute__((interrupt, no_auto_psv)) _U2RXInterrupt(void) {
    char receivedChar = U2RXREG; 
    IFS1bits.U2RXIF = 0;         
}

int main(void) {
    UART2_Init();       
    UART2_Interrupt_Init(); 
    __builtin_enable_interrupts(); 

    while(1) {
        IdleMode();   
    }

    return 0;
}
