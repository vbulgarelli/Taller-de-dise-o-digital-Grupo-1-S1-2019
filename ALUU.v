`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2019 16:04:28
// Design Name: 
// Module Name: ALUU
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


module ALUU(A, B, flagin, select,
resultado, opnegativo, ozero, ocout, ooverflow);
/////
parameter N = 3;
input [N-1:0] A, B;
input flagin;
input [3:0] select;
output [N-1:0] resultado;
output opnegativo, ozero, ocout, ooverflow;

//ayuda para salidas
reg result;
reg negativo;
reg zero;
reg cout;
reg overflow;


wire sumres;
wire resres;
wire incres;
wire decres;
wire srres;
wire slres;
wire orres;
wire andres;
wire xorres;
wire nres;

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
assign nres = ~B&flagin | ~A&~flagin;

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

always@(*)
    begin
    if(select==0)
      begin
        assign result = sumres;  
        assign overflow = cosum;
        assign cout = cosum;
        assign negativo = 0;
        if(sumres == 0)
        assign zero = 1;
        else
            assign zero = 0;
    
    end
    
    else
    
    if(select==1)
      begin
        assign result = resres;  
        assign overflow = cores;
        assign cout = cores;
        assign negativo = 1;
        if(resres == 0)
        assign zero = 1 ;
        else
            assign zero = 0;
    
    end
    
    else
   
    if(select==2)
      begin
        assign result = incres;  
        assign overflow = incCo;
        assign cout = incCo;
        assign negativo = 0;
        if(incres == 0)
        assign zero = 1;
        else
            assign zero = 0;
    
    end
    
    else
    
    if(select==3)
      begin
        assign result = decres;  
        assign overflow = decCo;
        assign cout = decCo;
        assign negativo = 1;
        if (decres == 0)
        assign zero = 1;
        else
            assign zero = 0;
    
    end
    
    else
    
    if(select==4)
      begin
        assign result = andres;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==5)
      begin
        assign result = orres;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==6)
      begin
        assign result = nres;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==7)
      begin
        assign result = xorres;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==8)
      begin
        assign result = slres;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==9)
      begin
        assign result = srres;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==10)
      begin
        assign result = 0;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==11)
      begin
        assign result = 0;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==12)
      begin
        assign result = 0;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==13)
      begin
        assign result = 0;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else
    
    if(select==14)
      begin
        assign result = 0;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
      end
    
    else
    
    if(select==15)
      begin
        assign result = 0;  
        assign overflow = 0;
        assign cout = 0;
        assign negativo = 0;
        assign zero = 0;
    
    end
    
    else;
    
    end

assign resultado = result;
assign ooverflow = overflow;
assign ocout = cout;
assign opnegativo = negativo;
assign ozero = zero;


endmodule
