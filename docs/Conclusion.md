# Conclusion

The **Vending Machine Controller** was successfully designed and implemented using **Verilog HDL** by applying the principles of **Finite State Machine (FSM)** design. The project demonstrates how sequential digital logic can be used to model and control the operation of a real-world vending machine.

The controller supports multiple products with different prices and provides two payment methods: **coin payment (₹5 and ₹10)** and **online payment**. It also includes practical features such as **transaction cancellation**, **automatic change return**, and **product dispensing**, making the system functionally similar to a commercial vending machine.

The design was verified through **behavioral simulation in Xilinx Vivado**, where various test scenarios—including exact payment, overpayment, insufficient funds, online payment, and transaction cancellation—were successfully tested. The simulation results confirmed that the controller behaves correctly under all supported operating conditions.

## Key Achievements

- Designed a Moore FSM-based vending machine controller.
- Implemented support for four different products with individual pricing.
- Supported both coin and online payment methods.
- Implemented automatic change calculation and return.
- Added transaction cancellation functionality.
- Developed a comprehensive Verilog testbench for verification.
- Successfully simulated and validated the design using Xilinx Vivado.

## Learning Outcomes

This project strengthened practical knowledge in:

- Verilog HDL programming
- Finite State Machine (FSM) design
- Sequential logic design
- RTL modeling
- Testbench development
- Behavioral simulation and debugging
- FPGA design workflow using Xilinx Vivado
- Git and GitHub project documentation

## Future Enhancements

The current implementation can be extended with additional features such as:

- LCD display for user interaction
- Seven-segment display for price and balance
- Multiple coin and currency denominations
- Inventory management for products
- Password-protected maintenance mode
- FPGA hardware implementation and validation
- Touchscreen or keypad-based user interface
- IoT-based remote monitoring and payment integration

Overall, this project provides a strong foundation for understanding **digital system design using Verilog HDL** and demonstrates the practical application of **Finite State Machines** in implementing embedded control systems.