`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2019 16:08:03
// Design Name: 
// Module Name: complementoa1
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
