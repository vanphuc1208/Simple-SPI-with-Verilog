`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2024 09:45:36 AM
// Design Name: 
// Module Name: SPITb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPITb();
reg clk=0;
reg start=0;
reg[11:0] din;
wire cs,mosi,done;
integer i=0;

SPI dut(clk, start, din, cs, mosi, done);
always #5 clk=~clk;
initial begin
start =1'b1;
for (i =0 ; i< 10;i = i + 1 )
    begin
    din=$urandom_range(10,200);
    @(posedge done);
    end
end
endmodule
