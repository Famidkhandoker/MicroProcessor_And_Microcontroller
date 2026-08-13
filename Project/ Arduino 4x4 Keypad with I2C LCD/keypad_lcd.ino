#include <Keypad.h> 
#include <Wire.h> 
#include <LiquidCrystal_I2C.h> 
 
LiquidCrystal_I2C lcd(0x27, 16, 2); 
 
const byte ROWS = 4; 
const byte COLS = 4; 
 

char keys[ROWS][COLS] = { 
  {'1', '2', '3', 'A'}, 
  {'4', '5', '6', 'B'}, 
  {'7', '8', '9', 'C'}, 
  {'*', '0', '#', 'D'} 
}; 
 
// Keypad wiring 
byte rowPins[ROWS] = {9,8,7,6}; //connect to the row pinouts of the keypad 
byte colPins[COLS] = {5,4,3,2}; 
Keypad keypad = Keypad( 
  makeKeymap(keys), 
  rowPins, 
  colPins, 
  ROWS, 
  COLS 
); 
 
int col = 0; 
int row = 0; 
 
void setup() { 
  lcd.init(); 
  lcd.backlight(); 
  lcd.clear(); 
} 
 
void loop() { 
 
  char key = keypad.getKey(); 
 
  if (key) { 
 
   
    lcd.setCursor(col, row); 
    lcd.print(key); 
 
    col++; 
 
    
    if (col >= 16) { 
      col = 0; 
      row++; 
 
     
      if (row >= 2) { 
        row = 0; 
        lcd.clear(); 
      } 
    } 
  } 
} 
