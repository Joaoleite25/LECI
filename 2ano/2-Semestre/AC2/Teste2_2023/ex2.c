#include <detpic32.h>

volatile int temp = 0;

void confADC(void)
{
    TRISBbits.TRISB4 = 1;  // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7;  // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2 - 1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence
}

void send2displays(unsigned char value) {
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0) {
        LATD = (LATD & 0xFF9F) | 0X0020;
        LATB = (LATB & 0X80FF) | (disp7Scodes[digit_low] << 8);
    } else {
        LATD = (LATD & 0xFF9F) | 0X0040;
        LATB = (LATB & 0X80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

void confT3(void)
{
    T3CONbits.TCKPS = 2; // 20000000÷(2¹⁶×140) = 2 --> 4, 2 bit
    PR3 = 35713;         // 20000000÷(4×140) - 1 = 35713
    TMR3 = 0;            // Clear timer T2 count register
    T3CONbits.TON = 1;   // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag
}

int main(void)
{
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    confADC();
    confT3();

    EnableInterrupts();
    while (1)
    {
        int avg = 0;

        AD1CON1bits.ASAM = 1; // Start conversion 
        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done
        
        int *p = (int *)(&ADC1BUF0);
        for (; p <= (int *)(&ADC1BUF1); p+= 4)
        {
            avg += *p;
        }
        avg /= 2;

        temp = (avg * 65 + 511) / 1023 + 10;

        IFS1bits.AD1IF = 0;
        // 5Hz
        resetCoreTimer();
        while (readCoreTimer() < 20000 * 200)
            ; // 1/5 = 0,2 s
    }
    return 0;
}

void _int_(12) isr_T3(void)
{
    send2displays((temp/10) << 4 | (temp%10));
    IFS0bits.T3IF = 0; // Reset AD1IF flag 
}
