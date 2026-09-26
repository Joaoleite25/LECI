#include <detpic32.h>

void setPWM(unsigned int dutyCycle);
void delay(int us);

int main(void) {
    int prevDutyC;
    int dutyC = 25;

    TRISB = TRISB | 0x0009;
    TRISD = TRISD & 0xFFFD;   

    T2CONbits.TCKPS = 2;
    PR2 = 33332;
    TMR2 = 0;
    T2CONbits.TON = 1;

    OC1CONbits.OCM = 6; 
    OC1CONbits.OCTSEL = 0;
    setPWM(dutyC);
    OC1CONbits.ON = 1; 

    while(1) {
        if (PORTBbits.RB3 == 0 && PORTBbits.RB0 == 1) {
            dutyC = 25;
        } else if (PORTBbits.RB3 == 1 && PORTBbits.RB0 == 0) {
            dutyC = 70;
        }
        if (dutyC != prevDutyC) {
            setPWM(dutyC);
            prevDutyC = dutyC;
        }
        delay(250);
    }
    return 0;
}

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle >= 0 && dutyCycle <= 100) {
        OC1RS = ((PR2 + 1) * dutyCycle) / 100;
    }
}

void delay(int us) {
    resetCoreTimer();
    while(readCoreTimer() < us * 20);
}