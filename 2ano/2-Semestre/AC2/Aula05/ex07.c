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

void delay(int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < (ms * 20000));
}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

int main(void)
{
    // declare variables
    // initialize ports
    TRISB = (TRISB & 0x80FF);                   // 1000 0000 1111 1111
    TRISD = (TRISD & 0xFF9F);                   // 1111 1111 1001 1111
    TRISB = (TRISB | 0x0001);
    TRISC = (TRISC & 0xBFFF);                   // 1011 1111 1111 1111
    int counter = 0;
    int i;
    int value;
    while (1)
    {
        i = 0;
        value = PORTB & 0x0001;
        do
        {
            send2displays(toBcd(counter));

            delay(10);                      // 100Hz
        } while (++i < 10);
        if (value == 0)
        {   
            if (counter > 59)
            {
                counter = 0;
                LATC = (LATC & 0xBFFF) | 0x4000;
                delay(5000);                 // 5s       t=1/f
                LATC = (LATC & 0xBFFF);
            }
            delay(200);                     // 5Hz
            counter = (counter + 1);
            
        }
        else
        {
            if (counter < 0)
            {
                counter = 59;
                LATC = (LATC & 0xBFFF) | 0x4000;
                delay(5000);                 // 5s       t=1/f
                LATC = (LATC & 0xBFFF);
            }
            
            delay(500);                     // 2Hz
            counter = (counter - 1);
        }
    }
    return 0;
}
