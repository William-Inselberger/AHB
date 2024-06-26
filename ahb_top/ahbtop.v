//-------------------------------------------------------------------
// Module Name: ahb_top
// The AHB system consisting of one master and four slave
// Author: WangFW modified by William Inselberger and Leonardo Guedes
// Created on 2020-11-4 and modified on 2024-05
//-------------------------------------------------------------------

module ahbtop(
  input hclk,
  input hresetn,
  input enable,
  input [7:0] din,
  input hwr,
  input [10:0]addr,
  input [2:0] bursttype,
  output [7:0] dout,
  output hready,
  output [7:0]leitura,
  output [7:0] memos0,
  output [7:0] memos1,
  output [7:0] memos10,
  output [7:0] memos11
);

//--------------------------------------------------
// Connect wires
//--------------------------------------------------

// master
wire sel;
wire hwritem;
wire [3:0] hprot;
wire [2:0] hsize;
wire [2:0] hburst;
wire [1:0] htrans;
wire hmastlock;

wire [7:0] hwdata;

// slave 1
wire [7:0] hrdata_0;
wire hreadyout_0;
wire hresp_0;

// slave 2
wire [7:0] hrdata_1;
wire hreadyout_1;
wire hresp_1;

// decoder
wire hsel_0;
wire hsel_1;

// multiplexor
wire [7:0] hrdata;
wire hreadyout;
wire hresp;


//--------------------------------------------------
// Connect master, slaves, decoder, multiplexor
//--------------------------------------------------

// master

  
ahbmaster master(
  .hclk(hclk),
  .hresetn(hresetn),
  .din(din),
  .wr(hwr),
  .hreadyout(hreadyout),
  .hresp(hresp),
  .hrdata(hrdata),
  .hsize(hsize),
  .hwrite(hwrite),
  .hprot(hprot),
  .hburst(bursttype),
  .htrans(htrans),
  .hmastlock(hmastlock),
  .hready(hready),
  .hwdata(dout),
  .leitura(leitura)
);

// decoder
decoder deco(
  .sel(addr[10]),
  .hsel_0(hsel_0),
  .hsel_1(hsel_1)
);

// slave 1
ahbslave slave1(
  .hclk(hclk),
  .hresetn(hresetn),
  .hsel(hsel_0),
  .haddr(addr[9:0]),
  .hwrite(hwrite),
  .hsize(hsize),
  .hburst(bursttype),
  .hprot(hprot),
  .htrans(htrans),
  .hmastlock(hmastlock),
  .hready(1'b1),
  .hwdata(dout),
  .hreadyout(hreadyout_0),
  .hresp(hresp_0),
  .hrdata(hrdata_0),
  .memo0(memos0),
  .memo1(memos1)
);


ahbslave slave2(
  .hclk(hclk),
  .hresetn(hresetn),
  .hsel(hsel_1),
  .haddr(addr[9:0]),
  .hwrite(hwrite),
  .hsize(hsize),
  .hburst(bursttype),
  .hprot(hprot),
  .htrans(htrans),
  .hmastlock(hmastlock),
  .hready(1'b1),
  .hwdata(dout),
  .hreadyout(hreadyout_1),
  .hresp(hresp_1),
  .hrdata(hrdata_1),
  .memo0(memos10),
  .memo1(memos11)
);

// multiplexor
multiplexor multip(
  .hrdata_0(hrdata_0),
  .hrdata_1(hrdata_1),
  .hreadyout_0(hreadyout_0),
  .hreadyout_1(hreadyout_1),
  .hresp_0(hresp_0),
  .hresp_1(hresp_1),
  .sel(addr[10]),
  .hrdata(hrdata),
  .hreadyout(hreadyout),
  .hresp(hresp)
);



endmodule

