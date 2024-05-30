module AHB2AHBtop(
input hclk,
//input pclk,
input resetn,
output [7:0]data,
output [10:0]address,
output write,
output [7:0]dout,
output [7:0]leitura,
output hready,
output [7:0]memos0,
output [7:0]memos1
);



wire [2:0]bursttype;

//parts of the AHB master, its slaves and the bridge
wire clk,enable;
wire [7:0] din,prdata,pwdata;
wire [9:0] paddrs;
wire penable,pwrite,psel;


wire [7:0]/*memos0,memos1,*/memos10,memos11;



idecoder U1(
.hclk(hready),
.resetn(resetn),
.data(data),
.address(address),
.bursttype(bursttype),
.wr(write)
);


ahbtop U2(
.hclk(hclk),
.hresetn(resetn),
.din(data),
.addr(address),
.hwr(write),
.dout(dout),
.bursttype(bursttype),

.hready(hready),
.leitura(leitura),
.memos0(memos0),
.memos1(memos1),
.memos10(memos10),
.memos11(memos11)
);






displaydecoder U6(
.n(leitura),
.A(Am),
.B(Bm),
.C(Cm),
.D(Dm),
.E(Em),
.F(Fm),
.G(Gm)
);

displaydecoder U7(
.n(memos1),
.A(As1),
.B(Bs1),
.C(Cs1),
.D(Ds1),
.E(Es1),
.F(Fs1),
.G(Gs1)
);

displaydecoder U8(
.n(memos10),
.A(As2),
.B(Bs2),
.C(Cs2),
.D(Ds2),
.E(Es2),
.F(Fs2),
.G(Gs2)
);



endmodule 