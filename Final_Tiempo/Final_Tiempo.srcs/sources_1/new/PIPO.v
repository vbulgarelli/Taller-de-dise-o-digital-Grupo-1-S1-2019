module PIPO ( din ,clk ,reset ,dout );

output [12:0] dout ;
reg [12:0] dout ;

input [12:0] din ;
wire [12:0] din ;

input clk ;
wire clk ;
input reset ;
wire reset ;


always @ (posedge (clk)) begin
 if (reset)
  dout <= 0;
 else
  dout <= din;
end

endmodule