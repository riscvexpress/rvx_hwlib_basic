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


`include "ervp_global.vh"




module RVX_MODULE_130
(
	
	rvx_port_6
	,rvx_port_2
	,rvx_port_4

	
	,rvx_port_7
	,rvx_port_0
	,rvx_port_5
	,rvx_port_3
	,rvx_port_1
);




`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter	RVX_GPARA_2 = 18432000;	
parameter	RVX_GPARA_0 = 48000; 		
parameter	RVX_GPARA_1 = 24;
localparam  RVX_LPARA_1 = RVX_GPARA_0 * 2 * RVX_GPARA_1;
localparam  RVX_LPARA_2 = (RVX_GPARA_2 / (RVX_GPARA_0*2)) -1;	
localparam  RVX_LPARA_0 = (RVX_GPARA_2 / (RVX_LPARA_1*2)) -1;	

input wire rvx_port_6;
input wire rvx_port_2;
input wire rvx_port_4;
output reg rvx_port_7;
output reg rvx_port_0;
output wire rvx_port_5;
input wire [RVX_GPARA_1-1:0] rvx_port_3;
input wire [RVX_GPARA_1-1:0] rvx_port_1;

reg [REQUIRED_BITWIDTH_UNSIGNED(RVX_LPARA_2)-1:0] rvx_signal_2;
reg [REQUIRED_BITWIDTH_UNSIGNED(RVX_LPARA_0)-1:0] rvx_signal_1;

reg [RVX_GPARA_1-1:0] rvx_signal_4;
reg [RVX_GPARA_1-1:0] rvx_signal_5;

reg [RVX_GPARA_1:0] rvx_signal_0;

reg rvx_signal_3;
wire rvx_signal_6;

always@(posedge rvx_port_4, negedge rvx_port_6)
begin
	if(rvx_port_6==0)
		rvx_signal_3 <= 0;
	else
		rvx_signal_3 <= rvx_port_2;
end

assign rvx_signal_6 = rvx_signal_3 & (~rvx_port_2);

always @ (posedge rvx_port_4, negedge rvx_port_6)
begin
	if(rvx_port_6==0)
	begin
		rvx_port_7 <= 0;
		rvx_signal_2 <= 0;
		
		rvx_signal_0 <= 0;
	end
	else if(rvx_signal_6)
	begin
		rvx_port_7 <= 0;
		rvx_signal_2 <= 0;
		
		rvx_signal_0 <= 0;
	end
	else
		
		
	begin
		if(rvx_signal_2 == RVX_LPARA_2)
		begin
			rvx_signal_2 <= 0;
			if(rvx_port_7 == 1)
			begin
				
				
				rvx_port_7 <= 0;
				
				
				rvx_signal_0 <= {rvx_signal_0[RVX_GPARA_1-1], rvx_signal_4};
			end
			else
			begin
				
				
				rvx_port_7 <= 1;
				
				
				rvx_signal_0 <= {rvx_signal_0[RVX_GPARA_1-1], rvx_signal_5};
			end
		end
		else
		begin
			if ((rvx_signal_1 == RVX_LPARA_0) && (rvx_port_0 == 1))
			begin
				
				
				rvx_signal_0 <= {rvx_signal_0[RVX_GPARA_1-1:0],1'b0};
			end
			rvx_signal_2 <= rvx_signal_2 + 1;
		end
	end
end

always@(posedge rvx_port_4, negedge rvx_port_6)
begin
	if(rvx_port_6==0)
	begin
		rvx_port_0 <= 0;
		rvx_signal_1 <= 0;
	end
	else if(rvx_signal_6)
	begin
		rvx_port_0 <= 0;
		rvx_signal_1 <= 0;
	end
	else
		
		
	begin
		if(rvx_signal_1 == RVX_LPARA_0)
		begin
			rvx_signal_1 <= 0;
			rvx_port_0 <= ~rvx_port_0;
		end
		else
			rvx_signal_1 <= rvx_signal_1 + 1;
	end
end

always @ (posedge rvx_port_4, negedge rvx_port_6)
begin
	if(rvx_port_6==0)
	begin
		rvx_signal_4 <= 0;
		rvx_signal_5 <= 0;
	end
	else if(rvx_signal_6)
	begin
		rvx_signal_4 <= 0;
		rvx_signal_5 <= 0;
	end
	else
	begin
		
		rvx_signal_5 <= rvx_port_1;
		rvx_signal_4 <= rvx_port_3;
	end
end

assign rvx_port_5 = rvx_signal_0[RVX_GPARA_1];

endmodule
