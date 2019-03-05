`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2019 02:02:00
// Design Name: 
// Module Name: Main
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


module Main( input boton, input clk, output [7:0] Anodo, output [6:0] Led

    );
wire clk2;   
wire [7:0]anodo;
contNbits Frecuencia (
.clk(clk),
.clk2(clk2)
);
     
controlanodo Clk2 (
    .clk2(clk2),
    .anodo(anodo)
    );
    
numcont Contador (
    .clk(clk),
    .boton(boton),
    .Anodo(anodo),
    .segs(Led)
    );
    
assign Anodo=anodo;
endmodule
