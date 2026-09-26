#include <detpic32.h>

int main(void)
{
    // Configure port RC14 as output
    TRISC = TRISC & 0xBFFF;
    LATC = LATC & 0xBFFF;
    while (1)
    {
        // Wait 0.5s
        resetCoreTimer();
        while (readCoreTimer() < 10000000);

        LATC = LATC ^ 0x4000 ; // Toggle RC14 port value
    }
    return 0;
}