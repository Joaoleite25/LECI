#include <detpic32.h>

int main(void) {
    TRISE = TRISE & 0xFF03;         // 1111 1111 0000 0011
    TRISB = TRISB | 0x0005;     
    int i = 0;    
    unsigned int led_value = 0x00C3;
    int freq = 2739726;

    while(1) {
        int value = PORTB & 0x0005;
        i = (i+1) % 5;
        if (i == 0) {
            led_value = 0x00C3;
        }
        LATE = (LATE & 0xFF03) | led_value;
        led_value = led_value >> 1;
        if (value == 0x0005) {
            freq = 2739726;
        } else {
            freq = 4347826;
        }
        resetCoreTimer();
        while(readCoreTimer() < freq);
    }
    return 0;
}