`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2019 11:13:50
// Design Name: 
// Module Name: tbcont1
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

module tbcont1;
    reg boton;
    reg clk;
    reg reset;
    wire [7:0]Anodo;
    wire [6:0]Led;
    
    Main uut(
        .boton(boton),
        .clk(clk),
        .reset(reset),
        .Anodo(Anodo),
        .Led(Led)
   
    );

    initial begin
        boton=0;
        clk=0;
        reset =1;
        
        forever
        begin
            #5 clk = ~ clk;
            #100 boton = ~ boton;
            
        end
        if (Led >7)
            begin
                $display ("ERROR");
            end
    end
       
endmodule
