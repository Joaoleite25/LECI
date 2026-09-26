#include <detpic32.h>

int main(void) {
    char value;
    TRISE = TRISE & 0xFFF0;

    LATE = (LATE & 0xFFF0);

    while(1) {
        value = getChar();

        if (value == '0') {
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
            while(readCoreTimer() < 100000000);
            LATE = (LATE & 0xFFF0);
        }      
    }
    return 0;
}