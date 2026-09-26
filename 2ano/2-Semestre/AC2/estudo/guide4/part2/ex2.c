#include <detpic32.h>

int main(void) {
    char ch;
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    LATD = LATD | 0x0020;
    LATD = LATD & 0xFFBF;

    while(1) {
        ch = getChar();
        LATB = LATB & 0x80FF;

        if (ch >= 'a' && ch <= 'g') {
            ch = ch - 'a';
            LATB = (LATB & 0x80FF) | 1 << (ch + 8);
        }
    }
    return 0;
}
