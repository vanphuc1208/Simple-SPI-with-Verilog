`timescale 1ns / 1ps

module SPI(
input clk, start, 
input [11:0] din,
output reg cs, mosi, done
    );
 // create a slower clock rate
 integer count = 0;
 reg sclk=0;
 always@(posedge clk)
 begin
    if(count <= 10)
        begin
        count<=count+1;
        end
    else
        begin
        count<=0;
        sclk<=~sclk;
        end
 end 
 
 parameter idle=0, start_tx = 1, send = 2, end_tx = 3;
 reg [1:0] state = idle;
 reg [11:0] temp;
 integer bitcount =0;
 
 always@(posedge sclk)
 begin
 case(state)
    idle:
        begin
        cs<=1'b1;
        mosi<=1'b0;
        done<=1'b0;
        
        if(start) state <=start_tx;
        else state<=idle;
        end
    start_tx:
        begin
        cs <=1'b0;
        temp<=din;
        state<=send;
        end
   send:
        begin
        if(bitcount <= 11) begin
            mosi<=temp[bitcount];
            bitcount<=bitcount+1;
        end
        else begin
            bitcount<=0;
            state<=end_tx;
        end
        end
   end_tx:
        begin
        cs<=1'b1;
        done<=1'b1;
        mosi<=1'b0;
        state<=idle;
        end
   default: state<=idle;
   endcase
 end
endmodule
