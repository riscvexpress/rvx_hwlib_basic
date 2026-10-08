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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_01.vh"





module MUNOC_MODULE_45 (
	munoc_port_05,
	munoc_port_10,
	munoc_port_03,
	munoc_port_04,
	munoc_port_06,
	munoc_port_00,

	munoc_port_07,
	munoc_port_01,
	munoc_port_02,
	munoc_port_09,
	munoc_port_08
);





parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_2 = 1;

input wire munoc_port_05;
input wire munoc_port_10;
output wire munoc_port_03;
input wire munoc_port_04;
input	wire [MUNOC_GPARA_1-1:0] munoc_port_06;
input wire munoc_port_00;

input wire munoc_port_07;
input wire munoc_port_01;
output wire [MUNOC_GPARA_0-1:0] munoc_port_02;
input wire [MUNOC_GPARA_0-1:0] munoc_port_09;
output wire [MUNOC_GPARA_0*MUNOC_GPARA_1-1:0] munoc_port_08;

genvar i;
integer j;

wire [MUNOC_GPARA_0-1:0] munoc_signal_0;
wire [MUNOC_GPARA_0-1:0] munoc_signal_3;
wire [MUNOC_GPARA_0-1:0] munoc_signal_1;

wire munoc_signal_4;
wire [MUNOC_GPARA_0-1:0] munoc_signal_2;

generate
for(i=0; i<MUNOC_GPARA_0; i=i+1)
begin : i_gen_buffer
	ERVP_ASYNCH_FIFO
	#(
		.BW_DATA(MUNOC_GPARA_1),
		.DEPTH(MUNOC_GPARA_2)
	)
	i_munoc_instance_1
	(
		.wclk(munoc_port_05),
		.wrstnn(munoc_port_10),
		.wready(munoc_signal_0[i]),
		.wrequest(munoc_signal_3[i]),
		.wdata(munoc_port_06),
		.rclk(munoc_port_07),
		.rrstnn(munoc_port_01),
		.rready(munoc_port_02[i]),
		.rrequest(munoc_port_09[i]),
		.rdata(munoc_port_08[MUNOC_GPARA_1*(i+1)-1-:MUNOC_GPARA_1]),
		.wfull(),
		.rempty()
	);
end
endgenerate

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(MUNOC_GPARA_0),
	.UP(0),
	.CIRCULAR(1)
)
i_munoc_instance_0
(
	.clk(munoc_port_05),
	.rstnn(munoc_port_10),
	.enable(1'b 1),
	.init(munoc_port_00),
	.count(munoc_signal_4),
	.value(munoc_signal_2),
	.is_first_count(),
	.is_last_count()
);

generate
for(i=0; i<MUNOC_GPARA_0; i=i+1)
begin : i_gen_write_request
	assign munoc_signal_1[i] = munoc_signal_0[i]&munoc_signal_2[i];
	assign munoc_signal_3[i] = munoc_signal_1[i]&munoc_port_04;
end
endgenerate

assign munoc_port_03 = |munoc_signal_1;
assign munoc_signal_4 = munoc_port_03 & munoc_port_04;

endmodule
