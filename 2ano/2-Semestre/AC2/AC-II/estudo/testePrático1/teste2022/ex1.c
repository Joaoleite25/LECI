#include <detpic32.h>

int main(void) {
    TRISE = TRISE & 0xFFC0;

    unsigned int led_value = 0x0001;

    while(1) {
        LATE = (LATE & 0xFFC0) | led_value;
        led_value = led_value << 1;
        resetCoreTimer();
        while(readCoreTimer() < 6666666);
    }
    return 0;
}