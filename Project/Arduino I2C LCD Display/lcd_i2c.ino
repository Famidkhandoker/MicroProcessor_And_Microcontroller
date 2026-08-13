#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

// Set the LCD address to 0x27 for a 16 chars and 2 line display
// (If 0x27 doesn't work, try 0x3F or 0x20)
LiquidCrystal_I2C lcd(0x27, 16, 2); 

void setup() {
  lcd.init();         // Initialize the LCD
  lcd.backlight();    // Turn on the backlight
  
  lcd.setCursor(0, 0);       // Move cursor to column 0, row 0 (top line)
  lcd.print("Hello,Famid!"); // Print message
  
  lcd.setCursor(0, 1);       // Move cursor to column 0, row 1 (bottom line)
  lcd.print("Arduino I2C LCD");
}

void loop() {
  // Code in the loop runs continuously (empty for static text)
}

