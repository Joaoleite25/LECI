#include <detpic32.h>

int main(void) {
    unsigned int value, output;
    TRISE = TRISE & 0xFF00;
    TRISB = TRISB | 0x000F;

    while(1) {
        value = PORTB & 0x000F;

        LATE = (LATE & 0xFFF0) | value; 

        output = value;

        output |= ((value & 0x08) << 1);  // RB3 -> RE4
        output |= ((value & 0x04) << 3);  // RB2 -> RE5
        output |= ((value & 0x02) << 5);  // RB1 -> RE6
        output |= ((value & 0x01) << 7);  // RB0 -> RE7

        LATE = (LATE & 0xFF0F) | output;           
    }
    return 0;
}