`timescale 1ns / 1ps
module principal(A[3:0],B[3:0],select[3:0],flagin,pout,clk);

output pout;
wire [7:0] pout ;
input clk;
wire clk;

wire reset;
input [3:0] A ;
wire [3:0] A ;
input [3:0] B ;
wire [3:0] B ;
input [3:0] select ;
wire [3:0] select ;
input flagin ;
wire flagin ;

wire [12:0] din1;
assign din1[3:0] = select;
assign din1[4] = flagin;
assign din1[8:5] = B;
assign din1[12:9] = A;
wire [12:0] dout1;

PIPO PI(din1,clk,reset,dout1);

wire [3:0] resultado;
wire opnegativo,ozero,ocout,ooverflow;

ALUU alu(A, B, flagin, select,
resultado, opnegativo, ozero, ocout, ooverflow);
wire [7:0] din2;
assign din2[0] = opnegativo;
assign din2[1] = ozero;
assign din2[2] = ocout;
assign din2[3] = ooverflow;
assign din2[7:4] = resultado;


PIPO PO(din2,clk,reset,pout);

endmodule