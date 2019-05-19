module ScreenRun (
    input clk, 
    input reset, 
    output wire synch, 
    output wire syncv, 
    output wire [9:0] px,
    output wire [8:0] py);
    
    reg [9:0] conth;
    reg [9:0] contv;
    
    
    
    assign synch = ~((conth >= 16) & (conth < 112));
    assign syncv = ~((contv >= 490) & (contv < 492));
 
    assign px = (conth < 160) ? 0 : (conth - 160);
    assign py = (contv >= 480) ? (480 - 1) : (contv);
    
    always @ (posedge clk)
        begin
            if (reset)  
            begin
                conth <= 0;
                contv <= 0;
            end
            
                if (conth == 800)  
                begin
                    conth <= 0;
                    contv <= contv + 1;
                end
                else 
                    conth <= conth + 1;
    
                if (contv == 525)
                    contv <= 0;
                 end
                 
               
    

endmodule