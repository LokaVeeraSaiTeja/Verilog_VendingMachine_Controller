# Project Overview

## Introduction

The Vending Machine Controller is a Finite State Machine (FSM) based digital system designed using Verilog HDL. The controller simulates the operation of a real vending machine capable of dispensing multiple products using either coin payment or online payment.

The design has been implemented using behavioral Verilog and verified through simulation in Xilinx Vivado.

---

## Features

- Four selectable products
  - Coke (₹20)
  - Pepsi (₹15)
  - Water Bottle (₹10)
  - Coffee (₹25)

- Two payment methods
  - Coin Payment
  - Online Payment

- Coin denominations
  - ₹5
  - ₹10

- Cancel transaction support

- Automatic change return

- Product dispensing after successful payment

- FSM-based controller implementation

---

## Design Methodology

The controller is implemented using a Moore Finite State Machine consisting of seven states.

1. Initial State
2. Product Selection State
3. Coke Selection State
4. Pepsi Selection State
5. Water Selection State
6. Coffee Selection State
7. Dispense/Return State

The machine waits for the user to press the Start button, accepts product selection, receives payment, verifies the payment amount, dispenses the selected product, returns any excess amount, and returns to the initial state.

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- XSim Simulator
- Git & GitHub

---

## Learning Outcomes

This project helped in understanding:

- Finite State Machine (FSM) Design
- Sequential Logic Design
- Combinational Logic
- Verilog HDL
- Testbench Development
- RTL Simulation
- Digital System Verification
- GitHub Project Documentation