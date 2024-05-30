`timescale 1ns/1ns

module decoderTB();

reg hclk;
reg  resetn;
wire [7:0] data;
wire [10:0] address;
wire [2:0] bursttype;
wire wr;

idecoder DUT(hclk,resetn,data,address,bursttype,wr);
initial begin

	resetn=0;
	hclk=0;
	#5 resetn=1;
	#100 $stop;

end


always #1 hclk=~hclk; 

endmodule 