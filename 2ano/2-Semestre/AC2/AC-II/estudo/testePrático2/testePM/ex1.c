#include <detpic32.h>

void setPWM(unsigned int dutyCycle);
void delay(int ms);

int main(void) {
    TRISBbits.TRISB3 = 1;

    T3CONbits.TCKPS = 1; 
    PR3 = 41666; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    OC1CONbits.OCM = 6; 
    OC1CONbits.OCTSEL = 1;
    setPWM(80);
    OC1CONbits.ON = 1; 

    int flag = 0;
    int indelay = 0;

    while(1) {
        if (PORTBbits.RB3 == 1) {
            if (flag) {
                setPWM(15);
                indelay = 500;
            } else {
                setPWM(60);
                indelay = 1500;
            }
            flag = !flag;
            delay(indelay);
        }
    }

    return 0;
}

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle <= 100) {
        OC1RS = ((PR3 + 1) * dutyCycle) / 100;
    }
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < ms * 20000);
}
