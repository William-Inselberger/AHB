//-----------------------------------------------------------
// Module Name: Decoder
// The decoder for ahb system with 4 slave
// Author: WangFW
// Created on 2020-11-2
//-----------------------------------------------------------

module decoder(
  input  sel,
  output reg hsel_1,
  output reg hsel_2
);

wire hsel_temp;

always @(*) begin
  case(sel)
    1'b0: begin
      hsel_1 = 1'b1;
      hsel_2 = 1'b0;
    end
    1'b1: begin
      hsel_1 = 1'b0;
      hsel_2 = 1'b1;
    end
  endcase
end


endmodule

