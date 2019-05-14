`timescale 1ns / 1ps

module displaycontrol(input [31:0]data,
input clock,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp,
    output [7:0]an
    );
    
    reg [3:0]d7a;
    reg [3:0]d7b;
    reg [3:0]d7c;
    reg [3:0]d7d;
    reg [3:0]d7e;
    reg [3:0]d7f;
    reg [3:0]d7g;
    reg [3:0]d7h;
    
    reg [22:0] delay; //register to produce the 0.1 second delay
    wire test;
    always @ (posedge clock or posedge reset)
     begin
      if (reset)
       delay <= 0;
      else
       delay <= delay + 1;
     end
      
    assign test = &delay;
    always @ (posedge test or posedge reset)
     begin
      if (reset) begin
       d7a <= 0;
       d7b <= 0;
       d7c <= 0;
       d7d <= 0;
       d7e <= 0;
       d7f <= 0;
       d7g <= 0;
       d7h <= 0;
      
       end
      else 
      begin
      d7a <= data[3:0];
      d7b <= data[7:4];
      d7c <= data[11:8];
      d7d <= data[15:12];
      d7e <= data[19:16];
      d7f <= data[23:20];
      d7g <= data[27:24];
      d7h <= data[31:28];
      
      end
     end
    localparam N = 20;
     
    reg [N-1:0]count;
    //or posedge reset
    always @ (posedge clock)
     begin
//      if (reset)
//       count <= 0;
//      else
       count <= count + 1;
    end
     
    reg [6:0]sseg;
    reg [7:0]an_temp;
    always @ (*)
     begin
      case(count[N-1:N-3])
        
       3'b000: 
        begin
         sseg = d7a;
         an_temp = 8'b11111110;
        end
        
       3'b001:
        begin
         sseg = d7b;
         an_temp = 8'b11111101;
        end
        
       3'b010:
        begin
         sseg = d7c; 
         an_temp = 8'b11111011;
        end
         
       3'b011:
        begin
         sseg = d7d; 
         an_temp = 8'b11110111;
        end
        
       3'b100:
        begin
         sseg = d7e; 
         an_temp = 8'b11101111;
        end
         
       3'b101:
        begin
         sseg = d7f;
         an_temp = 8'b11011111;
        end
         
       3'b110:
        begin
         sseg = d7g;
         an_temp = 8'b10111111;
        end
        
       3'b111:
        begin         
         sseg = d7h;
         an_temp = 8'b01111111;
        end        
      endcase
     end
     
    assign an = an_temp;
     
    reg [6:0] sseg_temp; 
    always @ (*)
     begin
      case(sseg)
       8'h0 : sseg_temp = 7'b1000000; //0
       8'h1 : sseg_temp = 7'b1111001; //1
       8'h2 : sseg_temp = 7'b0100100; //2
       8'h3 : sseg_temp = 7'b0110000; //3
       8'h4 : sseg_temp = 7'b0011001; //4
       8'h5 : sseg_temp = 7'b0010010; //5
       8'h6 : sseg_temp = 7'b0000010; //6
       8'h7 : sseg_temp = 7'b1111000; //7
       8'h8 : sseg_temp = 7'b0000000; //8
       8'h9 : sseg_temp = 7'b0010000; //9
       8'hA : sseg_temp = 7'b0001000; //A
       8'hB : sseg_temp = 7'b0000011; //B
       8'hC : sseg_temp = 7'b1000110; //C
       8'hD : sseg_temp = 7'b0100001; //D
       8'hE : sseg_temp = 7'b0000110; //E
       8'hF : sseg_temp = 7'b0001110; //F
       default : sseg_temp = 7'b0111111; //dash
      endcase
     end
    assign {g, f, e, d, c, b, a} = sseg_temp; 
    assign dp = 1'b1; //we dont need the decimal here so turn all of them off
     
     
     
endmodule


module FPU(
    input autoclk,
    input manclk,
    input mode,
    input logic selnum,
    input logic [7:0] datain,
    input logic [1:0] seldata,
    input logic save,
    input logic datawork,
    input logic reset,
    output a, b, c, d, e, f, g, dp,
    output[7:0] an,
    output [3:0] leds);

    wire clkdiv;
    reg clkout;
    reg [31:0] n0=32'd0, n1=32'd0;
    reg [22:0] manA, manB;
    reg [7:0] expA, expB;
    reg signA, signB;
    reg [31:0] val754;

   Clock_divider(autoclk,clkdiv);
    
    
    assign clkout = clkdiv && mode || manclk && ~mode;
    
    always@(save, datawork, selnum, n1, n0, seldata, datain)
    begin
        if(datawork == 1 && save == 1)
        begin
            if (selnum == 0)
            begin
            case(seldata)
            2'b00:
                  n0 <={n0[31:8],datain};
            2'b01:
                  n0 <={n0[31:16],datain,n0[7:0]};
            2'b10:
                  n0 <={n0[31:24],datain,n0[15:0]};
            2'b11:
                  n0 <={datain,n0[23:0]};
            endcase
            end
            else if (selnum == 1)
            begin
            case(seldata)
            2'b00:
                  n1 <={n1[31:8],datain};
            2'b01:
                  n1 <={n1[31:16],datain,n1[7:0]};
            2'b10:
                  n1 <={n1[31:24],datain,n1[15:0]};
            2'b11:
                  n1 <={datain,n1[23:0]};
            endcase
            end  
        end
        
        else;
    end
    

    FSM(clkout,reset, n0, n1, val754, leds);
    
    
    displaycontrol (val754, autoclk, reset, a, b, c, d, e, f, g, dp, an);
endmodule 