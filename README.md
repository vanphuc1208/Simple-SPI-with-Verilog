# Simple SPI with Verilog

## General Information:
- Goal: design, validate, and synthesize a simple SPI protocol. It would miss some characteristics.

## About the Project layout:
- UART.v: implement the sPI.
- UARTb.v: validate the operation of SPI using waveform.

## About the Operation:
***Input**
- clk: clock signal from the board.
- start (active high input): sign that the data is ready to transmit.
- din: the data to transmit.
***Output**
- cs: when we begin to transmit data, this signal active low.
- mosi: receive sequently single bit data.
- done: sign to completed reveiving
We also generate the slower clock rate to ensure that there is no missed data in transmittion
 ## Waveform:
![image](https://github.com/vanphuc1208/Simple-SPI-with-Verilog/assets/116254695/60ae6c4d-50e7-4bb7-ac6d-f190a08f83f1)



