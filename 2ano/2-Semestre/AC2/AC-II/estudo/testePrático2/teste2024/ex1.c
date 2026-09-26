#include <detpic32.h>

void setPWM(unsigned int dutyCycle);
void delay(int ms);

volatile unsigned int dutyCycle = 50;

int main(void) {
    TRISBbits.TRISB1 = 1;
    
    T3CONbits.TCKPS = 2; 
    PR3 = 38461; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    OC1CONbits.OCM = 6; 
    OC1CONbits.OCTSEL = 1;
    setPWM(dutyCycle); 
    OC1CONbits.ON = 1; 

    int flag = 0;

    while(1) {
        if (PORTBbits.RB1 == 0) {
            if (flag) {
                dutyCycle = 25;
            } else {
                dutyCycle = 75;
            }
            flag = !flag;
            delay(1300);
        }
        setPWM(dutyCycle);
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

