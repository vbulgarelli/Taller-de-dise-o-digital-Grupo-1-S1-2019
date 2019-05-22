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
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    input boton,                // boton "clock"
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );

wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h4000;  // divide by 4: (2^16)/4 = 0x4000

    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
    
    reg [3:0] red; //para poder cambiar los valores en un case
    reg [3:0]green;
    reg [3:0] blue;
    
    vga display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );
    
    reg [1:0]cont; //contador que vamos a usar para determinar cuando se pinta un cuadro, cambia al pulsar un boton
    
    
    // asigna las coordenadas de los cuadrados
    wire sq_a, sq_b, sq_c, sq_d;
    assign sq_a = ((x > 0) & (y >  0) & (x < 320) & (y < 240)) ? 1 : 0;
    assign sq_b = ((x > 321) & (y > 0) & (x < 640) & (y < 240))& (cont==1) ? 1 : 0;
    assign sq_c = ((x > 0) & (y > 241) & (x < 320) & (y < 480)) & (cont==2)  ? 1 : 0;
    assign sq_d = ((x > 321) & (y > 241) & (x < 640) & (y < 480)) & (cont==3) ? 1 : 0;

    reg a,b,c,d;

//    assign VGA_R[3] = sq_b;         // square b is red
//    assign VGA_G[3] = sq_a | sq_d;  // squares a and d are green
//    assign VGA_B[3] = sq_c;         // square c is blue
    
    
    reg [11:0] random;
    
    always@(posedge boton)
    begin
        cont <= cont + 1;
    end
    // falta crear otro divisor de clock para el pintado automático
    
  always @* //por ahora pone colores fijos como prueba
  begin  
    case(cont)
         0: red =random[11:8]; 
         0: green =random[7:4]; 
         0: blue =random[3:0]; 
         0: random = random + 3;
         1: red =random[11:8]; 
         1: green =random[7:4]; 
         1: blue =random[3:0]; 
         1: random = random +1;
         2: red =random[11:8]; 
         2: green =random[7:4]; 
         2: blue =random[3:0]; 
         2: random = random + 7;
         3: red =random[11:8]; 
         3: green =random[7:4]; 
         3: blue =random[3:0]; 
         3: random = random + 2;
         
    endcase
   end  
   
   // se pasa el valor de los registros a los cables de RGB
   assign VGA_R = red;
   assign VGA_G = green;
   assign VGA_B = blue;
   
   // se encienden los cables en las coordenadas del cuadro a
   assign VGA_R = sq_a | sq_b;
   assign VGA_G = sq_a | sq_c;
   assign VGA_B = sq_b | sq_c;
   
       
endmodule
