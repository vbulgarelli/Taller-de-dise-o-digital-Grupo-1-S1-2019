`timescale 1ns / 1ps

module FSM(
    
    input logic [1:0] conext,
    input logic clk,
    input logic reset,
    input logic opSel,
    input logic [31:0] n0, [31:0] n1,
    output reg [31:0] val
    );
    wire clkout;
    reg [22:0] a = n0[22:0];
    reg [22:0] b = n1[22:0];
    wire [7:0] exA = n0[30:23];
    wire [7:0] exB = n1[30:23];
    wire signA = n0[31], signB = n1[31];
    reg [23:0] sumres = 23'd0;
    reg [22:0] shiftManA = 22'd0;
    reg [22:0] shiftManB = 22'd0;
    reg [7:0] shiftmax = 8'd0;
    reg [1:0] cont = 2'd0;
    
    Clock_divider(clk,clkout);
    
    always @(posedge clkout)
        begin
            case (cont)
               
                2'b00 :
                    begin
                    if(exA > exB)
                    begin
                    shiftmax <= (exA-127);
                    end
                    else if(exA == exB)
                    begin
                    shiftmax <= (exA-127);
                    end
                    else if (exA < exB);
                    begin
                    shiftmax <= (exB-127);
                    end
                    shiftManA <= (a >> (8'd23-shiftmax));
                    shiftManB <= (b >> (8'd23-shiftmax));
                    end
                    
                2'b01 : sumres <= (1-opSel)*(shiftManA + shiftManB) + (shiftManA - shiftManB)*opSel;
                
                2'b10 :
                    begin
                    val[7:0] <= shiftmax;
                    val [22:0] <= sumres [22:0];
                    val [31] <= sumres [23]; 
                    end
               2'b11:
                    ;
                    
               default:;
               
                    
            endcase
    end
endmodule