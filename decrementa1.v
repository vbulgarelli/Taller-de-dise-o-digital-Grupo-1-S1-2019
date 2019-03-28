`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2019 11:48:39
// Design Name: 
// Module Name: decrementa1
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


module decrementa1(
    input A, B, Ci, flag,select,
    output Co, O
    );

reg num;
reg outpu;
reg one = 1;
reg none;
//    wire a0, a1, a2, num;
    
    muxflagin1 mux1(
        .A (A),
        .B (B),
        .flag (flag),
        .num (num)    
    );
    
    complementoa2 ca2(
        .num(one),
        .aa(none)
    );
    
//    xor u0(a0,num,1);
//    and u1(a1,num,1);
    
//    and u2(a2,a0,Ci);
    
//    or u3(Co, a1, a2);
    
//    xor u4 (O, a0, Ci);
  
  if (select == 3) 
  
    outpu <= num +none;
  
  else;
  

endmodule
