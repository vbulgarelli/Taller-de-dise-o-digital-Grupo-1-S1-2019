`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_segment7;
    reg [3:0] bcd;
    wire [6:0] seg;
    integer i;
    wire [1:0] Anode_Activate;
    segment7 uut(
        .bcd(bcd),
        .seg(seg),
        .Anode_Activate(Anode_Activate)
    );
    initial begin
        
        bcd = 0;
        for(i = 0;i < 16;i = i+1)
        begin
            bcd = i;
            #10;
        end
    end
       
endmodule