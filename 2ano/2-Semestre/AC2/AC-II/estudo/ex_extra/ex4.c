#include <detpic32.h>

void send2displays(unsigned char value) {
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0) {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    } else {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000)); 
}

int main(void) {
    int i;
    char value;
    TRISE = TRISE & 0xFFF0;
    TRISD = TRISD & 0xFF9F;
    TRISD = TRISB & 0x80FF;
    LATE = LATE & 0xFFF0;

    while(1) {
        value = getChar();
        unsigned char displayValue; 

        if (value >= '0') {
            LATE = (LATE & 0xFFF0) | 0x0001;
        } else if (value == '1') {
            LATE = (LATE & 0xFFF0) | 0x0002;
        } else if (value == '2') {
            LATE = (LATE & 0xFFF0) | 0x0004;
        } else if (value == '3') {
            LATE = (LATE & 0xFFF0) | 0x0008;
        } else {
            LATE = (LATE & 0xFFF0) | 0x000F;
            resetCoreTimer();
            while(readCoreTimer() < 20000000);
            LATE = (LATE & 0xFFF0);
        }  
    }
    return 0;
}