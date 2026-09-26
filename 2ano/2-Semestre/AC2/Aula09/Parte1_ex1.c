#include <detpic32.h>

void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5b, 0x4F,
                                       0x66, 0x6D, 0x7D, 0x07,
                                       0x7F, 0x6F, 0x77, 0x7C,
                                       0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0; // static variable: doesn't loose its
    // value between calls to function
    int digit_low = value & 0x0F;
    int digit_high = value >> 4;
    // if "displayFlag" is 0 then send "digit_low" to display_low
    // else send "digit_high" to didplay_high
    // toggle "displayFlag" variable
    if (displayFlag == 0)
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
    displayFlag = !displayFlag;
}
unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void delay(int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < (ms * 20000))
        ;
}

int main(void)
{
    TRISBbits.TRISB4 = 1;     // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0;    // RBx configured as analog input
    AD1CON1bits.SSRC = 7;     // Conversion trigger selection bits: in this
                              // mode an internal counter ends sampling and
                              // starts conversion
    AD1CON1bits.CLRASAM = 1;  // Stop conversions when the 1st A/D converter
                              // interrupt is generated. At the same time,
                              // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 4 - 1; // Interrupt is generated after N samples
                              // (replace N by the desired number of
                              // consecutive samples)
    AD1CHSbits.CH0SA = 4;     // replace x by the desired input
                              // analog channel (0 to 15)
    AD1CON1bits.ON = 1;       // Enable A/D converter
                              // This must the last command of the A/D
                              // configuration sequence

    TRISB = (TRISB & 0x80FF); // 1000 0000 1111 1111
    TRISD = (TRISD & 0xFF9F); // 1111 1111 1001 1111

    int i = 0;
    int volt, sum, avg;
    while (1)
    {
        if (i == 0) // 0, 200ms, 400ms, 600ms, ...
        {
            sum = 0;
            AD1CON1bits.ASAM = 1; // Start conversion
            while (IFS1bits.AD1IF == 0); // Wait while conversion not done
            int *p = (int *)(&ADC1BUF0);
            for (; p <= (int *)(&ADC1BUFF); p += 4)
            {
                sum += *p;
                IFS1bits.AD1IF = 0;
            } 
            avg = sum/ 4;
            volt = (avg*33 + 511)/1023;
        }
        send2displays(toBcd(volt)); // Send voltage value to displays
        delay(10);               // Wait 10 ms (using the core timer)
        i = (i + 1) % 20 ;
    }
    return 0;
}