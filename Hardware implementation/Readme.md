# Fault Detection and Protection System using ESP32 and ACS712

##  Project Overview
This project implements a **current-based fault detection and protection system** using an **ESP32 microcontroller**, an **ACS712 Hall-effect current sensor**, and a **single relay module**.  
The system continuously monitors load current and **disconnects the load automatically** when the current exceeds a predefined threshold, simulating **power line fault protection**.

The project is designed as a **low-voltage, safe prototype** that demonstrates the working principle of overcurrent and short-circuit protection used in real power systems.

---

##  System Components
- ESP32 Dev Module  
- ACS712 Current Sensor  
- Single-channel 5V Relay Module  
- Indicator LEDs (Green – Normal, Red – Fault)  
- Load LED (Yellow – Load status)  
- Breadboard and jumper wires  

---

##  Working Principle
1. The **ACS712 sensor** measures the current flowing through the load.
2. The sensor outputs an analog voltage proportional to current.
3. The **ESP32 ADC** continuously samples this voltage.
4. If the measured value exceeds a **calibrated threshold**, the ESP32:
   - Activates the relay (trips the load)
   - Turns ON the fault indicator (Red LED)
   - Turns OFF the normal indicator (Green LED)
5. Under normal conditions, the relay remains OFF and the load continues to operate.

# ESP32 Fault Detection Code – ACS712 Based Protection

##  Description
This Arduino sketch implements **real-time fault detection** using an **ACS712 current sensor** and controls a **relay-based load protection system** using an ESP32.

The program continuously monitors current and trips the relay when the current exceeds a predefined threshold.

---

##  Pin Configuration

| Function | ESP32 GPIO |
|--------|------------|
| ACS712 OUT | GPIO 34 |
| Relay IN (LOW-level trigger) | GPIO 26 |
| Green LED (Normal) | GPIO 18 |
| Red LED (Fault) | GPIO 19 |

---

##  Logic Flow
1. Read ADC value from ACS712
2. Compare ADC value with threshold
3. If ADC > threshold:
   - Relay ON (trip)
   - Red LED ON
   - Green LED OFF
4. Else:
   - Relay OFF
   - Green LED ON
   - Red LED OFF

---

## Threshold Selection
The threshold value is calibrated experimentally.

