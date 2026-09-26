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

        if (ch == 'a') LATB = (LATB & 0x80FF) | (1 << 8);
        if (ch == 'b') LATB = (LATB & 0x80FF) | (1 << 9);
        if (ch == 'c') LATB = (LATB & 0x80FF) | (1 << 10);
        if (ch == 'd') LATB = (LATB & 0x80FF) | (1 << 11);
        if (ch == 'e') LATB = (LATB & 0x80FF) | (1 << 12);
        if (ch == 'f') LATB = (LATB & 0x80FF) | (1 << 13);
        if (ch == 'g') LATB = (LATB & 0x80FF) | (1 << 14);
    }
    return 0;
}
