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
////////////////////////
parameter N = 3;
////////////////////////

module muxshift(
input data1, data2, lr ,
output shiftdata
    );

   assign shiftdata = data1&lr|data2&~lr;

endmodule

module complementoa1(
    input [N-1:0] num,
    output[N-1:0] aa
    );
    assign aa = !num;  
endmodule

module muxflagin1(
    input [N-1:0] A,[N-1:0] B, 
    input flag,
    output [N-1:0] num
    );
    wire nflag;
    wire a0, a1, a2;
    
    assign nflag = ~flag;
    and u0(a0, A, flag);
    and u1(a1, B, nflag);
    or u3(a2, a0, a1);
    assign num = a2;    
endmodule

module sumador(A, B, Ci,O, Co);
input A,B,Ci;
output O,Co;
assign O = A^B^Ci;
assign Co = (B&Ci)|(A&B)|(A&Ci); 
endmodule

module ALUU(A, B, flagin, select,
resultado, opnegativo, ozero, ocout, ooverflow);
/////

input [N-1:0] A, B;
input flagin;
input [3:0] select;
output [N-1:0] resultado;
output opnegativo, ozero, ocout, ooverflow;

//ayuda para salidas
reg [N-1:0] result;
reg negativo;
reg zero;
reg cout;
reg overflow;


wire [N-1:0] sumres;
wire [N-1:0] resres;
wire [N-1:0] incres;
wire [N-1:0] decres;
wire [N-1:0] srres;
wire [N-1:0] slres;
wire [N-1:0] orres;
wire [N-1:0] andres;
wire [N-1:0] xorres;
wire [N-1:0] nres;

wire [N-1:0] carrysum;
wire [N-1:0] carryres;
wire cosum;
wire cores;
wire [N-1:0] comp;
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

sumador f(A[i],B[i],carrysum[i-1],sumres[i],carrysum[i]);    
end
assign cosum = carrysum[N-1]; 
endgenerate

//Restador

complementoa1 compB(B,comp);

generate
    for(i=0;i<N; i=i+1)
begin: resop

assign carryres[-1] = 1; 

sumador g(A[i],comp[i],carryres[i-1],resres[i],carryres[i]);    
end
assign cores = carryres[N-1];
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
        result <= sumres;  
        overflow <= cosum;
        cout <= cosum;
        negativo <= 0;
        if(sumres == 0)
        zero <= 1;
        else
            zero <= 0;
    
    end
    
    else
    
    if(select==1)
      begin
        result <= resres;  
        overflow <= cores;
        cout <= cores;
        negativo <= 1;
        if(resres == 0)
            zero <= 1 ;
        else
            zero <= 0;
    
    end
    
    else
   
    if(select==2)
      begin
        result <= incres;  
        overflow <= incCo;
        cout <= incCo;
        negativo <= 0;
        if(incres == 0)
            zero <= 1;
        else
            zero <= 0;
    
    end
    
    else
    
    if(select==3)
      begin
        result <= decres;  
        overflow <= decCo;
        cout <= decCo;
        negativo <= 1;
        if (decres == 0)
            zero <= 1;
        else
            zero <= 0;
    
    end
    
    else
    
    if(select==4)
      begin
        result <= andres;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==5)
      begin
        result <= orres;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==6)
      begin
        result <= nres;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==7)
      begin
        result <= xorres;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==8)
      begin
        result <= slres;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==9)
      begin
        result <= srres;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==10)
      begin
        result <= 0;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==11)
      begin
        result <= 0;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==12)
      begin
       result <= 0;  
       overflow <= 0;
       cout <= 0;
       negativo <= 0;
       zero <= 0;
    
    end
    
    else
    
    if(select==13)
      begin
        result <= 0;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else
    
    if(select==14)
      begin
        result <= 0;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
      end
    
    else
    
    if(select==15)
      begin
        result <= 0;  
        overflow <= 0;
        cout <= 0;
        negativo <= 0;
        zero <= 0;
    
    end
    
    else;
    
    end

assign resultado = result;
assign ooverflow = overflow;
assign ocout = cout;
assign opnegativo = negativo;
assign ozero = zero;


endmodule
