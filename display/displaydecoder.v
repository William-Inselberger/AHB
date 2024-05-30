module displaydecoder(
input [7:0]n,
output reg A,
output reg B,
output reg C,
output reg D,
output reg E,
output reg F,
output reg G
);

wire [3:0] nt;

assign nt=n[3:0];
always@(nt) begin


	case (nt) 
		
		0:begin 
			A<=0;
			B<=0;
			C<=0;
			D<=0;
			E<=0;
			F<=0;
			G<=1;
		end
		1: begin 
			A<=1;
			B<=0;
			C<=0;
			D<=1;
			E<=1;
			F<=1;
			G<=1;
		end
		2:begin 
			A<=0;
			B<=0;
			C<=1;
			D<=0;
			E<=0;
			F<=1;
			G<=0;
		end
		3:begin 
			A<=0;
			B<=0;
			C<=0;
			D<=0;
			E<=1;
			F<=1;
			G<=0;
		end
		4:begin 
			A<=1;
			B<=0;
			C<=0;
			D<=1;
			E<=1;
			F<=0;
			G<=0;
		end
		5:begin 
			A<=0;
			B<=1;
			C<=0;
			D<=0;
			E<=1;
			F<=0;
			G<=0;
		end
		6:begin 
			A<=0;
			B<=1;
			C<=0;
			D<=0;
			E<=0;
			F<=0;
			G<=0;
		end
		7:begin 
			A<=0;
			B<=0;
			C<=0;
			D<=1;
			E<=1;
			F<=1;
			G<=1;
		end
		8:begin 
			A<=0;
			B<=0;
			C<=0;
			D<=0;
			E<=0;
			F<=0;
			G<=0;
		end
		9:begin 
			A<=0;
			B<=0;
			C<=0;
			D<=1;
			E<=1;
			F<=0;
			G<=0;
		end
		10:begin 
			A<=0;
			B<=0;
			C<=0;
			D<=1;
			E<=0;
			F<=0;
			G<=0;
		end
		11:begin 
			A<=1;
			B<=1;
			C<=0;
			D<=0;
			E<=0;
			F<=0;
			G<=0;
		end
		12:begin 
			A<=0;
			B<=1;
			C<=1;
			D<=0;
			E<=0;
			F<=0;
			G<=1;
		end
		13:begin 
			A<=1;
			B<=0;
			C<=0;
			D<=0;
			E<=0;
			F<=1;
			G<=0;
		end
		14:begin 
			A<=0;
			B<=1;
			C<=1;
			D<=0;
			E<=0;
			F<=0;
			G<=0;
		end
		15:begin 
			A<=0;
			B<=1;
			C<=1;
			D<=1;
			E<=0;
			F<=0;
			G<=0;
		end

		default: begin
		 
			A<=1;
			B<=1;
			C<=1;
			D<=1;
			E<=1;
			F<=1;
			G<=1;
		
		
		end




	endcase
end


endmodule 