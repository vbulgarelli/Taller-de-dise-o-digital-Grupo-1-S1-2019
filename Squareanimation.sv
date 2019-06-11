`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2019 10:39:54
// Design Name: 
// Module Name: Squareanimation
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


module Squareanimation(
    input logic CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input logic boton,
    input wire RST_BTN,         // reset button
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );

wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    // generate a 25 MHz pixel strobe
    reg [23:0] cnt = 24'h000000;
    reg pix_stb;
    
    always @(posedge CLK) begin
   
    {pix_stb, cnt} <= cnt + {4'h4,20'b00000};
    end
   
    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
 
    
    vga display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y));

    // asigna las coordenadas de los cuadrados
    wire sq_a, sq_b, sq_c, sq_d;
    assign sq_a = ((x > 0) & (y > 0) & (x < 320) & (y < 240)) ? 1 : 0;
    assign sq_b = ((x > 320) & (y > 0) & (x < 640) & (y < 240)) ? 1 : 0;
    assign sq_c = ((x > 0) & (y > 240) & (x < 320) & (y < 480)) ? 1 : 0;
    assign sq_d = ((x > 320) & (y > 240) & (x < 640) & (y < 480)) ? 1 : 0;


    reg [1:0] cont = 2'b00; 
    reg [11:0] ran;  
    wire [7:0] address;
    wire [5:0] dataout;
    wire spr;
    
    
    reg [11:0] palette [0:63];  // 64 x 12-bit colour palette entries
    
        initial begin
            $display("Loading palette.");
            $readmemh("sprit_palette.mem", palette);  // bitmap palette to load
        end

      
    sram #(
            .ADDR_WIDTH(8), 
            .DATA_WIDTH(6), 
            .DEPTH(256), 
            .MEMFILE("sprit.mem"))  // bitmap to load
            vram (
            .i_addr(address), 
            .i_clk(CLK), 
            .i_write(0),  // we're always reading
            .i_data(0), 
            .o_data(dataout)
        );
        
        
        
        assign spr = ( (x >= (152 + 320*(cont[0])) ) & (y >= (112 + 240*(cont[1])) ) & (x <= (168+ 320*(cont[0])) ) & (y <= (128 + 240*(cont[1]))))? 1 : 0;
        assign address = (x-(152 + 320*(cont[0]))) + 16*(y-(112 + 240*(cont[1])));
  
  
  lfsr random(.out(ran),.clk(CLK),.rst(rst));
  
  reg [11:0] colora = 12'b0;
  reg [11:0] colorb = 12'b0;
  reg [11:0] colorc = 12'b0;
  reg [11:0] colord = 12'b0;
  
  //always@(posedge CLK)
  
 reg boton_old;
 
   always@(posedge CLK)
   begin

   if (boton_old == 0 && boton == 1)
   begin
        if(cont == 3)
        cont <= 2'b00;
        else
        cont <= cont + 2'b01;
         
            case(cont)
            0:
            colora <= ran[11:0];
           
            1:
            colorb <= ran[11:0];
       
            2:
            colorc <= ran[11:0];
            
            3:
            colord <= ran[11:0];
            
            endcase
        end

   boton_old  <= boton;

   
   end
   
   
  
   // se pasa el valor de los registros a los cables de RGB
 
assign VGA_R = ({(sq_a & colora[0]) | (sq_b & colorb[0]) | (sq_c & colorc[0]) | (sq_d & colord[0]),
                (sq_a & colora[1]) | (sq_b & colorb[1]) | (sq_c & colorc[1]) | (sq_d & colord[1]),
                (sq_a & colora[2]) | (sq_b & colorb[2]) | (sq_c & colorc[2]) | (sq_d & colord[2]),
                (sq_a & colora[3]) | (sq_b & colorb[3]) | (sq_c & colorc[3]) | (sq_d & colord[3])} *(1-spr)) | (spr * palette[dataout][11:8]);
assign VGA_G = ({(sq_a & colora[4]) | (sq_b & colorb[4]) | (sq_c & colorc[4]) | (sq_d & colord[4]),
                (sq_a & colora[5]) | (sq_b & colorb[5]) | (sq_c & colorc[5]) | (sq_d & colord[5]),
                (sq_a & colora[6]) | (sq_b & colorb[6]) | (sq_c & colorc[6]) | (sq_d & colord[6]),
                (sq_a & colora[7]) | (sq_b & colorb[7]) | (sq_c & colorc[7]) | (sq_d & colord[7])} * (1-spr)) | (spr * palette[dataout][7:4]);
assign VGA_B = ({(sq_a & colora[8]) | (sq_b & colorb[8]) | (sq_c & colorc[8]) | (sq_d & colord[8]),
                (sq_a & colora[9]) | (sq_b & colorb[9]) | (sq_c & colorc[9]) | (sq_d & colord[9]),
                (sq_a & colora[10]) | (sq_b & colorb[10]) | (sq_c & colorc[10]) | (sq_d & colord[10]),
                (sq_a & colora[11]) | (sq_b & colorb[11]) | (sq_c & colorc[11]) | (sq_d & colord[11])} *(1-spr)) |(spr * palette[dataout][3:0]);
  
endmodule