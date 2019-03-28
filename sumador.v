`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 17:03:47
// Design Name: 
// Module Name: sumador
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


module sumador(
    input A, B, Ci, select,
    output O, Co
    );
 
reg outpu; 
  
//reg a0, a1, a2;

always@(*)
 begin
 if (select==0)
//    xor u0(a0,A,B);
    
//    and u1(a1,A,B);
    
//    and u2(a2,a0,Ci);
    
//    or u3(Co, a1, a2);
    
//    xor u4 (O, a0, Ci);
    
    outpu <= A+B;   
     
else;

end    

assign O = outpu;

endmodule
