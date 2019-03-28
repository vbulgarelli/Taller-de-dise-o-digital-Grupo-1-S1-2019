`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2019 10:05:19
// Design Name: 
// Module Name: ForALU
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


module ForALU(
input A, B, flagin, control, select, Ci,
output result, negativo, zero, cout, overflow
);

reg oresult;
reg oCo;
  
sumador sumador1(
    .A(A),
    .B(B),
    .Ci(Ci),
    .O(oresult),
    .Co(oCo),
    .select(select)
);
    
restador restador1(
    .A(A),
    .B(B),
    .Ci(Ci),
    .O(oresult),
    .Co(oCo),
    .select(select)
);

incrementa1 mas1(
    .A(A),
    .B(B),
    .flag(flagin),
    .O(oresult),
    .Co(cout)
);

decrementa1 menos1(
    .A(A),
    .B(B),
    .flag(flagin),
    .O(oresult),
    .Co(cout)
);

       
endmodule


    