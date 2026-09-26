#include <detpic32.h>

int main(void)
{
    TRISB = TRISB & 0x80FF; // 1000 0000 1111 1111
    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111

    LATD = LATD & 0xFF9F;

    while(1)
    {
        char ch = getChar();

        LATD = (LATD & 0xF9FF) | 0x0020
        LATB = LATB & 0x80FF;

        if (ch == 'a') LATB = (LATB & 0x80FF) | (1 << 8);   // Segmento A
        if (ch == 'b') LATB = (LATB & 0x80FF) | (1 << 9);   // Segmento B
        if (ch == 'c') LATB = (LATB & 0x80FF) | (1 << 10);  // Segmento C
        if (ch == 'd') LATB = (LATB & 0x80FF) | (1 << 11);  // Segmento D
        if (ch == 'e') LATB = (LATB & 0x80FF) | (1 << 12);  // Segmento E
        if (ch == 'f') LATB = (LATB & 0x80FF) | (1 << 13);  // Segmento F
        if (ch == 'g') LATB = (LATB & 0x80FF) | (1 << 14);  // Segmento G

        LATD = (LATD & 0xF9FF) | 0x0040;
        LATB = LATB = 0x80FF;
    }
    return 0;
}