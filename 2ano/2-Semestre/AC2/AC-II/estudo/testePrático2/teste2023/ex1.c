#include <detpic32.h>

void setPWM(unsigned int dutyCycle);
void delay(int us);

volatile int dutyCycle = 75;

int main(void) {
    TRISB = TRISB | 0x0005;
    TRISDbits.TRISD1 = 0;       

    T3CONbits.TCKPS = 2; 
    PR3 = 41666; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 
    
    OC1CONbits.OCM = 6; 
    OC1CONbits.OCTSEL = 1;
    setPWM(dutyCycle);
    OC1CONbits.ON = 1;
    
    while(1) {
        if (PORTBbits.PORT0 == 0 && PORTBbits.PORT2 == 0) {
            dutyCycle = 30;
        } else if (PORTBbits.PORT0 == 1 && PORTBbitsPORT2 == 1) {
            dutyCycle = 55;
        }
        delay(360);
    } 
    return 0;
}

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle <= 100 && dutyCycle >= 0) {
        OC1RS = ((PR3 + 1) * dutyCycle) / 100;
    }
}

void delay(int us) {
    resetCoreTimer();
    while(readCoreTimer() < us * 20);
}