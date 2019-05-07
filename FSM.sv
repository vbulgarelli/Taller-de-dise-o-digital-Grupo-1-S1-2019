`timescale 1ns / 1ps


module FSM(
    
    input logic [1:0] conext,
    input logic clk,
    input manclk,
    input mode,
    input logic reset,
    input logic opSel,
    input logic selnum,
    input logic [7:0] datain,
    input logic [1:0] seldata,
    input logic save,
    input logic datawork,
    output reg [31:0] val,
    output reg [3:0] leds
    );
    
    reg K=0;
    reg clkout;
    wire clkdiv;
    reg [31:0] n0 =32'd0, n1 =32'd0;
    reg [22:0] a=23'd0;///////////////////////////////////////
    reg [22:0] b=23'd0;
    reg [7:0] exA=8'd0;
    reg [7:0] exB=8'd0;
    reg signA, signB;//////////////////////////////////
    reg [23:0] sumres = 23'd0;
    reg [22:0] shiftManA = 22'd0;
    reg [22:0] shiftManB = 22'd0;
    reg [7:0] shiftmax = 8'd0;
    reg [1:0] cont = 2'b00;
   
    Clock_divider(clk,clkdiv);
    
    always@*
    begin
    if(mode == 0)
    clkout <= clkdiv;
    else
    clkout <= manclk;
    end
    
    always@(posedge save)
    begin
    if(datawork==1 && selnum==0)
        n0<=n0+datain*2**(8*seldata);
    else if (datawork==1&&selnum==1)
        n1<=n1+datain*2**(8*seldata);
    else;
    a <= n0 && 32'b00000000011111111111111111111111;///////////////////////////////////////
    b <= n1 && 32'b00000000011111111111111111111111;
  exA <= (n0[30:23] && 8'b011111111);
  exB <= (n1[30:23] && 8'b011111111);
signA <= (n0[31] && 1'b1);
signB <= (n1[31] && 1'b1);
    end
    
    always @(posedge clkout && !datawork)
        begin
            case (cont)
               
                2'b00:
                
                    begin
                    leds <= 4'b0001;
                    if(exA > exB)
                    begin
                    shiftmax <= (exA-8'b01111111);
                    end
                    else if(exA == exB)
                    begin
                    shiftmax <= (exA-8'b01111111);
                    end
                    else if (exA < exB);
                    begin
                    shiftmax <= (exB-8'b01111111);
                    end
                    shiftManA <= (a >> (8'd23-shiftmax));
                    shiftManB <= (b >> (8'd23-shiftmax));
                    end
                    
                2'b01 :
                begin
                leds <= 4'b0010;
                sumres <= (1-opSel)*(shiftManA + shiftManB) + (shiftManA - shiftManB)*opSel;
                end
                2'b10 :
                    begin
                    leds <= 4'b0100;
                    val <={sumres, shiftmax};
                    end
               2'b11:
                    ;
                    
               default:;
               
                    
            endcase
            cont <= cont+1;
    end
endmodule