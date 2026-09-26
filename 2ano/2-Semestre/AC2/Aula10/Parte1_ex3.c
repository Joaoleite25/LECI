#include <xc.h>        // Biblioteca específica do compilador XC para PIC32
#include <stdint.h>

#pragma config FNOSC = PRIPLL, POSCMOD = HS, FPLLMUL = MUL20, FPLLIDIV = DIV2, FPLLODIV = DIV1
#pragma config FPBDIV = DIV1        // Peripheral Bus Clock = System Clock
#pragma config FWDTEN = OFF         // Desabilita Watchdog Timer
#pragma config ICESEL = ICS_PGx1    // Seleção das linhas de programação/debug

#define SYSCLK 40000000    
#define PBCLK  SYSCLK       


void delay_ms(unsigned int ms) {
    unsigned int i;
    while (ms--) {
        for (i = 0; i < (PBCLK / 2000); i++) {
            asm volatile("nop");
        }
    }
}


void uart2_init(void) {
    U2MODE = 0;              // Limpa configurações anteriores
    U2MODEbits.BRGH = 1;     // Alta velocidade → fator de divisão 4

    U2BRG = (PBCLK / (4 * 115200)) - 1;  // U2BRG ≈ 86

    U2STAbits.UTXEN = 1;     // Habilita transmissor
    U2STAbits.URXEN = 1;     // Habilita receptor

    U2MODEbits.ON = 1;       // Liga UART2
}


void putc(char byte) {
    while (U2STAbits.UTXBF); // Espera se buffer de transmissão estiver cheio
    U2TXREG = byte;          // Envia o caractere
}

int main(void)
{
    uart2_init(); 

    while (1) {
        putc('+');        
        delay_ms(1000);   
    }

    return 0;
}
