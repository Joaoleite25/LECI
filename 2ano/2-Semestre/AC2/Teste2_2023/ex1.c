#include <detpic32.h>

void setDutyCycle(unsigned int x){
    OC3RS = ((PR3 + 1) * x) / 100;
}

void delay(unsigned int x) {
    resetCoreTimer();
    while (readCoreTimer() < 20 * x);       // 20000 * ms = 20 * us
}

int main(void)
{
    T3CONbits.TCKPS = 2; // 20000000 / 120Hz / 2^16 = 2,5 --> 4, 2º bit
    PR3 = 41666;         // (20000000 / 120Hz / 4) - 1 = 41665,666 --> 41666
    TMR3 = 0;            // Reset timer T2 count register
    T3CONbits.TON = 1;   // Enable timer T2 (must be the last command of the
    // timer configuration sequence)
    OC3CONbits.OCM = 6;    // PWM mode on OCx; fault pin disabled
    OC3CONbits.OCTSEL = 1; // T3 = 1, T2 = 0
    setDutyCycle(75);       // 75%
    OC3CONbits.ON = 1;

    TRISBbits.TRISB0 = 1;   // ENTRADA
    TRISBbits.TRISB2 = 1;   // ENTRADA

    while (1)
    {
        if(PORTBbits.RB0 == 0 && PORTBbits.RB2 == 0 ) {
            setDutyCycle(30);   // 30%
        }
        else if (PORTBbits.RB0 == 1 && PORTBbits.RB2 == 1 )
        {
            setDutyCycle(55);   // 55%
        }
        delay(360);         //360us
    }
    return 0;
}

/*
    OCxCONbits.OCM = 6;
*/