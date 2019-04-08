`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 17:59:20
// Design Name: 
// Module Name: muxflagin1
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


module muxflagin1(
    input A, B, flag,
    output num
    );
    wire nflag;
    wire a0, a1, a2;
    
    assign nflag = ~flag;
    
    and u0(a0, A, flag);
    and u1(a1, B, nflag);
    or u3(a2, a0, a1);
    
    assign num = a2;
    
endmodule
