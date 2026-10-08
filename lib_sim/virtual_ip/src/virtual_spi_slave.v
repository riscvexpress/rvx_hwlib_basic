// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`default_nettype wire
`include "timescale.vh"


module VIRTUAL_SPI_SLAVE (
	 csn,
	 sck,
	 din,
	 dout
);


        input   csn;
        input   sck;
        input   din;
        inout  dout;

	
	
	
	wire debug = 1'b1;

	wire cpol = 1'b0;
	wire cpha  = 1'b0;

	reg [7:0] rvx_signal_10 [7:0]; 
	reg [2:0] rvx_signal_06;   
	reg [7:0] rvx_signal_00;    

	reg [7:0] rvx_signal_09, rvx_signal_03;  

	reg [2:0] rvx_signal_05;
	reg       rvx_signal_07;

	wire rvx_signal_02;

        initial
        begin
         rvx_signal_10[0] = 8'h11;
         rvx_signal_10[1] = 8'h22;
         rvx_signal_10[2] = 8'h33;
         rvx_signal_10[3] = 8'h44;
         rvx_signal_10[4] = 8'h55;
         rvx_signal_10[5] = 8'h66;
         rvx_signal_10[6] = 8'h77;
         rvx_signal_10[7] = 8'h88;
         rvx_signal_09    = 8'h99;
        end
	
	
	

	assign rvx_signal_02 = cpol ^ cpha ^ sck;

	
	always @(posedge rvx_signal_02)
	  rvx_signal_09 <= #1 {rvx_signal_09[6:0],din};

	always @(posedge rvx_signal_02)
	  if (&rvx_signal_05)
	    rvx_signal_03 <= #1 rvx_signal_10[rvx_signal_06];
	  else
	    rvx_signal_03 <= #1 {rvx_signal_03[6:0],1'bx};

	assign dout = (csn==1'b 0)? rvx_signal_03[7] : 1'b z;

	
	always @(posedge rvx_signal_02, posedge csn)
	  if(csn)
	    rvx_signal_05 <= #1 3'b111;
	  else
	    rvx_signal_05 <= #1 rvx_signal_05 - 3'h1;

	
        always @(posedge rvx_signal_02)
	  rvx_signal_07 <= #1 ~(|rvx_signal_05);

	always @(negedge rvx_signal_02)
          if (rvx_signal_07) begin
	    rvx_signal_10[rvx_signal_06] <= #1 rvx_signal_09;
	    rvx_signal_06      <= #1 rvx_signal_06 + 1'b1;
	  end

	initial
	begin
	  rvx_signal_05=3'b111;
	  rvx_signal_06 = 0;
	  rvx_signal_03 = rvx_signal_10[rvx_signal_06];
	end
endmodule

