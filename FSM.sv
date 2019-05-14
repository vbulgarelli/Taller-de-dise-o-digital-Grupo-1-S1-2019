`timescale 1ns / 1ps


module FSM(
    clk,
    reset,
    n0,n1,
    val,
    leds
    );
    input clk;
    input reset; 
    input [31:0] n1,n0;    
    output reg [31:0] val;
    output reg [3:0] leds;
    
    
    
    wire [22:0] shiftManA, shiftManB;
    wire [7:0] shiftmax;
    reg [23:0] sumres;
    reg [1:0] cont = 2'b00;
    reg [1:0] nxtstate = 2'b00;
    reg less, great, eq;
    reg dostate1;
    reg dostate2;
    reg dostate3;
      
    assign great = n0[30:23] > n1[30:23]? 1:0;
    assign less = n0[30:23] < n1[30:23]? 1:0; 
    assign eq =  n0[30:23] == n1[30:23]? 1:0;
    assign shiftmax = (8'd127-n0[30:23])*great + (8'd127-n1[30:23])*less; 
    assign shiftManA = n1[30:23] > n0[30:23] && eq != 1? (n0[22:0] >> (shiftmax-(8'd127-n0[30:23]))) : n0[22:0];
    assign shiftManB = n0[30:23] > n1[30:23] && eq != 1? (n1[22:0] >> (shiftmax-(8'd127-n1[30:23]))) : n1[22:0]; 
    wire [23:0] sumrespp, sumrespm, sumresmp, sumresmm;

    assign sumrespp = (shiftManA + shiftManB);
    assign sumrespm = (shiftManA - shiftManB);
    assign sumresmp = (-shiftManA + shiftManB);
    assign sumresmm = (-shiftManA - shiftManB);

    always@(posedge clk)
    begin
                    if (n0[31] && n1[31])
                    begin
                    sumres <= sumresmm;
                    end
                else if(!n0[31] && n1[31])
                    begin
                    sumres <= sumrespm;
                    end
                else if(n0[31] && !n1[31])
                    begin
                    sumres <= sumresmp;
                    end
                else if(!n0[31] && !n1[31])
                    begin
                    sumres <= sumrespp;
                    end
                else ;
     end
     
    always @(posedge clk)
        begin
        
        if(reset)
        begin
        nxtstate <= 2'b00;
        leds <=4'b0000;
        val <= 32'd0;
        dostate1 <= 0;
        dostate2 <= 0;
        dostate3 <= 0;
        end else
        begin
        cont <= nxtstate;
        begin
            case (cont)
               
                
                2'b00:
                    begin
                    dostate1 <= 1;
                    if(dostate1) begin
                    leds <= 4'b0001;
                    val <={24'd0,shiftmax};
                    nxtstate <= 2'b01;
                    dostate1 <= 0;
                    end
                    end    
                  
                2'b01:
                begin
                dostate2 <= 1;
                if(dostate2) begin
                leds <= 4'b0010;    
                val <= {sumres};
                nxtstate <= 2'b10;
                dostate2 <= 0;
                end
                end
                
                2'b10:
                    begin
                    dostate3 <= 1;
                    if(dostate3) begin
                    leds <= 4'b0100;
                    val <= {sumres[23],shiftmax,sumres[22:0]};
                    nxtstate <= 2'b00;
                    dostate3 <= 0;
                    end            
                    end               
            
            endcase 
        end
        end
        end 
 
endmodule