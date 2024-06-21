//-----------------------------------------------------------
// Module Name: Decoder
// The decoder for ahb system with 4 slave
// Author: WangFW
// Created on 2020-11-2
//-----------------------------------------------------------

module decoder(
  input  sel,
  output reg hsel_0,
  output reg hsel_1
);

wire hsel_temp;

always @(*) begin
  case(sel)
    1'b0: begin
      hsel_0 = 1'b1;
      hsel_1 = 1'b0;
    end
    1'b1: begin
      hsel_0 = 1'b0;
      hsel_1 = 1'b1;
    end
  endcase
end


endmodule

