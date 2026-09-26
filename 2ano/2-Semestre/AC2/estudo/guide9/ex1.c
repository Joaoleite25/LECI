#include <detpic32.h>

volatile int voltage = 0; // Global variable

void configAll(void);
void configT1(void);
void configT3(void);
void configDisplay(void);
void configADC(void);


int main(void)
{
    configAll(); // Function to configure all (digital I/O, analog
    // input, A/D module, timers T1 and T3, interrupts)
    // Reset AD1IF, T1IF and T3IF flags

    EnableInterrupts(); // Global Interrupt Enable
    while (1)
    {
        IdleMode();
    }
    return 0;
}

void configAll(void)
{
    configT1();
    configT3();

    configDisplay();

    configADC();
}

void configADC(void)
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
    AD1CON2bits.SMPI = 8 - 1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag
    IEC1bits.AD1IE = 1; // enable A/D interrupts
}

void configT1(void)
{
    T1CONbits.TCKPS = 2; // 20000000 / (2^16 * 5Hz) = 61 --> 64, 2 bit
    PR1 = 62499;         // 20000000 / (64 * 5Hz) - 1 = 62499
    TMR1 = 0;            // Clear timer T1 count register
    T1CONbits.TON = 1;   // Enable timer T1 (must be the last command of the
    // timer configuration sequence)

    IPC1bits.T1IP = 3; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T1 interrupts
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag
}

void configT3(void)
{
    T3CONbits.TCKPS = 2; // 20000000 / (2^16 * 100Hz) = 3 --> 4, 2 bit
    PR3 = 49999;         // 20000000 / (4 * 100Hz) - 1 = 49999
    TMR3 = 0;            // Clear timer T3 count register
    T3CONbits.TON = 1;   // Enable timer T3 (must be the last command of the
    // timer configuration sequence)

    IPC3bits.T3IP = 4; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
}

void configDisplay(void)
{
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;
}

void _int_(4) isr_T1(void)
{
    // Start A/D conversion
    AD1CON1bits.ASAM = 1; // Start conversion
    while (IFS1bits.AD1IF == 0)
        ; // Wait while conversion not done
    // Reset T1IF flag
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag
}

void send2displays(unsigned char value)
{
    unsigned const char disp7Scodes[] = {0x3F, 0x06, 0x5b, 0x4F,
                                         0x66, 0x6D, 0x7D, 0x07,
                                         0x7F, 0x6F, 0x77, 0x7C,
                                         0x39, 0x5E, 0x79, 0x71};

    static char displayflag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayflag == 0)
    {
        LATDbits.LATD6 = 0;
        LATDbits.LATD5 = 1;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    }
    else
    {
        LATDbits.LATD6 = 1;
        LATDbits.LATD5 = 0;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayflag = !displayflag;
}

void _int_(12) isr_T3(void)
{
    // Send the value of the global variable "voltage" to the displays
    // using BCD (decimal) format
    send2displays((voltage / 10) << 4 | (voltage % 10)); // to bcd
    // Reset T3IF flag
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
}

void _int_(27) isr_adc(void)
{
    // Calculate buffer average (8 samples)
    int *p = (int *)(&ADC1BUF0);
    int avr = 0;
    for (; p <= (int *)(&ADC1BUF7); p += 4)
    {
        avr += *p;
    }
    avr /= 8;
    // Calculate voltage amplitude and copy it to "voltage"
    voltage = (avr * 33 + 511) / 1023;
    IFS1bits.AD1IF = 0; // Reset AD1IF flag
}
