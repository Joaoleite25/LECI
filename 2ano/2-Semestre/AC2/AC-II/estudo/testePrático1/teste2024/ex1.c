#include <detpic32.h>

void delay(int ms);

int main(void) {
    TRISE = TRISE & 0xFFC3;    // 1100 0011
    TRISB = TRISB | 0x0006;

    int value, counter = 12;

    while(1) {
        value = PORTB | 0x0006;

        if (value == 0) {
            delay(434);
            LATE = (LATE & 0xFFC3) | (counter << 2);

        } else {
            delay(181);
            LATE = (LATE & 0xFFC3) | (counter << 2); 
        }
        counter = (counter - 1 + 12) % 12;   
        printInt(counter, 10 | 2 << 16);
        putChar(' ');
    }
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000));
}