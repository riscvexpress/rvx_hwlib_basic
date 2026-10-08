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
`include "munoc_extended_config.vh"
`include "munoc_include_10.vh"





module MUNOC_MODULE_34
(
	munoc_port_2,
	munoc_port_5,

	munoc_port_6,
	munoc_port_4,
	munoc_port_1,

	munoc_port_0,
	munoc_port_3
);





parameter MUNOC_GPARA_1 = 16;
parameter MUNOC_GPARA_2 = 100;

parameter MUNOC_GPARA_0 = -1;

input wire munoc_port_2, munoc_port_5;
input wire munoc_port_6;
input wire munoc_port_4;
input wire munoc_port_1;

output wire munoc_port_0;
output wire [`MUNOC_GDEF_84-1:0] munoc_port_3;

wire munoc_signal_0;

assign munoc_signal_0 = munoc_port_6 & munoc_port_4;

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR

	MUNOC_MODULE_40
	#(
		.BW_COUNTER(MUNOC_GPARA_1),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_0
	(
		.munoc_port_2(munoc_port_2),
		.munoc_port_5(munoc_port_5),
		.munoc_port_0(munoc_signal_0),
		.munoc_port_3(munoc_port_1),
		.munoc_port_6(munoc_port_0),
		.munoc_port_4(),
		.munoc_port_7()
	);
`else
	assign munoc_port_0 = 0;
`endif

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR

	MUNOC_MODULE_36
	#(
		.MUNOC_GPARA_0(`MUNOC_GDEF_84),
		.MUNOC_GPARA_1(`MUNOC_GDEF_45),
		.MUNOC_GPARA_2(`MUNOC_GDEF_75)
	)
	i_munoc_instance_1
	(
		.munoc_port_0(munoc_port_2),
		.munoc_port_1(munoc_port_5),
		.munoc_port_2(~munoc_signal_0),
		.munoc_port_3(munoc_port_3)
	);
`endif

endmodule

