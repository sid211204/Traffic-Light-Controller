# Traffic Light Controller using Verilog HDL

## Overview

This project implements a four-way Traffic Light Controller using a Finite State Machine (FSM) in Verilog HDL.

The controller manages traffic signals for the North, West, South, and East directions using timed state transitions.

---

## Features

- Finite State Machine (FSM)
- Four-way traffic control
- Red, Yellow, Green signals
- Clock-driven state transitions
- Reset functionality
- Sequential logic implementation

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | System Clock |
| rst | Reset Signal |

---

## Outputs

| Signal | Description |
|---------|-------------|
| north_light | North Traffic Light |
| west_light | West Traffic Light |
| south_light | South Traffic Light |
| east_light | East Traffic Light |

---

## State Sequence

North Green
↓
North Yellow
↓
West Green
↓
West Yellow
↓
South Green
↓
South Yellow
↓
East Green
↓
East Yellow
↓
Repeat

---

## Light Encoding

| Value | Meaning |
|--------|---------|
|001|Green|
|010|Yellow|
|100|Red|

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- GitHub

---

