//---------------------------------------------------
// Module Name: multiplexor
// The mux select the data from different slave
// Author: WangFW
// Created on 2020-11-2
//---------------------------------------------------

module multiplexor(
  input [7:0] hrdata_0,
  input [7:0] hrdata_1,
  input hreadyout_0,
  input hreadyout_1,
  input hresp_0,
  input hresp_1,
  input sel,
  output reg [7:0] hrdata,
  output reg hreadyout,
  output reg hresp
);

always @(*) begin
  case(sel)
    1'b0: begin
      hrdata = hrdata_0;
      hreadyout = hreadyout_0;
      hresp = hresp_0;
    end
    1'b1: begin
      hrdata = hrdata_1;
      hreadyout = hreadyout_1;
      hresp = hresp_1;
    end

    default: begin
      hrdata = 8'h0000_0000;
      hreadyout = 1'b0;
      hresp = 1'b0;
    end
  endcase
end

endmodule

