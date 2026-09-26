#include <detpic32.h>

void configureTimer3(void);
void configureTimer1(void);

int main(void)
{
    configureTimer1();
    configureTimer3();
    EnableInterrupts();
    while (1)
    {
        IdleMode();
    }
    return 0;
}

void configureTimer1(void)
{
    // Configure Timer T1 with interrupts enabled
    T1CONbits.TCKPS = 2; // 20000000 / (2^16 * 5Hz ) = 61 --> 64, 2 bit de A
    PR1 = 62499;         // 20000000 / (64 * 5Hz ) - 1 = 62499
    TMR1 = 0;            // Clear timer T1 count register
    T1CONbits.TON = 1;   // Enable timer T1 (must be the last command of the
    // timer configuration sequence)

    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T1 interrupts
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag
}

void configureTimer3(void)
{
    // Configure Timer T3 with interrupts enabled
    T3CONbits.TCKPS = 4; // 20000000 / (2^16 * 25Hz ) = 12 --> 16, 4 bit de B
    PR3 = 49999;         // 20000000 / (16 * 25Hz ) - 1 = 49999
    TMR3 = 0;            // Clear timer T3 count register
    T3CONbits.TON = 1;   // Enable timer T3 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
}

void _int_(4) isr_T1(void)
{
    putChar('.');
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag
}

void _int_(12) isr_T3(void)
{
    putChar('-');
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
}
