`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2019 16:11:44
// Design Name: 
// Module Name: sumador
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


module sumador(A, B, Ci,O, Co);

input A,B,Ci;
output O,Co;

assign O = A^B^Ci;
assign Co = (B&Ci)|(A&B)|(A&Ci);

endmodule
