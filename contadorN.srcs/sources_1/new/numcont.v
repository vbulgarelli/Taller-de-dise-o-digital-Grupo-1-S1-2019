`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2019 22:54:43
// Design Name: 
// Module Name: numcont
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


module numcont(
    input boton, 
    input clk, 
    input [7:0] Anodo,
    output [6:0] segs 
);

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
    4'd0: Sseg<=7'b0000001;
    4'd1: Sseg<=7'b1001111;
    4'd2: Sseg<=7'b0010010;
    4'd3: Sseg<=7'b0110000;
    4'd4: Sseg<=7'b1001100;
    4'd5: Sseg<=7'b0100100;
    4'd6: Sseg<=7'b0100000;
    4'd7: Sseg<=7'b0001111;
    4'd8: Sseg<=7'b0000000;
    4'd9: Sseg<=7'b0001100;
    endcase
    end
    
//    always @(posedge clk)
//       begin
       
//    if(Anodo == 8'b11111110) begin
//    case (a)
//    4'd0: Sseg<=7'b0000001;
//    4'd1: Sseg<=7'b1001111;
//    4'd2: Sseg<=7'b0010010;
//    4'd3: Sseg<=7'b0110000;
//    4'd4: Sseg<=7'b1001100;
//    4'd5: Sseg<=7'b0100100;
//    4'd6: Sseg<=7'b0100000;
//    4'd7: Sseg<=7'b0001111;
//    4'd8: Sseg<=7'b0000000;
//    4'd9: Sseg<=7'b0001100;
    
//    endcase
//    end
    
//    if(Anodo== 8'b11111101) begin
//    case (b)
//    4'd0: Sseg<=7'b0000001;
//    4'd1: Sseg<=7'b1001111;
//    4'd2: Sseg<=7'b0010010;
//    4'd3: Sseg<=7'b0110000;
//    4'd4: Sseg<=7'b1001100;
//    4'd5: Sseg<=7'b0100100;
//    4'd6: Sseg<=7'b0100000;
//    4'd7: Sseg<=7'b0001111;
//    4'd8: Sseg<=7'b0000000;
//    4'd9: Sseg<=7'b0001100;
    
//    endcase
//    end
    
//    else
//    Sseg<=7'b1111111;
//    end
    
assign Led = Sseg;
    
endmodule
