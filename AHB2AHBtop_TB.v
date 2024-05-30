`timescale 1ns/100ps

module AHB2AHBtop_TB();
reg hclk;
reg resetn;
wire [7:0]dout;
wire [7:0]data;
wire [10:0]address;
wire write;
wire hready;
wire [7:0]leitura;




 AHB2AHBtop DUT(
.hclk(hclk),
.resetn(resetn),
.dout(dout),
.data(data),
.address(address),
.write(write),
.hready(hready),
.leitura(leitura),
.memos0(memos0),
.memos1(memos1)
);


initial begin

hclk=0;
resetn=0;


#20 resetn=1;


#1000 $stop;

end


always #1 hclk=~hclk;


endmodule
