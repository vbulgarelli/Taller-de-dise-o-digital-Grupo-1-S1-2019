`timescale 1ns / 1ps
module Clock_divider(clock_in,clock_out);
input logic clock_in; 
output logic clock_out; 
reg[27:0] counter = 28'd0;
parameter DIVISOR = 28'd100000000;

always @(posedge clock_in)
begin
 counter <= counter + 28'd1;
 if(counter >= (DIVISOR-1))
  counter <= 28'd0;
end
assign clock_out = (counter<DIVISOR/2)?1'b0:1'b1;
endmodule