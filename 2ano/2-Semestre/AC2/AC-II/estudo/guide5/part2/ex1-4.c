#include <detpic32.h>

unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

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
    TRISE = TRISE & 0xFF00;
    TRISD = TRISD & 0xFF9F;   
    TRISB = TRISB & 0x80FF;
    TRISBbits.TRISB0 = 1;
    TRISCbits.TRISC14 = 0;

    int counter = 0, i;

    while(1) {
        i = 0;
        do {
            send2displays(toBcd(counter));
            LATE = (LATE & 0xFF00) | toBcd(counter); 
            delay(10);
        } while(++i < 20);

        if (PORTBbits.RB0 == 1) {
            if (counter > 59) {
                LATCbits.LATC14 = 1;  
                delay(5000);  
                LATCbits.LATC14 = 0;  
                counter = 0;
            }
            counter++;
        } else {
            if (counter < 0) {
                LATCbits.LATC14 = 1;  
                delay(5000);  
                LATCbits.LATC14 = 0;  
                counter = 59;
            }
            counter--;
        }
    }
}  
