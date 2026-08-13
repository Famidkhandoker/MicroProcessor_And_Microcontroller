# 🔐 Arduino Keypad Password Security System

A simple **Arduino Uno Password Security System** using a **4×4 Matrix Keypad** and a **16×2 I2C LCD Display**.

The user enters a password using the keypad. Arduino checks the entered password and displays either **"Access Granted"** or **"Wrong Password"** on the LCD.

---

## 📌 Project Overview

This project combines:

* 🔢 4×4 Matrix Keypad
* 📟 16×2 I2C LCD
* 🔐 Password verification
* 🤖 Arduino Uno

The default password is:

```text
1234
```

### System Flow

```text
        ┌─────────────────┐
        │  Enter Password │
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
        │   4×4 Keypad    │
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
        │ Arduino Uno     │
        │ Password Check  │
        └────────┬────────┘
                 │
          ┌──────┴──────┐
          │             │
          ▼             ▼
       Correct        Incorrect
          │             │
          ▼             ▼
 Access Granted   Wrong Password
```

---

## 🖼️ Circuit Diagram

![Arduino Keypad Password Security System](circuit-diagram.png)

> **Note:** Save the provided circuit image in your GitHub repository as `circuit-diagram.png` so it appears correctly in this README.

---

## 🛠️ Components Required

* Arduino Uno
* 4×4 Matrix Keypad
* 16×2 I2C LCD Display
* Breadboard
* Jumper Wires
* USB Cable
* Computer
* Arduino IDE

---

## 🔌 Pin Configuration

### 4×4 Keypad

| Keypad Pin | Arduino Uno |
| ---------- | ----------: |
| Row 1      |          D9 |
| Row 2      |          D8 |
| Row 3      |          D7 |
| Row 4      |          D6 |
| Column 1   |          D5 |
| Column 2   |          D4 |
| Column 3   |          D3 |
| Column 4   |          D2 |

### I2C LCD

| LCD Pin | Arduino Uno |
| ------- | ----------: |
| GND     |         GND |
| VCC     |          5V |
| SDA     |          A4 |
| SCL     |          A5 |

### Complete Connection

```text
4×4 Keypad
----------------
R1 → D9
R2 → D8
R3 → D7
R4 → D6

C1 → D5
C2 → D4
C3 → D3
C4 → D2


16×2 I2C LCD
----------------
GND → GND
VCC → 5V
SDA → A4
SCL → A5
```

---

## 🎹 Keypad Layout

```text
┌─────┬─────┬─────┬─────┐
│  1  │  2  │  3  │  A  │
├─────┼─────┼─────┼─────┤
│  4  │  5  │  6  │  B  │
├─────┼─────┼─────┼─────┤
│  7  │  8  │  9  │  C  │
├─────┼─────┼─────┼─────┤
│  *  │  0  │  #  │  D  │
└─────┴─────┴─────┴─────┘
```

### Key Functions

| Key   | Function                       |
| ----- | ------------------------------ |
| `0–9` | Enter password digits          |
| `#`   | Submit password                |
| `*`   | Clear entered password         |
| `A–D` | Available for future functions |

---

## 🔐 Default Password

The default password in the program is:

```cpp
String password = "1234";
```

Therefore, enter:

```text
1 → 2 → 3 → 4 → #
```

to access the system.

---

## 📦 Required Libraries

This project requires:

### LiquidCrystal_I2C

```cpp
#include <LiquidCrystal_I2C.h>
```

### Keypad

```cpp
#include <Keypad.h>
```

### Install Libraries

In Arduino IDE:

```text
Sketch
   ↓
Include Library
   ↓
Manage Libraries
```

Search and install:

```text
LiquidCrystal I2C
```

and:

```text
Keypad
```

---

## 💻 Source Code

```cpp
#include <LiquidCrystal_I2C.h> 
#include <Keypad.h> 
 
const byte ROWS = 4; // four rows 
const byte COLS = 4; // four columns 

char keys[ROWS][COLS] = { 
  {'1','2','3','A'}, 
  {'4','5','6','B'}, 
  {'7','8','9','C'}, 
  {'*','0','#','D'} 
}; 

byte rowPins[ROWS] = {9,8,7,6}; 
byte colPins[COLS] = {5,4,3,2}; 

Keypad keypad = Keypad(
  makeKeymap(keys), 
  rowPins, 
  colPins, 
  ROWS,
  COLS
); 
 
LiquidCrystal_I2C lcd(0x27, 16, 2); 
 
String password = "1234"; 
String inputPassword = ""; 
 
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
```

---

## ⚙️ How It Works

### 1. Initialize Keypad

The program defines a 4×4 keypad:

```cpp
const byte ROWS = 4;
const byte COLS = 4;
```

The keypad contains:

```text
4 × 4 = 16 Keys
```

---

### 2. Initialize LCD

```cpp
LiquidCrystal_I2C lcd(0x27, 16, 2);
```

Here:

* `0x27` → I2C LCD address
* `16` → LCD columns
* `2` → LCD rows

---

### 3. Set Password

The password is stored in:

```cpp
String password = "1234";
```

The currently entered password is stored in:

```cpp
String inputPassword = "";
```

---

### 4. Display Password Prompt

When the Arduino starts:

```cpp
lcd.print("Enter Password:");
```

The LCD displays:

```text
┌────────────────┐
│ Enter Password:│
│                │
└────────────────┘
```

---

### 5. Read Keypad Input

The program checks for a key press:

```cpp
char key = keypad.getKey();
```

When a key is pressed, it is processed by the program.

---

### 6. Enter Password

If the user presses a number:

```cpp
inputPassword += key;
```

The entered value is added to the password string.

For example:

```text
1 → 2 → 3 → 4
```

results in:

```text
inputPassword = "1234"
```

---

### 7. Submit Password

The `#` key is used to submit the password:

```cpp
if (key == '#')
```

Arduino compares:

```text
inputPassword
```

with:

```text
password
```

---

## ✅ Correct Password

If the entered password matches:

```text
1234
```

the LCD displays:

```text
┌────────────────┐
│ Access Granted │
│                │
└────────────────┘
```

After a short delay, the system returns to:

```text
Enter Password:
```

---

## ❌ Wrong Password

If the entered password is incorrect, the LCD displays:

```text
┌────────────────┐
│ Wrong Password │
│                │
└────────────────┘
```

After a delay, the system returns to:

```text
Enter Password:
```

---

## ⭐ Clear Password

Pressing:

```text
*
```

clears the currently entered password.

For example:

```text
1 → 2 → 5 → *
```

will clear:

```text
125
```

and return to:

```text
Enter Password:
```

---

## 📟 Expected Output

### Initial Screen

```text
┌────────────────┐
│ Enter Password:│
│                │
└────────────────┘
```

### Password Entry

```text
┌────────────────┐
│ Enter Password:│
│ 1234           │
└────────────────┘
```

### Correct Password

```text
┌────────────────┐
│ Access Granted │
│                │
└────────────────┘
```

### Incorrect Password

```text
┌────────────────┐
│ Wrong Password │
│                │
└────────────────┘
```

---

## 🚀 How to Run the Project

### Step 1 — Install Arduino IDE

Install Arduino IDE on your computer.

### Step 2 — Install Libraries

Install:

```text
Keypad
LiquidCrystal I2C
```

### Step 3 — Connect Keypad

Connect the keypad:

```text
R1 → D9
R2 → D8
R3 → D7
R4 → D6

C1 → D5
C2 → D4
C3 → D3
C4 → D2
```

### Step 4 — Connect LCD

Connect the I2C LCD:

```text
GND → GND
VCC → 5V
SDA → A4
SCL → A5
```

### Step 5 — Open Code

Open:

```text
keypad_password.ino
```

### Step 6 — Select Arduino Uno

Go to:

```text
Tools → Board → Arduino Uno
```

### Step 7 — Select COM Port

Go to:

```text
Tools → Port
```

Select the Arduino COM port.

### Step 8 — Upload

Click **Upload**.

### Step 9 — Test

Enter:

```text
1234#
```

The LCD should display:

```text
Access Granted
```

Try another password such as:

```text
5678#
```

The LCD should display:

```text
Wrong Password
```

---

## 🧪 Tinkercad Simulation

This project can be recreated and tested using **Tinkercad Circuits**.

The simulation allows you to test:

* Arduino Uno
* 4×4 Matrix Keypad
* I2C LCD
* Password verification
* Keypad input
* LCD output

---

## 🧩 System Architecture

```text
             ┌──────────────────┐
             │   4×4 Keypad     │
             │                  │
             │ 1 2 3 A          │
             │ 4 5 6 B          │
             │ 7 8 9 C          │
             │ * 0 # D          │
             └────────┬─────────┘
                      │
                      │ Digital Pins
                      ▼
             ┌──────────────────┐
             │   Arduino Uno    │
             │                  │
             │ Password Check   │
             └────────┬─────────┘
                      │
                      │ I2C
                      ▼
             ┌──────────────────┐
             │    16×2 LCD      │
             │                  │
             │ Access Granted   │
             │ Wrong Password   │
             └──────────────────┘
```

---

## 📁 Project Structure

```text
Arduino-Keypad-Password/
│
├── README.md
├── keypad_password.ino
└── circuit-diagram.png
```

### Important

Save your circuit image in the repository as:

```text
circuit-diagram.png
```

The README uses:

```markdown
![Arduino Keypad Password Security System](circuit-diagram.png)
```

So the image will appear automatically when the repository is viewed on GitHub.

---

## 🎯 Learning Objectives

This project helps you learn:

* Arduino Uno programming
* 4×4 Matrix Keypad
* I2C LCD
* Password verification
* String handling
* Conditional statements
* `if-else`
* `keypad.getKey()`
* `lcd.print()`
* `lcd.clear()`
* I2C communication
* User input handling
* Embedded systems fundamentals

---

## 🔮 Future Improvements

This basic password system can be upgraded with:

* 🔒 Servo motor door lock
* 🚪 Automatic door opening
* 🔊 Buzzer alarm
* 💡 LED status indicators
* 🔢 Password change option
* 🔐 Multiple passwords
* ⛔ Maximum failed-attempt limit
* ⏱️ Lockout timer
* 📲 IoT notifications
* 🗄️ Password storage using EEPROM
* 🪪 RFID + Password authentication
* 👆 Fingerprint + Password authentication

---

## 🧰 Technologies Used

| Technology        | Purpose                 |
| ----------------- | ----------------------- |
| Arduino Uno       | Microcontroller         |
| C/C++             | Programming Language    |
| 4×4 Keypad        | User Input              |
| 16×2 I2C LCD      | Display                 |
| Keypad Library    | Keypad Control          |
| LiquidCrystal_I2C | LCD Control             |
| I2C               | Communication Protocol  |
| Arduino IDE       | Development Environment |
| Tinkercad         | Circuit Simulation      |

---

## 🔐 Security Note

This is an **educational Arduino project**. The password is hard-coded in the source code:

```cpp
String password = "1234";
```

For a real security system, the password should not be stored this way. A more secure implementation could use **EEPROM, encrypted storage, access control, attempt limits, and physical security mechanisms**.

---

## 👨‍💻 Author

**Famid Khandoker**

BSc in Computer Science & Engineering

---

## ⭐ Support

If you find this project useful, please consider giving the repository a ⭐ on GitHub.

**Happy Coding! 🚀**

