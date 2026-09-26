#include <detpic32.h>

void configureT3(void);
void configurePorts(void);
void setPWM(unsigned int dutyCycle);


int main(void) {     
    configureT3();

    while(1) {
        IdleMode();
    }
    return 0;
}

void configureT3(void) {
    T3CONbits.TCKPS = 2; 
    PR3 = 49999; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1;// Use timer T2 as the time base for PWM generation
    setPWM(10);
    OC1CONbits.ON = 1; // Enable OC1 module
}

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle <= 100) {
        OC1RS = (PR3 + 1) * (dutyCycle/100);
    }
}

