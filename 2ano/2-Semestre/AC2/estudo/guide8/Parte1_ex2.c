#include <detpic32.h>

int main(void)
{
    // Configure Timer T3 with interrupts enabled
    T3CONbits.TCKPS = 7; // 20000000 / (2^16 * 2Hz ) = 153 --> 256, 7 bit
    PR3 = 39062;         // 20000000 / (256 * 2Hz ) - 1 = 39061,5 --> 39062
    TMR3 = 0;            // Clear timer T2 count register
    T3CONbits.TON = 1;   // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag

    EnableInterrupts();
    while (1)
    {
        IdleMode(); // CPU enters Idle mode3 (CPU is halted,
        // but peripherals continue to operate)
    }
    return 0;
}
void _int_(12) isr_T3(void) // Replace VECTOR by the timer T3
// vector number
{
    putChar('.');
    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag

}
