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



module ERVP_BARREL_SHIFTER
(
	data_input,
	shift_amount,
	data_output
);



parameter BW_DATA = 32;
parameter BW_SHIFT_AMOUNT = 4;
parameter SIGNED_AMOUNT = 1;
parameter PLUS_TO_LEFT = 1;
parameter ARITHMETIC_SHIFT = 0;
parameter CIRCULAR_SHIFT = 0;
parameter MSB_FILL_VALUE = 0;
parameter LSB_FILL_VALUE = 0;

localparam  RVX_LPARA_0 = BW_SHIFT_AMOUNT;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire [BW_DATA-1:0] data_input;
input wire [BW_SHIFT_AMOUNT-1:0] shift_amount;
output wire [BW_DATA-1:0] data_output;

genvar i;

reg [BW_SHIFT_AMOUNT-1:0] rvx_signal_2;
reg rvx_signal_4; 
reg rvx_signal_5;

wire [BW_DATA-1:0] rvx_signal_1 [RVX_LPARA_0-1:0];
wire [BW_DATA-1:0] rvx_signal_6 [RVX_LPARA_0-1:0];
wire rvx_signal_0, rvx_signal_3;

assign rvx_signal_0 = (ARITHMETIC_SHIFT==1)? data_input[BW_DATA-1] : MSB_FILL_VALUE;
assign rvx_signal_3 = (ARITHMETIC_SHIFT==1)? 0 : LSB_FILL_VALUE;

always@(*)
begin
	rvx_signal_4 = 0;
	rvx_signal_2 = shift_amount;
	rvx_signal_5 = 0;
	if(PLUS_TO_LEFT)
	begin
		if(SIGNED_AMOUNT)
		begin
			if(shift_amount[BW_SHIFT_AMOUNT-1])
			begin
				rvx_signal_4 = 1;
				rvx_signal_2 = ~shift_amount;
				rvx_signal_5 = 1;
			end
			else
			begin
				rvx_signal_4 = 0;
				rvx_signal_2 = shift_amount;
			end
		end
		else
		begin
			rvx_signal_4 = 0;
			rvx_signal_2 = shift_amount;
		end
	end
	else
	begin
		if(SIGNED_AMOUNT)
		begin
			if(shift_amount[BW_SHIFT_AMOUNT-1])
			begin
				rvx_signal_4 = 0;
				rvx_signal_2 = ~shift_amount;
				rvx_signal_5 = 1;
			end
			else
			begin
				rvx_signal_4 = 1;
				rvx_signal_2 = shift_amount;
			end
		end
		else
		begin
			rvx_signal_4 = 1;
			rvx_signal_2 = shift_amount;
		end
	end
end

assign rvx_signal_1[0] = data_input;
generate
	for(i=1; i<RVX_LPARA_0; i=i+1)
	begin : i_step_input
		assign rvx_signal_1[i] = rvx_signal_6[i-1];
	end
endgenerate

generate
	for(i=0; i<(RVX_LPARA_0-1); i=i+1)
	begin : i_step
		RVX_MODULE_132
		#(
			.RVX_GPARA_1(BW_DATA),
			.RVX_GPARA_0((2**i)),
			.RVX_GPARA_2(CIRCULAR_SHIFT)
		)
		i_rvx_instance_1
		(
			.rvx_port_1(rvx_signal_1[i]),
			.rvx_port_5(rvx_signal_2[i]),
			.rvx_port_4(rvx_signal_4),
			.rvx_port_2(rvx_signal_0),
			.rvx_port_0(rvx_signal_3),
			.rvx_port_3(rvx_signal_6[i])
		);
	end
endgenerate

RVX_MODULE_132
#(
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_0((SIGNED_AMOUNT==1)? 1 : (2**(RVX_LPARA_0-1))),
	.RVX_GPARA_2(CIRCULAR_SHIFT)
)
i_rvx_instance_0
(
	.rvx_port_1(rvx_signal_1[RVX_LPARA_0-1]),
	.rvx_port_5((SIGNED_AMOUNT==1)? rvx_signal_5 : rvx_signal_2[RVX_LPARA_0-1]),
	.rvx_port_4(rvx_signal_4),
	.rvx_port_2(rvx_signal_0),
	.rvx_port_0(rvx_signal_3),
	.rvx_port_3(data_output)
);

endmodule
