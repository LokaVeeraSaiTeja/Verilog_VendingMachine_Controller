# Waveform

The simulation waveform is provided as a Vivado Waveform Configuration file.

File:

waveforms/tb_Vending_Machine_behav.wdb

## How to View

1. Open Xilinx Vivado.
2. Open the Vending Machine project.
3. Run **Behavioral Simulation**.
4. Open the waveform configuration:
   - File → Open Waveform Configuration
   - Select `waveforms/tb_Vending_Machine_behav.wdb`

The waveform includes:

- Clock
- Reset
- Start
- Cancel
- Product Code
- Coin Inputs
- Online Payment
- FSM State
- Product Price
- Return Change
- Dispense Signal

## Test Cases Included

- Reset Operation
- Coke Purchase (Online Payment)
- Pepsi Cancel Transaction
- Water Bottle Return Change
- Coffee Coin Payment
- Coffee Insufficient Funds

The waveform configuration is intended for use with Vivado XSim.