`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2019 10:13:55
// Design Name: 
// Module Name: Comparador
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


module Comparador(
input logic [7:0] A, [7:0] B,
output logic great, eq, less
    );
    
    always@*
    begin
    great = A > B? 1:0;
    eq = A == B? 1:0;
    less = A < B? 1:0;
    end
    
    
endmodule
