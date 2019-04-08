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

module ForALU(A, B, flagin, select,
result, negativo, zero, cout, overflow);
/////
parameter N = 3;
input [N-1:0] A, B;
input flagin;
input [3:0] select;
output [N-1:0] result;
output negativo, zero, cout, overflow;

wire sumres;
wire resres;
wire incres;
wire decres;
wire srres;
wire slres;
wire orres;
wire andres;
wire xorres;
wire notres;

wire [N-1:0]carry;
wire cosum;
wire cores;
wire comp;
wire incCo;
wire decCo;

wire mux1;
wire [N+1:0]concData;
wire [N-1:0]shiftedDataR;
wire [N-1:0]shiftedDataL;

/////

genvar i;

//Sumador
generate
    for(i=0;i<N; i=i+1)
begin: sumop

sumador f(A[i],B[i],carry[i-1],sumres[i],carry[i]);    
end
assign cosum = carry[N-1]; 
endgenerate

//Restador
generate
    for(i=0;i<N; i=i+1)
begin: resop

complementoa1 compB(B,comp);

assign carry[-1] = 1; 

sumador g(A[i],comp[i],carry[i-1],resres[i],carry[i]);    
end
assign cores = carry[N-1];
endgenerate

//Incrementa 1
muxflagin1 mux(A,B,flagin,mux1);
sumador mas1(
    .A(mux1),
    .B(1),
    .Ci(0),
    .O(incres),
    .Co(incCo)
);

//Decrementa 1
wire compdec;

complementoa1 dec(1,compdec);
sumador menos1(
    .A(mux1),
    .B(compdec),
    .Ci(1),
    .O(decres),
    .Co(decCo)
);

//Logicas
assign orres = A|B;
assign andres = A&B;
assign xorres = A^B;
assign notres = ~B&flagin | ~A&~flagin;

//shifts
assign concData[0] = B[0];
assign concData[N+1] = B[0];
assign concData[N:1] = A;

generate
for(i=1;i<N; i=i+1)
begin
muxshift right(concData[i+1], concData[i-1], 1, shiftedDataR[i]);
end
endgenerate

generate
for(i=1;i<N; i=i+1)
begin
muxshift right(concData[i+1], concData[i-1], 0, shiftedDataL[i]);
end
endgenerate

always@*
begin
    if(select == 4'b0000)
    cout =
    if(select == 4'b0001)
    cout =
    if(select == 4'b0010)
    cout =
    if(select == 4'b0011)
    cout =
    if(select == 4'b0100)
    cout =
    if(select == 4'b0101)
    cout =
    if(select == 4'b0110)
    cout =
    if(select == 4'b0111)
    cout =
    if(select == 4'b1000)
    cout =
    if(select == 4'b1001)
    cout =
    if(select == 4'b1010)
    ;
    if(select == 4'b1011)
    ;
    if(select == 4'b1100)
    ;
    if(select == 4'b1101)
    ;
    if(select == 4'b1110)
    ;
    if(select == 4'b1111)
    ;
end

endmodule


    