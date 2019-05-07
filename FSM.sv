`timescale 1ns / 1ps


module FSM(
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
    wire clkdiv;
    reg clkout;
    reg [31:0] n0, n1;
    reg [22:0] a, b;
    reg [7:0] expA, expB;
    reg signA, signB;
    reg [22:0] shiftManA, shiftManB;
    reg [7:0] shiftmax = 8'd0;
    reg [23:0] sumres;
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
    begin
        n0<=n0 + datain*(2**(8*seldata));
    end
    else if (datawork==1&&selnum==1)
    begin
        n1<=n1 + datain*(2**(8*seldata));
    end  
    
    {signB,expB,b} <= n1;
    {signA,expA,a} <= n0;  
    end
    
    always @(posedge clkout && datawork==0)
        begin
            case (cont)
               
                
                2'b00:
                
                    begin
                    leds <= 4'b0001;
                    
                    if(expA > expB)
                    begin
                        shiftmax <= (expA-127);
                    end
                    else if(expA == expB)
                    begin
                        shiftmax <= 0;
                    end
                    else if (expA < expB);
                    begin
                        shiftmax <= (expB-127);
                    end
                    shiftManA <= (a >> (shiftmax));
                    shiftManB <= (b >> (shiftmax));
                    end    
                2'b01:
                begin
                leds <= 4'b0010;
                if (opSel == 0)
                begin
                 sumres <= (shiftManA + shiftManB);
                end
                
                else if(opSel == 1)
                begin
                 sumres <= (shiftManA - shiftManB);
                end
                
                end
                2'b10:
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