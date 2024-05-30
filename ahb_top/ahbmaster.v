//----------------------------------------------------------------
// Module Name: ahb_master
// The matser module of ahb protocol
// Author: WangFW modified by William Inselberger and Leonardo Guedes
// Created on 2020-11-3 and modified on 2024-05
//----------------------------------------------------------------
// Date: 2020-11-4
// Debug
//----------------------------------------------------------------


module ahbmaster(
  input hclk,
  input hresetn,
  input [7:0] din,
  input wr,
  input hreadyout,
  input hresp,
  input [7:0] hrdata,
  input [2:0] hburst,
  output reg hwrite,
  output reg [2:0] hsize,
  output reg [3:0] hprot,
  output reg [1:0] htrans,
  output reg hmastlock,
  output  hready,
  output reg [7:0] hwdata,
  output reg [7:0] leitura
);

//----------------------------------------------------
// The definitions for state machine
//----------------------------------------------------

reg [1:0] state, next_state;
parameter  s1 = 2'b00, WRITE = 2'b01, READ = 2'b10;

assign hready=hreadyout;
//----------------------------------------------------
// The state machine
//----------------------------------------------------

always @(posedge hclk, negedge hresetn) begin
  if(!hresetn) begin
    state <= s1;
  end
  else begin
    state <= next_state;
  end
end


always @(*) begin
  case(state)
   
    s1: begin
      if(wr == 1'b1) begin
        next_state = WRITE;
      end
      else begin
        next_state = READ;
      end
    end
    WRITE: begin
		
        next_state = s1;
      end
   
      
    
    READ: begin
     
        next_state = s1;

     
    end
    default: begin
      next_state = s1;
    end
  endcase
end

always @(posedge hclk, negedge hresetn) begin
  if(!hresetn) begin


    hwrite <= 1'b0;
    hsize <= 3'b000;
    hprot <= 4'b0000;
    htrans <= 2'b10;
    hmastlock <= 1'b0;
    hwdata <= 8'h0_0;

  end
  else begin
    case(next_state)
      
        s1: begin 


        hwrite <= wr;
        hwdata <= hwdata;
		  htrans<=2'b00;
      end
      WRITE: begin 

        hwrite <= 1;
        hwdata <= din;
		  if(hburst==0)
		  htrans<=2'b10;
		  else htrans=2'b11;
      end
      READ: begin 

 
        hwrite <= 0;
		  hwdata<=hrdata;
		  leitura<=hrdata;
		  if(hburst==0)
		  htrans<=2'b10;
		  else htrans=2'b11;
      end
      default: begin 


        hwrite <= hwrite;
        hwdata <= hwdata;
		  htrans<=2'b00;
      end
    endcase
  end
end


endmodule

