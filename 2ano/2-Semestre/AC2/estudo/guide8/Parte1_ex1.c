#include <detpic32.h>

int main(void)
{
    // Configure Timer T3 (2 Hz with interrupts disabled)
    T3CONbits.TCKPS = 7; // 20000000÷((65535 + 1)×2) = 153 --> 256, bit 7
    PR3 = 39062;         // 20000000÷(256 ×2) - 1 =39062,5 - 1 = 39062
    TMR3 = 0;            // Clear timer T3 count register
    T3CONbits.TON = 1;   // Enable timer T3 (must be the last command of the
    // timer configuration sequence)

    while (1)
    {
        // Wait while T3IF = 0
        while (IFS0bits.T3IF == 0);
        // Reset T3IF
        IFS0bits.T3IF = 0;
        putChar('.');
    }
    return 0;
}
