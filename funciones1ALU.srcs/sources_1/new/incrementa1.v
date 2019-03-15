`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 17:29:20
// Design Name: 
// Module Name: incrementa1
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


module incrementa1(
    input A, B, Ci, flag,
    output Co, O
    );
    
    wire a0, a1, a2, num;
    
    muxflagin1 mux1(
        .A (A),
        .B (B),
        .flag (flag),
        .num (num)    
    );
    
    xor u0(a0,num,1);
    and u1(a1,num,1);
    
    and u2(a2,a0,Ci);
    
    or u3(Co, a1, a2);
    
    xor u4 (O, a0, Ci);
    
endmodule
