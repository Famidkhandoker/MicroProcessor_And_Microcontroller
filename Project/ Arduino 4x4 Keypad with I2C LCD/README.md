# ⌨️ Arduino 4x4 Keypad with I2C LCD

A simple **Arduino Uno 4x4 Matrix Keypad and 16x2 I2C LCD** project. This project reads the key pressed on the keypad and displays the pressed key on the LCD screen.

The LCD automatically moves the cursor from left to right, then moves to the second row. When both rows are full, the LCD automatically clears and starts displaying from the beginning.

---

## 📌 Project Overview

This project demonstrates how to:

- Connect a 4x4 Matrix Keypad with Arduino Uno
- Read keypad button presses
- Display keypad input on a 16x2 I2C LCD
- Use I2C communication
- Use the `Keypad` library
- Use the `LiquidCrystal_I2C` library
- Control LCD cursor position
- Automatically move between LCD rows
- Automatically clear the LCD when the display is full

---

## 🖼️ Circuit Diagram

![Arduino 4x4 Keypad with I2C LCD](circuit-diagram.png)

> **Note:** Save the circuit image in your GitHub repository as `circuit-diagram.png` so that it appears correctly in this README.

---

## 🛠️ Components Required

- Arduino Uno
- 4x4 Matrix Keypad
- 16x2 I2C LCD
- Breadboard
- Jumper Wires
- USB Cable
- Computer
- Arduino IDE

---

## 🔌 Pin Configuration

### 4x4 Keypad

| Keypad Pin | Arduino Uno |
|---|---:|
| Row 1 | D9 |
| Row 2 | D8 |
| Row 3 | D7 |
| Row 4 | D6 |
| Column 1 | D5 |
| Column 2 | D4 |
| Column 3 | D3 |
| Column 4 | D2 |

### I2C LCD

| LCD Pin | Arduino Uno |
|---|---:|
| GND | GND |
| VCC | 5V |
| SDA | A4 |
| SCL | A5 |

### Complete Connection

```text
4x4 Keypad
----------------
R1 → D9
R2 → D8
R3 → D7
R4 → D6

C1 → D5
C2 → D4
C3 → D3
C4 → D2


I2C LCD
----------------
GND → GND
VCC → 5V
SDA → A4
SCL → A5
```

---

## ⌨️ Keypad Layout

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

---

## 📺 LCD Configuration

This project uses a:

```text
16 × 2 I2C LCD
```

The LCD address used in the code is:

```text
0x27
```

Arduino Uno I2C pins:

```text
SDA → A4
SCL → A5
```

> If `0x27` does not work, the LCD may have a different I2C address.

---

## 📦 Required Libraries

Install the following libraries from the Arduino IDE Library Manager.

### Keypad Library

```cpp
#include <Keypad.h>
```

### Wire Library

```cpp
#include <Wire.h>
```

### LiquidCrystal I2C Library

```cpp
#include <LiquidCrystal_I2C.h>
```

---

## 💻 Source Code

```cpp
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
byte rowPins[ROWS] = {9, 8, 7, 6};
byte colPins[COLS] = {5, 4, 3, 2};

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
```

---

## ⚙️ How the Code Works

### 1. Include Libraries

```cpp
#include <Keypad.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
```

These libraries are used for:

- Keypad input
- I2C communication
- LCD control

---

### 2. Initialize LCD

```cpp
LiquidCrystal_I2C lcd(0x27, 16, 2);
```

This creates a 16x2 LCD object with the I2C address:

```text
0x27
```

---

### 3. Define Keypad Size

```cpp
const byte ROWS = 4;
const byte COLS = 4;
```

The keypad contains:

```text
4 Rows
4 Columns
```

Therefore:

```text
4 × 4 = 16 Keys
```

---

### 4. Define Keypad Layout

```cpp
char keys[ROWS][COLS] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};
```

This defines the character assigned to every keypad button.

---

### 5. Define Keypad Pins

```cpp
byte rowPins[ROWS] = {9, 8, 7, 6};
byte colPins[COLS] = {5, 4, 3, 2};
```

Rows:

```text
D9, D8, D7, D6
```

Columns:

```text
D5, D4, D3, D2
```

---

### 6. Create Keypad Object

```cpp
Keypad keypad = Keypad(
  makeKeymap(keys),
  rowPins,
  colPins,
  ROWS,
  COLS
);
```

This creates the keypad object using the defined key layout and pins.

---

### 7. Initialize LCD

Inside `setup()`:

```cpp
lcd.init();
lcd.backlight();
lcd.clear();
```

These commands:

- Initialize the LCD
- Turn on the LCD backlight
- Clear the LCD display

---

### 8. Read Key Press

The program continuously checks the keypad:

```cpp
char key = keypad.getKey();
```

If a key is pressed:

```cpp
if (key) {
```

the pressed key is stored in the `key` variable.

---

### 9. Display Key

The key is displayed on the LCD:

```cpp
lcd.setCursor(col, row);
lcd.print(key);
```

The `col` and `row` variables determine the cursor position.

---

### 10. Move Cursor

After displaying a key:

```cpp
col++;
```

moves the cursor one column to the right.

When the first row becomes full:

```cpp
if (col >= 16) {
  col = 0;
  row++;
}
```

the cursor moves to the second row.

---

### 11. Clear LCD

When both rows are full:

```cpp
if (row >= 2) {
  row = 0;
  lcd.clear();
}
```

the LCD is cleared and the cursor starts again from the first position.

---

## 📊 Example Output

If you press:

```text
1 2 3 A 4 5 6 B
```

The LCD will display:

```text
123A456B
```

If you continue pressing keys:

```text
123A456B789C012D
*0987654321
```

After both rows become full, the LCD automatically clears.

---

## 🚀 How to Run the Project

### Step 1 — Install Arduino IDE

Install Arduino IDE on your computer.

### Step 2 — Install Required Libraries

Open:

```text
Sketch → Include Library → Manage Libraries
```

Search and install:

```text
Keypad
```

and:

```text
LiquidCrystal I2C
```

---

### Step 3 — Connect the Keypad

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

---

### Step 4 — Connect the I2C LCD

```text
GND → GND
VCC → 5V
SDA → A4
SCL → A5
```

---

### Step 5 — Open the Code

Open:

```text
keypad_lcd.ino
```

---

### Step 6 — Select Board

Go to:

```text
Tools → Board → Arduino Uno
```

---

### Step 7 — Select COM Port

Go to:

```text
Tools → Port
```

Select the correct Arduino COM port.

---

### Step 8 — Upload

Click the **Upload** button.

After uploading, press any key on the keypad.

The pressed key will appear on the LCD.

---

## 🧪 Tinkercad Simulation

This project can also be simulated using **Tinkercad Circuits**.

### Required Components

- Arduino Uno
- 4x4 Matrix Keypad
- 16x2 I2C LCD
- Jumper Wires

Connect all components according to the pin configuration mentioned above.

Start the simulation and press the keypad buttons.

The pressed key will appear on the LCD.

---

## 📁 Project Structure

```text
Arduino-Keypad-I2C-LCD/
│
├── README.md
├── keypad_lcd.ino
└── circuit-diagram.png
```

---

## 🎯 Learning Objectives

This project helps you understand:

- Arduino Uno
- 4x4 Matrix Keypad
- 16x2 LCD
- I2C Communication
- Matrix Keypad
- Keypad Input
- LCD Output
- Cursor Positioning
- Arduino Digital Pins
- `Keypad.h`
- `Wire.h`
- `LiquidCrystal_I2C.h`
- Embedded Systems Fundamentals

---

## 🔮 Future Improvements

This project can be upgraded into:

- 🔐 Password-Based Door Lock
- 🧮 Arduino Calculator
- 🏧 ATM Simulation
- 🚪 Smart Door Lock
- 🔢 Digital Number Entry System
- 📋 LCD Menu Navigation
- 🏠 Home Automation Controller
- ⏰ Digital Clock
- 🔒 Security System
- 🎛️ Keypad-Based Control System

---

## 🧰 Technologies Used

| Technology | Purpose |
|---|---|
| Arduino Uno | Microcontroller |
| C/C++ | Programming Language |
| 4x4 Matrix Keypad | User Input |
| 16x2 I2C LCD | Display |
| Keypad Library | Keypad Control |
| LiquidCrystal_I2C | LCD Control |
| Wire Library | I2C Communication |
| Arduino IDE | Development Environment |
| Tinkercad | Circuit Simulation |

---

## ⚠️ Important Notes

- Make sure the keypad row and column wiring matches the code.
- The LCD I2C address is set to `0x27`.
- If the LCD does not work, check its I2C address.
- Connect SDA to **A4** on Arduino Uno.
- Connect SCL to **A5** on Arduino Uno.
- Connect LCD VCC to **5V**.
- Connect LCD GND to **GND**.
- Make sure all connections are secure.
- The LCD automatically clears after both rows are filled.

---

## 📝 Features

- ✅ 4x4 Keypad Input
- ✅ 16x2 LCD Output
- ✅ I2C Communication
- ✅ Automatic Cursor Movement
- ✅ Automatic Row Change
- ✅ Automatic LCD Clearing
- ✅ Simple and Easy to Understand
- ✅ Suitable for Arduino Beginners
- ✅ Tinkercad Simulation Compatible

---

## 📚 Applications

This project can be used as the basic input system for:

- Security Systems
- Password Systems
- Smart Door Locks
- ATM Systems
- Calculator Projects
- Home Automation
- Access Control Systems
- Menu-Based Arduino Projects

---

## 👨‍💻 Author

**Famid Khandoker**

BSc in Computer Science & Engineering

### 🔗 GitHub

**Famid Khandoker**

---

## ⭐ Support

If you find this project useful, please consider giving the repository a ⭐ on GitHub.

If you have any suggestions or improvements, feel free to contribute to the project.

---

## 📄 License

This project is open-source and available for educational and learning purposes.

---

## 🙏 Acknowledgement

Thanks to the Arduino community and open-source libraries that make embedded system development easier and more accessible.

---

## ❤️ Final Note

This project is created for learning **Arduino, Embedded Systems, Keypad Interfacing, and I2C LCD Communication**.

**Happy Coding! ⌨️📟🚀**
