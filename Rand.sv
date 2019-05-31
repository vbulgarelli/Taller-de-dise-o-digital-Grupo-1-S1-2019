module lfsr (out, clk, rst);

  output reg [11:0] out;
  input clk, rst;

  wire feedback;

  assign feedback = ~(out[11] ^ out[10]);

always @(posedge clk, posedge rst)
  begin
    if (rst)
      out <= 12'b0;
    else
      out <= {out[10:0],feedback};
  end
endmodule