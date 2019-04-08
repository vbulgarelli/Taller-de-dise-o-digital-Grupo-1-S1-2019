`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2019 13:49:09
// Design Name: 
// Module Name: muxsalida
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


module muxsalida(
A, B, flagin, select, out, overflow, negado, carryo, zero
    );
    
input A;
input B;
input flagin;
input select;
output out;
output overflow;
output negado;
output carryo;
output zero;

    
//aquí va la función de Daniel

always@(*)
    begin
    if(select==0)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==1)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
   
    if(select==2)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==3)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==4)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==5)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==6)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==7)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==8)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==9)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==10)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==11)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==12)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==13)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==14)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
      end
    
    else
    
    if(select==15)
      begin
        assign out = outsum;  
        assign overflow = outovfl;
        assign carryo = outcarry;
        assign negado = outneg;
        assign zero = outz;
    
    end
    
    else;
    
    end
    
    
endmodule
