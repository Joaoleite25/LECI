#include <detpic32.h>

void configureAll(void);
void delay(int ms);
void send2displays(unsigned char value);

volatile unsigned char voltage = 0;

int main(void) {
    unsigned int cnt = 0;
    // Configure all (digital I/O, analog input, A/D module, interrupts)
    configureAll();
    EnableInterrupts(); // Global Interrupt Enable
    while(1) {
        if(cnt == 0) { // 0, 200 ms, 400 ms, ... (5 samples/second)
        // Start A/D conversion
        AD1CON1bits.ASAM = 1;
        }
        // Send "voltage" value to displays
        send2displays((voltage/10) << 4 | (voltage%10));
        cnt = (cnt + 1) % 20;
        // Wait ?? ms
        delay(10);
    }
    return 0;
}

void configureAll(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    TRISBbits.TRISB4 = 1; 
    AD1PCFGbits.PCFG4 = 0; 
    AD1CON1bits.SSRC = 7; 
   
    AD1CON1bits.CLRASAM = 1; 

    AD1CON3bits.SAMC = 16; 
    AD1CON2bits.SMPI = 8-1; 

    AD1CHSbits.CH0SA = 4; 

    AD1CON1bits.ON = 1; 

    IPC6bits.AD1IP = 2; // configure priority of A/D interrupts 
    IFS1bits.AD1IF = 0; // clear A/D interrupt flag 
    IEC1bits.AD1IE = 1; // enable A/D interrupts 
}

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < (ms * 20000)); 
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

void _int_(27) isr_adc(void) {
    // Read 8 samples (ADC1BUF0, ..., ADC1BUF7) and calculate average
    // Calculate voltage amplitude
    // Convert voltage amplitude to decimal and store the result in the global variable "voltage"
    // Reset AD1IF flag
    int sum = 0;
    int avg;
    int* p = (int*)(&ADC1BUF0);
    for(; p <= (int*)(&ADC1BUF7); p+=4) {
        sum += *p;
    }
    avg = sum / 8;
    voltage = (avg*33 + 511) / 1023;
    
    AD1CON1bits.ASAM = 1;
    IFS1bits.AD1IF = 0; // Reset AD1IF flag 
} 