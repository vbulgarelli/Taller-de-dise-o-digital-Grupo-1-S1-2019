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


module Main(  
input clk, 
input boton,
input reset,
output [7:0] Anodo, 
output [6:0] Led
    );
wire clk2;   
wire [7:0]anodo;
wire [6:0]seg;

//contNbits Frecuencia (
//.clk(clk),
//.clk2(clk2)
//);
     
//controlanodo ClkA (
//    .clk2(clk),
//    .anodo(anodo)
//    );
    
//numcont Contador (
//    .clk(clk2),
//    .boton(boton),
//    .Anodo(anodo),
//    .segs(Led)
//    );
    
//    assign Anodo=anodo;
//    assign Led=seg;

    parameter N=3;
    reg [3:0] a=0;
    reg [3:0] b=0;
    
    reg [6:0] Sseg =0;
    always @(posedge boton)
    begin
    if((((2**N)-1)==63 && a==4'd3 && b==4'd6) || (((2**N)-1)==31 && a==4'd1 && b==4'd3) || (((2**N)-1)==15 && a==4'd5 && b==4'd1) || (((2**N)-1)==7 && a==4'd7 && b==4'd0) || (((2**N)-1)==3 && a==4'd3 && b==4'd0) || (((2**N)-1)==1 && a==4'd1 && b==4'd0))
    begin
    a<=0;
    b<=0;
    end
    if(b== 4'd9 && a == 4'd9)
    begin
    b<=0;
    a<=0;
    end
    
    if (a== 4'd9) begin
    a<=0;
    b<=b+1;
    end

    else begin
    a<=a+1;
    end
    end
    always @ (posedge boton)
    begin
    case(a)
    4'd0: Sseg<=7'b1000000;
    4'd1: Sseg<=7'b1111001;
    4'd2: Sseg<=7'b0100100;
    4'd3: Sseg<=7'b0000110;
    4'd4: Sseg<=7'b0011001;
    4'd5: Sseg<=7'b0010010;
    4'd6: Sseg<=7'b0000010;
    4'd7: Sseg<=7'b1111000;
    4'd8: Sseg<=7'b0000000;
    4'd9: Sseg<=7'b0011000;
    endcase
    end
    
reg [7:0] an = 8'b11111110;
assign Anodo = an;
assign Led = Sseg;

endmodule
