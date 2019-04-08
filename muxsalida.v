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
A, B, flagin, select, result, overflow, negativo, cout, zero
    );
    
input A;
input B;
input flagin;
input select;
output result;
output overflow;
output negativo;
output cout;
output zero;

    
//aquí va la función de Daniel

always@(*)
    begin
    if(select==0)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==1)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
   
    if(select==2)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==3)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==4)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==5)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==6)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==7)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==8)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==9)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==10)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==11)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==12)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==13)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else
    
    if(select==14)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
      end
    
    else
    
    if(select==15)
      begin
        assign result = outsum;  
        assign overflow = outovfl;
        assign cout = outcarry;
        assign negativo = outneg;
        assign zero = outz;
    
    end
    
    else;
    
    end
    
    
endmodule
