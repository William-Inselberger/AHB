module idecoder(
input hclk,
input resetn,
output reg [7:0] data,
output reg [10:0] address,
output reg [2:0] bursttype,
output reg wr
);

reg [9:0]pc;
	
wire [22:0]instruction;	
	
instructionmemory U1(.pc(pc),.instruction(instruction));	


always @(posedge hclk,negedge resetn) begin
	if(!resetn) begin
		pc <= 0;	
	end
	else begin
		pc <= pc+1;
	end
	data[7:0] = instruction[7:0];
	address[10:0] = instruction [18:8];
	bursttype[2:0] = instruction [21:19];
	wr = instruction[22];
end

endmodule

