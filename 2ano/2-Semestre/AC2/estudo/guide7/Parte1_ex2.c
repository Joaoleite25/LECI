#include <detpic32.h>

volatile int *pau;
volatile unsigned char voltage = 0; // Global variable

void wait(int x);
void send2displays(unsigned char voltage);

int main(void)
{
    unsigned int cnt = 0;

    // Configure all (digital I/O, analog input, A/D module)
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

    // Configure interrupt system
    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag
    IEC1bits.AD1IE = 1; // enable A/D interrupts

    EnableInterrupts(); // Global Interrupt Enable

    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    // Start A/D conversion
    AD1CON1bits.ASAM = 1; // Start conversion
    while (1)
    {
        if (cnt == 0) // 0, 200 ms, 400 ms, ... (5 samples/second)
        {
            // Start A/D conversion
            IdleMode();
        }
        // Send "voltage" value to displays
        send2displays((voltage/10) << 4 | (voltage%10)); // voltage to bcd
        cnt = (cnt + 1) % 20; // 20 = Hz/5 sequencias
        // Wait 10 ms
        wait(10);
    }
    return 0;
}

void wait(int x)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * x)
        ;
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

// Interrupt Handler
void _int_(27) isr_adc(void)
{
    // Read 8 samples (ADC1BUF0, ..., ADC1BUF7) and calculate average
    int avg = 0;
    int *p = (int *)(&ADC1BUF0);
    for (; p <= (int *)(&ADC1BUF7); p += 4)
    {
        avg += *p;
    }
    avg = avg / 8;
    voltage = (avg * 33 + 511) / 1023;

    IFS1bits.AD1IF = 0;   // Reset AD1IF flag
    AD1CON1bits.ASAM = 1; // Start conversion

    // Calculate voltage amplitude
    // Convert voltage amplitude to decimal and store the result in the
    // global variable "voltage"
    // Reset AD1IF flag
}
