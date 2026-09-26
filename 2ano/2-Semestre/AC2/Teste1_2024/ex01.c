#include <detpic32.h>

#define SLOW 8695652            //2.3Hz
#define FAST 3636364            //5,5Hz

void delay(unsigned int delay) {
    resetCoreTimer();
    while (readCoreTimer() < delay);
}

int main(void)
{
    TRISE &= 0xFFC3;            // 1111 1111 1100 0011

    int counter = 0;
    while (1)
    {
        
        LATE &= 0xFFC3;
        LATE |= (counter << 2);

        printInt(counter, 10 | 2 << 16);
        putChar('\r');

        if (PORTBbits.RB2 == 0)
        {
            delay(SLOW);
        }
        else {
            delay(FAST);
        }

        counter = (counter -1 + 12) % 12;
    }
}