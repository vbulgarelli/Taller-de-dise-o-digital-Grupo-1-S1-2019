`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2019 22:41:40
// Design Name: 
// Module Name: controlanodo
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


module controlanodo(
    input clk2,
    output wire [7:0] anodo
    );
    reg [7:0] an = 8'b11111110;
//    reg [7:0] an = 8'b11111111;
//    always @ (posedge clk2)
//    begin
//        case(an)
//                8'b11111111: an <= 8'b11111110;
//                8'b11111110: an <= 8'b11111101;
//                8'b11111101: an <= 8'b11111011;
//                8'b11111011: an <= 8'b11110111;
//                8'b11110111: an <= 8'b11101111;
//                8'b11101111: an <= 8'b11011111;
//                8'b11011111: an <= 8'b10111111;
//                8'b10111111: an <= 8'b01111111;
//                8'b01111111: an <= 8'b11111110;
//        endcase
   
   assign anodo = an;
   
endmodule
