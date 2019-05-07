`timescale 1ns / 1ps


module FSM(
    input logic clk,
    input logic reset,
    input logic opSel,
    input [7:0] expA, expB,
    input [22:0] a, b,
    input signA, signB,
    output reg [31:0] val,
    output reg [3:0] leds
    );
    wire clkdiv;
    reg clkout;
    reg [22:0] shiftManA, shiftManB;
    reg [7:0] shiftmax = 8'd0;
    reg [23:0] sumres;
    reg [1:0] cont = 2'b00;
   

    always @(posedge clk && reset ==0)
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