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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_06.vh"
`include "ervp_axi_define.vh"





module MUNOC_MODULE_41
(
	munoc_port_14,
	munoc_port_07,
	munoc_port_08,
	munoc_port_13,
	munoc_port_06,
	munoc_port_03,
	munoc_port_05,
	munoc_port_19,
	munoc_port_16,
	munoc_port_17,

	munoc_port_00,
	munoc_port_15,
	munoc_port_04,
	munoc_port_11,
	munoc_port_01,
	munoc_port_02,
	munoc_port_18,
	munoc_port_09,
	munoc_port_10,
	munoc_port_12
);





parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 8;

`include "ervp_log_util.vf"

localparam  MUNOC_LPARA_1 = LOG2RU(`NUM_BYTE(MUNOC_GPARA_2));
localparam  MUNOC_LPARA_0 = MUNOC_GPARA_2/8;

input wire [MUNOC_GPARA_3-1:0] munoc_port_14;
input wire munoc_port_07;
input wire munoc_port_08;
input wire munoc_port_13;
input wire [MUNOC_GPARA_2-1:0] munoc_port_06;
output wire [MUNOC_GPARA_2-1:0] munoc_port_03;
output wire munoc_port_05;
output wire munoc_port_19;
input wire [MUNOC_GPARA_0-1:0] munoc_port_16;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_2)-1:0] munoc_port_17;

output wire [MUNOC_GPARA_3-1:0] munoc_port_00;
output wire munoc_port_15;
output wire munoc_port_04;
output wire munoc_port_11;
output wire [MUNOC_GPARA_1-1:0] munoc_port_01;
input wire [MUNOC_GPARA_1-1:0] munoc_port_02;
input wire munoc_port_18;
input wire munoc_port_09;
output wire [MUNOC_GPARA_0-1:0] munoc_port_10;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_12;

genvar i,j;
wire [MUNOC_LPARA_1-1:0] munoc_signal_0;

assign munoc_port_00 = munoc_port_14;
assign munoc_port_15 = munoc_port_07;
assign munoc_port_04 = munoc_port_08;
assign munoc_port_11 = munoc_port_13;
assign munoc_port_10 = munoc_port_16;

assign munoc_port_05 = munoc_port_18;
assign munoc_port_19 = munoc_port_09;

assign munoc_signal_0 = $unsigned(munoc_port_14);

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(MUNOC_LPARA_0),
	.BW_SELECT(MUNOC_LPARA_1)
)
i_munoc_instance_1
(
	.data_input_list(munoc_port_06),
	.select(munoc_signal_0),
	.data_output(munoc_port_01)
);

ERVP_MUX
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_1)),
	.NUM_DATA(MUNOC_LPARA_0),
	.BW_SELECT(MUNOC_LPARA_1)
)
i_munoc_instance_0
(
	.data_input_list(munoc_port_17),
	.select(munoc_signal_0),
	.data_output(munoc_port_12)
);

generate
	for(i=0; i<MUNOC_LPARA_0; i=i+1)
	begin : i_duplicate_rdata
		assign munoc_port_03 [MUNOC_GPARA_1*(i+1)-1 -:MUNOC_GPARA_1] = munoc_port_02;
	end
endgenerate

endmodule
