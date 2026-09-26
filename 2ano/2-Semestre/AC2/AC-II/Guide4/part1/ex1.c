#include <detpic32.h>

int main(void) 
{
    TRISC = TRISC & 0xBFFF; // 1011 1111 1111 11110
    // ou TRICbits.TRISC14 = 0;
    LATC = LATC & 0xBFFF;
    // ou LATCbits.LATC14 = 0;

    while(1) 
    {
        resetCoreTimer();
        while(readCoreTimer() < 10000000); // 0.5s

        LATC = LATC ^ 0x4000;
    }
    return 0;
}