#include <xc.h>        // Biblioteca específica do compilador XC para PIC32
#include <stdint.h>

#pragma config FNOSC = PRIPLL, POSCMOD = HS, FPLLMUL = MUL20, FPLLIDIV = DIV2, FPLLODIV = DIV1
#pragma config FPBDIV = DIV1        // Peripheral Bus Clock = System Clock
#pragma config FWDTEN = OFF         // Desabilita Watchdog Timer
#pragma config ICESEL = ICS_PGx1    // Seleção das linhas de programação/debug

#define SYSCLK 40000000     // Frequência do sistema: 40 MHz
#define PBCLK  SYSCLK       // Peripheral Bus Clock = 40 MHz

// Função de delay aproximado (software delay)
void delay_ms(unsigned int ms) {
    unsigned int i;
    while (ms--) {
        for (i = 0; i < (PBCLK / 2000); i++) {
            asm volatile("nop");
        }
    }
}

// 1. Inicializa UART2
void uart2_init(void) {
    U2BRG = (PBCLK / (16 * 115200)) - 1;  // U2BRG = ~21 para 115200 bps

    U2MODE = 0x0000; // 8 bits, sem paridade, 1 stop bit (PDSEL = 00, STSEL = 0)
    U2STA = 0x0000;

    U2STAbits.UTXEN = 1; // Habilita transmissor
    U2STAbits.URXEN = 1; // Habilita receptor

    U2MODEbits.ON = 1;   // Liga UART2
}

// 2. Envia um caractere pela UART2
void putc(char byte) {
    while (U2STAbits.UTXBF); // Espera enquanto buffer de transmissão estiver cheio
    U2TXREG = byte;          // Envia caractere
}

// 3. Programa principal: envia '+' a cada 1 segundo
int main(void)
{
    uart2_init(); // Configura UART2 (115200, N, 8, 1)

    while (1) {
        putc('+');       // Envia '+'
        delay_ms(1000);  // Espera 1 segundo
    }

    return 0;
}
