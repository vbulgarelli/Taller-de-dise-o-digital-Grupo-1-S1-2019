`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2019 11:26:22
// Design Name: 
// Module Name: restador
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


module restador(
input A,B, Ci, select,
output O, Co
    );

reg a2B;
reg outpu; 
complementoa2 ca2(
    .num(B),
    .aa(a2B)
);

always@(*)
 begin
 if (select==1)
//    xor u0(a0,A,a2B);
    
//    and u1(a1,A,a2B);
    
//    and u2(a2,a0,Ci);
    
//    or u3(Co, a1, a2);
    
//    xor u4 (O, a0, Ci);
    
    outpu <= A+a2B;   
     
else;

end    

assign O = outpu;

endmodule
