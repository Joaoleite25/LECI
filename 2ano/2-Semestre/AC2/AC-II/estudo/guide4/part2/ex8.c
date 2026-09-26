#include <detpic32.h>

int main(void) {
    static const char disp7codes[] = {
        0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    int dips, code;

    TRISB = TRISB | 0x000F;
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    while(1) {
        dips = PORTB & 0x000F;
        code = disp7codes[dips];

        LATB = (LATB & 0x80FF) | (code << 8);

        LATD = LATD & 0xFFDF;
        LATD = LATD | 0x0040;
    }
    return 0;
}