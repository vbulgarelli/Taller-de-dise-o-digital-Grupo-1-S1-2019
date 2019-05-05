`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2019 10:46:24
// Design Name: 
// Module Name: Shifter
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


module Shifter(
input logic eq, great, less,
input logic [7:0] exA, [7:0] exB,
input logic [22:0] manA, [22:0] manB,
output logic [22:0] shiftManA, [22:0] shiftManB
);


wire [7:0] maxshift;

assign maxshift = great == 1? (exA-127):0;
assign maxshift = eq == 1? (exA-127):(exA-127);
assign maxshift = less == 1? (exB-127):(exA-127);

assign shiftManA = manA >> (23-maxshift);
assign shiftManB = manB >> (23-maxshift);
       
endmodule
