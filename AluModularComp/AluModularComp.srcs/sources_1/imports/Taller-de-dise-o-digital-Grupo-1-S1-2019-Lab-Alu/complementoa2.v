`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 17:13:44
// Design Name: 
// Module Name: complementoa2
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


module complementoa1(
    input num,
    output aa
    );
    
    reg comp;
    
    
    always @(*)
    begin
        comp <= num;
        comp <= ~comp;
        comp <= comp + 1;
    
    end
    
    assign aa = comp;
    
endmodule
