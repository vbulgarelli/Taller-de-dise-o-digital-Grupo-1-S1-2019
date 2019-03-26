`timescale 1ns / 1ps

module corrimiento(
    input A, flag,
    output num
    );
    
    reg [n-1:0] A;
    parameter n=4;
    parameter aluflagin=0;
    reg [n+1:0] C;
    wire [n-1:0] num;
    reg nflag;
    wire b0, b1, b2;
    genvar i;
    assign nflag = ~flag;
    
    assign  C[0]=aluflagin;
    assign C[n+1]=aluflagin;
    
     for(i = 0;i < n;i = i+1)     //  C es A con cero al inicio y al final 
          begin
            assign C[i+1] =A[i];
           end
           
   for(i = 1;i < n+1;i = i+1)
   begin 
        and (b0, C[i-1], nflag);
        and (b1, C[i+1], flag);
        or (b2, b0, b1);
        assign num[i-1] = b2;
   end
   
endmodule
