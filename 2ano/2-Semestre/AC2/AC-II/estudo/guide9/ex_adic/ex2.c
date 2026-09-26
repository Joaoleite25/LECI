#include <detpic32.h>

volatile int voltage = 0;

void configurePorts(void);
void configureT1(void);
void configureT3(void);
void send2displays(unsigned char value);
void setPWM(unsigned int dutyCycle);

int main(void) {
    int dutyCycle, portVal;

    configurePorts();
    configureT1();
    configureT3();

    EnableInterrupts(); // Global Interrupt Enable
    while(1) {
        // Read RB1, RB0 to the variable "portVal"
        portVal = (PORTBbits.RB1 << 1) | PORTBbits.RB0;
        switch(portVal) {
            case 0: // Measure input voltage
                // Enable T1 interrupts
                IEC0bits.T1IE = 1;
                setPWM(0);
                break;
            case 1: // Freeze
                // Disable T1 interrupts
                IEC0bits.T1IE = 0;
                setPWM(100);
                break;
            default:
                // Enable T1 interrupts
                IEC0bits.T1IE = 1;
                dutyCycle = voltage * 3;
                setPWM(dutyCycle);
                break;
        }
    }
    return 0;
} 

void configurePorts(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    TRISBbits.TRISB0 = 1;
    TRISBbits.TRISB1 = 1;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 
    
    AD1CON1bits.CLRASAM = 1; 

    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 8-1; 

    AD1CHSbits.CH0SA = 4; 
    
    AD1CON1bits.ON = 1; 

    IPC6bits.AD1IP = 3; 
    IFS1bits.AD1IF = 0; 
    IEC1bits.AD1IE = 1;
}

void configureT1(void) {
    T1CONbits.TCKPS = 6; 
    PR1 = 62499; 
    TMR1 = 0; 
    T1CONbits.TON = 1; 

    IPC1bits.T1IP = 2; 
    IEC0bits.T1IE = 1; 
    IFS0bits.T1IF = 0; 
}

void configureT3(void) {
    T3CONbits.TCKPS = 2; 
    PR3 = 49999; 
    TMR3 = 0; 
    T3CONbits.TON = 1; 

    IPC3bits.T3IP = 4; 
    IEC0bits.T3IE = 1; 
    IFS0bits.T3IF = 0;
}

void _int_(4) isr_T1(void) {
    // Start A/D conversion
    AD1CON1bits.ASAM = 1; 
    // Reset T1IF flag
    IFS0bits.T1IF = 0; 
} 

void _int_(12) isr_T3(void) {
    // Send the value of the global variable "voltage" to the displays
    // using BCD (decimal) format
    send2displays((voltage/10) << 4 | (voltage%10));
    // Reset T3IF flag
    IFS0bits.T3IF = 0;
} 

void _int_(27) isr_adc(void) {
    // Calculate buffer average (8 samples)
    int avg, sum = 0;
    int *p = (int*)(&ADC1BUF0);
    for(;p <= (int*)(&ADC1BUF7); p+=4) {
        sum += *p;
    }
    // Calculate voltage amplitude and copy it to "voltage"
    avg = sum/8;
    voltage = (avg*33 + 511) / 1023;
    IFS1bits.AD1IF = 0;
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

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle >= 0 || dutyCycle <= 100) {
        OC1RS = (PR3 + 1) * (dutyCycle/100);
    }
}