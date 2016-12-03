#define LATCH 9
#define CLOCK 8
#define DATA 7
#define G 6
#define ROWA 5
#define ROWB 4
#define ROWC 3
#define ROWD 2

unsigned int pattern[16] = {
 0b0010000001111100, // 8316
 0b0110000010000010, // 24706
 0b0010000000000010, // 8194
 0b0010000001111100, // 8316
 0b0010000010000000, // 8320
 0b0010000010000000, // 8320
 0b0111000011111110, // 28926
 0b0000000000000000, // 0
 0b0111110000001100, // 31756
 0b1000001000010100, // 33300
 0b0000001000100100, // 548
 0b0011110001000100, // 15428
 0b0000001010000100, // 644
 0b1000001011111110, // 33534
 0b0111110000000100, // 31748
 0b0000000000000000}; // 0
 
void setup() {
 pinMode (LATCH, OUTPUT);
 pinMode (CLOCK, OUTPUT);
 pinMode (DATA, OUTPUT);
 pinMode (G, OUTPUT);
 pinMode (ROWA, OUTPUT);
 pinMode (ROWB, OUTPUT);
 pinMode (ROWC, OUTPUT);
 pinMode (ROWD, OUTPUT);
}

// http://codepad.org/jtApX9tP
// bitRead(value, bit) (((value) >> (bit)) & 0x01)
void loop() {
 for (byte i=0; i<16; i++) {
   digitalWrite(G, HIGH);
   digitalWrite(LATCH, LOW);
   shiftOut(DATA, CLOCK, MSBFIRST, 0);
   shiftOut(DATA, CLOCK, MSBFIRST, 0);
   digitalWrite(LATCH, HIGH);
   digitalWrite(ROWA, bitRead(i, 0));
   digitalWrite(ROWB, bitRead(i, 1));
   digitalWrite(ROWC, bitRead(i, 2));
   digitalWrite(ROWD, bitRead(i, 3));
   digitalWrite(LATCH, LOW);
   shiftOut(DATA, CLOCK, MSBFIRST, highByte(pattern[i]));
   shiftOut(DATA, CLOCK, MSBFIRST, lowByte(pattern[i]));
   digitalWrite(LATCH, HIGH);
   digitalWrite(G, LOW);
   delayMicroseconds(500);
 }
}
