#include <xc.h>        // Biblioteca específica do compilador XC para PIC32
#pragma config FNOSC = PRIPLL, POSCMOD = HS, FPLLMUL = MUL20, FPLLIDIV = DIV2, FPLLODIV = DIV1
#pragma config FPBDIV = DIV1        // Peripheral Bus Clock = System Clock
#pragma config FWDTEN = OFF         // Desabilita Watchdog Timer
#pragma config ICESEL = ICS_PGx1    // Seleção das linhas de programação/debug

#define SYSCLK 40000000     // Frequência do sistema: 40 MHz
#define PBCLK  SYSCLK       // Peripheral Bus Clock = 40 MHz

void uart2_init(void) {
    // 1 - Configura o Baud Rate Generator
    // Fórmula: UxBRG = (PBCLK / (16 * BaudRate)) - 1
    U2BRG = (PBCLK / (16 * 115200)) - 1;  // Para 40 MHz e 115200 bps → U2BRG ≈ 21

    // 2 - Configura modo: 8 bits, sem paridade, 1 stop bit
    U2MODE = 0x0000; // PDSEL = 00 (8 bits, sem paridade), STSEL = 0 (1 stop bit)

    // 3 - Habilita o receptor e transmissor
    U2STA = 0x0000;
    U2STA |= (1 << 10);  // UTXEN: habilita transmissor
    U2STA |= (1 << 12);  // URXEN: habilita receptor

    // 4 - Liga o módulo UART2
    U2MODE |= (1 << 15); // ON = 1
}

void uart2_putc(char c) {
    while (U2STAbits.UTXBF); // Espera se buffer de transmissão estiver cheio
    U2TXREG = c;             // Escreve caractere no registrador de transmissão
}

void uart2_puts(const char *s) {
    while (*s) {
        uart2_putc(*s++);
    }
}

char uart2_getc(void) {
    while (!U2STAbits.URXDA); // Espera até que dados estejam disponíveis
    return U2RXREG;           // Retorna o caractere recebido
}

int main(void)
{
    uart2_init(); // Inicializa UART2

    uart2_puts("UART2 configurada para 115200,N,8,1\r\n");

    while (1)
    {
        // Eco de qualquer caractere recebido
        char c = uart2_getc();
        uart2_putc(c);
    }

    return 0;
}
