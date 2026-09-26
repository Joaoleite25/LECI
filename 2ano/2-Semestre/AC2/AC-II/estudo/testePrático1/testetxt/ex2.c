#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000)); 
}

int main(void) {
    unsigned int mode, counter = 0;
    unsigned char value;
    static char displayFlag = 0;

    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    TRISE = TRISE & 0xFFC0;  
    TRISB = (TRISB & 0xFFFC) | 0x0003; 
    TRISD = TRISD & 0xFF9F; 
    TRISB = TRISB & 0x80FF;  

    while(1) {
        mode = PORTB & 0x0003;
        LATE = (LATE & 0xFFC0) | (counter & 0x3F);

        if (mode == 0b00) {
            LATD = LATD & 0xFF9F;
            LATB = LATB & 0x80FF;
        } else if (mode == 0b01 || mode == 0b10) {
            value = inkey();

            if (value >= '0' && value <= '9') {
                value -= '0'; 
                if (mode == 0b01) {
                    LATD = (LATD & 0xFF9F) | 0x0020;
                    LATB = (LATB & 0x80FF) | (disp7Scodes[value] << 8);
                } else {
                    LATD = (LATD & 0xFF9F) | 0x0040;
                    LATB = (LATB & 0x80FF) | (disp7Scodes[value] << 8);
                }
            }
        } else {
            if (displayFlag == 0) {
                LATD = (LATD & 0xFF9F) | 0x0020;
                LATB = (LATB & 0x80FF) | (disp7Scodes[counter % 10] << 8);
            } else {
                LATD = (LATD & 0xFF9F) | 0x0040;
                LATB = (LATB & 0x80FF) | (disp7Scodes[counter / 10] << 8);
            }
            displayFlag = !displayFlag;
        }
        delay(10);
        int i = (i+1) % 20;
        if(i == 0){
            counter = (counter + 1) % 60;
        }
        
    }
    return 0;
}
