#include <detpic32.h>

int main(void) 
{
    TRISE = TRISE & 0xFF87;
    unsigned int counter = 0;

    while(1) 
    {
        resetCoreTimer();
        while ((readCoreTimer() < 6347826));
        LATE = (LATE & 0xFF87) | counter << 3;

        counter = (counter + 9) % 10;
    }
    return 0;
}