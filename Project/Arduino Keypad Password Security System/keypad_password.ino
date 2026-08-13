#include <LiquidCrystal_I2C.h>
#include <Keypad.h>

const byte ROWS = 4; //four rows
const byte COLS = 4; //four columns
char keys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};
byte rowPins[ROWS] = {9,8,7,6}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {5,4,3,2};
Keypad keypad = Keypad( makeKeymap(keys), rowPins, colPins, ROWS,COLS );

LiquidCrystal_I2C lcd(0x27, 16, 2);

String password="1234";
String inputPassword="";

void setup() {
  lcd.init();
  lcd.backlight();

  lcd.setCursor(0, 0);
  lcd.print("Enter Password:");
}

void loop() {
 
  char key = keypad.getKey();
if (key) {
    if (key == '#') {
      if (inputPassword == password) {
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("Access Granted");
        delay(500);
        delay(2000);
        lcd.clear();
        lcd.print("Enter Password:");
      } else {
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("Wrong Password");
   
        delay(1000);
     
        delay(2000);
        lcd.clear();
        lcd.print("Enter Password:");
      }
      inputPassword = "";
    } else if (key == '*') {
      inputPassword = "";
      lcd.clear();
      lcd.print("Enter Password:");
    } else {
      inputPassword += key;
      lcd.setCursor(0, 1);
      lcd.print(inputPassword);
    }
  }
 
}

