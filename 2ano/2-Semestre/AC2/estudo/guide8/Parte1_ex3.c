#include <detpic32.h>

void configureTimer3(void);
volatile int c = -1;

int main(void)
{
    configureTimer3();
    EnableInterrupts();
    while (1)
    {
        IdleMode();
    }
    return 0;
}

void configureTimer3(void)
{
    // Configure Timer T3 with interrupts enabled
    T3CONbits.TCKPS = 7; // 20000000 / (2^16 * 2Hz ) = 153 --> 256, 7 bit
    PR3 = 39062;         // 20000000 / (256 * 2Hz ) - 1 = 39061,5 --> 39062
    TMR3 = 0;            // Clear timer T2 count register
    T3CONbits.TON = 1;   // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag
}

void _int_(12) isr_T3(void)
{
    c++;
        if (c == 1)
        {
            putChar('.');
            c = -1;
        }
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag
}
