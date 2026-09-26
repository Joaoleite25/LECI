#include <detpic32.h>

void configT3(void);
void setPWM(unsigned int dutyCycle);

int main(void)
{
    // Configure Timer T3
    // Configure Output Compare Module 1 (OC1)
    configT3();

    while (1)
    {
        IdleMode();
    }
    return 0;
}

void configT3(void)
{
    T3CONbits.TCKPS = 2; // 20000000 / (2^16 * 100Hz) = 3 --> 4, bit 2
    PR3 = 49999;         // 20000000 / (4 * 100Hz) - 1 = 49999
    TMR3 = 0;            // Clear timer T3 count register
    T3CONbits.TON = 1;   // Enable timer T3 (must be the last command of the
    // timer configuration sequence)

    OC1CONbits.OCM = 6;    // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1; // t2 = 0 e t3 = 1
    OC1RS = setPWM(25);
    OC1CONbits.ON = 1; // Enable OC1 module
}

void setPWM(unsigned int dutyCycle)
{
    // duty_cycle must be in the range [0, 100]
    if (dutyCycle >= 0 && dutyCycle <= 100)
    {
        OC1RS = (50000 * dutyCycle) / 100; //((49999 + 1) * 25%) / 100 = 12500
    }
}
