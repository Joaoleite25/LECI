#include <detpic32.h>

volatile int voltage = 0;
volatile int voltMin = 33;
volatile int voltMax = 0;

void configurePorts(void);
void configureT1(void);
void configureT3(void);
void configureUART(void);
void send2displays(unsigned char value);
void putc(char byte);

int main(void) {
    configurePorts();
    configureUART();
    configureT1();
    configureT3();

    EnableInterrupts();
    while(1) {
        IdleMode();
    }
    return 0;
}

void configurePorts(void) {
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

void configureUART(void) {
    U2BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;
    U2MODEbits.PDSEL = 0;  // 8N
    U2MODEbits.STSEL = 0;  // 1 stop bit

    U2STAbits.UTXEN = 1;   // Transmit enable
    U2STAbits.URXEN = 1;   // Receive enable
    U2MODEbits.ON = 1;     // UART enable

    IPC8bits.U2IP = 1;
    IFS1bits.U2RXIF = 0;
    IEC1bits.U2RXIE = 1;   // Enable RX interrupt
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

    if (voltage < voltMin) voltMin = voltage;
    if (voltage > voltMax) voltMax = voltage;

    IFS1bits.AD1IF = 0;
}

void _int_(32) isr_uart2(void) {
    char c = U2RXREG;
    if (c == 'M') {
        putc('0');
        putChar('\r');
    } else if (c == 'm') {
        putc('1');
        putChar('\r');
    }
    IFS1bits.U2RXIF = 0;
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

void putc(char byte) {
    while( U2STAbits.UTXBF == 1);
    U2TXREG = byte;  
}