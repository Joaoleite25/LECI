#include <detpic32.h>

void delay(unsigned int ms)
{
 resetCoreTimer();
 while(readCoreTimer() < 20000 * ms);
} 

int main(void) {
    unsigned char segment;
    int displayToggle = 0; int i;

    TRISB = TRISB & 0x80FF;     
    TRISD = TRISD & 0xFF9F;

    while(1) {
        segment = 1;

        for(i = 0; i < 7; i++) {
            LATB = (LATB & 0x80FF) | (segment << 8);

            if(displayToggle == 0) {
                LATD = LATD | 0x0020;       // RD5 = 1
                LATD = LATD & 0xFFBF;       // RD6 = 0
            } else {
                LATD = LATD | 0x0040;
                LATD = LATD & 0xFFDF;
            }
            delay(1);
            segment = segment << 1;
        }
        displayToggle = !displayToggle;
    }
}

