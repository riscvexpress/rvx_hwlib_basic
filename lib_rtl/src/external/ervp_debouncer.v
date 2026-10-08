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


module ERVP_DEBOUNCER
(
	clk,
	rstnn,
	enable,
	tick,
	input_raw,
	input_debounced
);


parameter BW_DATA = 1;
parameter NUM_CONSECUTIVE = 4; 

localparam  RVX_LPARA_0 = 3;

input wire clk, rstnn;
input wire tick;
input wire enable;
input wire [BW_DATA-1:0] input_raw;
output wire [BW_DATA-1:0] input_debounced;

reg [RVX_LPARA_0-1:0] rvx_signal_0 [BW_DATA-1:0];
reg [BW_DATA-1:0] rvx_signal_1;

genvar i;

generate
	for(i=0; i<BW_DATA; i=i+1)
	begin : i_generate
		always@(posedge clk, negedge rstnn)
		begin
			if(rstnn==0)
			begin
				rvx_signal_0[i] <= 0;
				rvx_signal_1[i] <= 0;
			end
			else if(~enable)
			begin
				rvx_signal_0[i] <= 0;
				rvx_signal_1[i] <= input_raw[i];
			end
			else if(tick)
			begin
				if(input_raw[i]==rvx_signal_1[i])
					rvx_signal_0[i] <= 0;
				else if(rvx_signal_0[i]==(NUM_CONSECUTIVE-1))
				begin
					rvx_signal_0[i] <= 0;
					rvx_signal_1[i] <= input_raw[i];
				end
				else
					rvx_signal_0[i] <= rvx_signal_0[i] + 1;
			end
		end

		assign input_debounced[i] = enable? rvx_signal_1[i] : input_raw[i];
	end
endgenerate

endmodule
