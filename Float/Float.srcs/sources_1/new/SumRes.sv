`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2019 22:52:35
// Design Name: 
// Module Name: Sumres
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

module Sumres(
input logic [22:0] A,[22:0] B,
input opSel,
output [22:0] y,
output overflow, neg);

wire [23:0] out;

assign out = (1-opSel)*(A + B) + (A - B)*opSel;

assign overflow = out[23];
assign y = out[22:0];

endmodule
