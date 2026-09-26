#include <detpic32.h>

void delay(int n)
{
    for (; n > 0; n--)
    {
        resetCoreTimer();
        while (readCoreTimer() < 20000);
    }
}

void sendToLEDs(int counter) {
    LATE = (LATE & 0xFFC3) | (counter << 2);        // contar os 4 bits mais significativos
}

int main(void)
{
    TRISE = (TRISE & 0xFFC3); // 1111 1111 1100 0011
    TRISBbits.TRISB2 = 1;

    int counter = 0;
    while (1)
    {

        sendToLEDs(counter);

        printInt(counter, 10 | 2 << 16);    // tirar da base 16 pra 10, contanto apenas os 4 bits mais significativos
        putChar('\r');
        if (PORTBbits.RB2 == 0)
        {
            delay(435);                    // 2.3Hz
        }
        else
        {
            delay(181);                     // 5.5hZ
        }

        counter = (counter - 1 + 12) % 12;  // if counter == -1, counter = 11
    }
}