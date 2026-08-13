# 🔢 Arduino 4x4 Matrix Keypad

A simple **Arduino Uno 4×4 Matrix Keypad** project using the Arduino **Keypad Library**. The project detects which key is pressed and displays the pressed key in the **Serial Monitor**.

The keypad contains **16 keys**:

**0–9, A–D, `*`, `#`**

---

## 📌 Project Overview

This project demonstrates how to connect a **4×4 Matrix Keypad** to an **Arduino Uno** and read user input.

Whenever a key is pressed, Arduino detects the key and prints its value to the Serial Monitor.

### Example

If you press:

```text
1
5
A
#
0
```

The Serial Monitor will display:

```text
1
5
A
#
0
```

---

## 🛠️ Components Required

* Arduino Uno
* 4×4 Matrix Keypad
* Jumper Wires
* USB Cable
* Computer
* Arduino IDE
* Keypad Library

---

## 🔌 Pin Configuration

The keypad has **8 pins**:

* 4 Row pins
* 4 Column pins

### Row Pins

| Keypad Row | Arduino Pin |
| ---------- | ----------: |
| Row 1      |           9 |
| Row 2      |           8 |
| Row 3      |           7 |
| Row 4      |           6 |

### Column Pins

| Keypad Column | Arduino Pin |
| ------------- | ----------: |
| Column 1      |           5 |
| Column 2      |           4 |
| Column 3      |           3 |
| Column 4      |           2 |

### Complete Connection

```text
Keypad          Arduino Uno
---------------------------
Row 1    →      D9
Row 2    →      D8
Row 3    →      D7
Row 4    →      D6

Column 1 →      D5
Column 2 →      D4
Column 3 →      D3
Column 4 →      D2
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

---

## 📦 Required Library

This project uses the **Keypad** library.

In Arduino IDE:

```text
Sketch
   ↓
Include Library
   ↓
Manage Libraries
   ↓
Search: Keypad
   ↓
Install Keypad
```

Then include the library in your code:

```cpp
#include <Keypad.h>
```

---

## 💻 Source Code

```cpp
#include <Keypad.h>

const byte ROWS = 4;
const byte COLS = 4;

char keys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};

byte rowPins[ROWS] = {9, 8, 7, 6};
byte colPins[COLS] = {5, 4, 3, 2};

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

void setup() {
  Serial.begin(9600);
}

void loop() {
  char key = keypad.getKey();

  if (key) {
    Serial.println(key);
  }
}
```

---

## ⚙️ How It Works

### 1. Include Keypad Library

```cpp
#include <Keypad.h>
```

The library provides functions for detecting key presses from a matrix keypad.

### 2. Define Rows and Columns

```cpp
const byte ROWS = 4;
const byte COLS = 4;
```

The keypad contains **4 rows and 4 columns**, giving:

```text
4 × 4 = 16 keys
```

### 3. Define Key Layout

```cpp
char keys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};
```

This tells Arduino which character corresponds to each keypad position.

### 4. Assign Arduino Pins

```cpp
byte rowPins[ROWS] = {9, 8, 7, 6};
byte colPins[COLS] = {5, 4, 3, 2};
```

These pins connect the keypad rows and columns to the Arduino.

### 5. Detect Key Press

```cpp
char key = keypad.getKey();
```

This checks whether a key has been pressed.

If a key is pressed:

```cpp
if (key) {
  Serial.println(key);
}
```

The pressed key is printed to the Serial Monitor.

---

## 🖥️ Serial Monitor Output

Set the Serial Monitor baud rate to:

```text
9600
```

For example, if you press:

```text
1 → 2 → 3 → A → 5 → # → 0
```

The Serial Monitor will show:

```text
1
2
3
A
5
#
0
```

---

## 📁 Project Structure

```text
Arduino-4x4-Keypad/
│
├── README.md
├── keypad.ino
└── circuit-diagram.png
```

---

## 🚀 How to Run

1. Install **Arduino IDE**.
2. Install the **Keypad** library.
3. Connect the 4×4 keypad to Arduino Uno according to the pin configuration.
4. Open `keypad.ino`.
5. Select:

```text
Tools → Board → Arduino Uno
```

6. Select the correct COM port.
7. Upload the code.
8. Open **Serial Monitor**.
9. Set baud rate to **9600**.
10. Press any key on the keypad.

The pressed key will appear in the Serial Monitor.

---

## 🧪 Simulation

This project can also be simulated using **Tinkercad Circuits**.

Simulation is useful for testing the keypad connections and Arduino code before building the physical circuit.

---

## 🎯 Learning Objectives

This project helps you understand:

* Arduino Uno
* 4×4 Matrix Keypad
* Row and column scanning
* Arduino digital pins
* Keypad Library
* `keypad.getKey()`
* Serial Communication
* `Serial.begin()`
* `Serial.println()`
* Embedded systems fundamentals

---

## 🔮 Possible Improvements

You can extend this project by adding:

* 🔐 Password-based door lock
* 🧮 Calculator
* 🔢 Digital counter
* 🔑 Security system
* 📟 LCD display
* 🚪 Servo motor door lock
* 💡 LED control
* 🔊 Buzzer alerts

---

## 👨‍💻 Author

**Famid Khandoker**

BSc in Computer Science & Engineering

---

## ⭐ Support

If you find this project useful, consider giving the repository a ⭐ on GitHub.

**Happy Coding! 🚀**

