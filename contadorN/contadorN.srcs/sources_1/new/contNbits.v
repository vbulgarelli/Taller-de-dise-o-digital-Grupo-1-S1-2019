`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2019 21:51:56
// Design Name: 
// Module Name: contNbits
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


module contNbits(
    input clk,
    output clk2
    );
    
    reg [16:0] contdisp =0;
    reg clk2sign =0;
    always@( posedge clk )
    begin
        if (contdisp == 17'd99999)
            contdisp <=0;
            
        else  
            contdisp <= contdisp + 1;
    end
    
    always @ (contdisp)
    begin
        if (contdisp == 0)
            clk2sign=~clk2sign;
            else
             clk2sign=clk2sign;
     end
    
    assign clk2 = clk2sign;
    
endmodule


