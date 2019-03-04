`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module segment7(
    bcd, seg
    );
    input [3:0] bcd;
    output [6:0] seg;
    reg [6:0] seg;
    always@(bcd)
    begin
        case(bcd)
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0001100;
            10 : seg = 7'b0001000;
            11 : seg = 7'b1100000;
            12 : seg = 7'b1110010;
            13 : seg = 7'b1000011;
            14 : seg = 7'b0110000;
            15 : seg = 7'b0111000;
            default : seg = 7'b1111111;
         endcase
     end     
endmodule
