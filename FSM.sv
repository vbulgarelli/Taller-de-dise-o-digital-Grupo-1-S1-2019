`timescale 1ns / 1ps

module FSM(cont, clk,reset
    );
    input logic cont[1:0];
    input logic clk;
    input logic reset;
    input logic a,b,exA,exB[7:0];//wires
    wire great,eq,less;
    input logic mantA,mantB,c,d,y[22:0];//wires
    input logic opSel;
    output logic overflow,neg;
    output logic shiftMantA,shiftMantB[22:0];
    always @(posedge clk, posedge reset)
        begin
            case (cont)
                2'b00  : module Comparador compi(a,b,great,eq,less);
                2'b01  : module Shifter shifti(eq,less,great,exA,exB,mantA,mantB,shiftMantA,shiftMantB);
                2'b10  : module Sumres sumri(c,d,opSel,y,overflow,neg);
                2'b11  : module Normalizador normi();
            endcase
    end
endmodule
