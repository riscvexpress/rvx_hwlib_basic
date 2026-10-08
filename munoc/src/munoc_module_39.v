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
`include "ervp_ahb_define.vh"





module MUNOC_MODULE_39
(
	munoc_port_8,
	munoc_port_3,
	munoc_port_0,

	munoc_port_2,
	munoc_port_7,	
	munoc_port_1,

	munoc_port_4,
	munoc_port_6,
	munoc_port_5
);





parameter MUNOC_GPARA_1 = 16;
parameter MUNOC_GPARA_2 = 500;

parameter MUNOC_GPARA_0 = -1;

input wire munoc_port_8, munoc_port_3;
input wire munoc_port_0;

input wire munoc_port_2;
input wire [`BW_AHB_TRANS-1:0] munoc_port_7;
input wire munoc_port_1;

output wire [`MUNOC_GDEF_67-1:0] munoc_port_4;
output wire [`MUNOC_GDEF_67-1:0] munoc_port_6;
output wire [`MUNOC_GDEF_84-1:0] munoc_port_5;

wire munoc_signal_0;
wire munoc_signal_1;

`define MUNOC_LDEF_0 0
`define MUNOC_LDEF_1 1
reg munoc_signal_2;

assign munoc_signal_0 = munoc_port_2 & ((munoc_port_7==`AHB_TRANS_NONSEQ) | (munoc_port_7==`AHB_TRANS_SEQ));

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR

	MUNOC_MODULE_40
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_1),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_0
	(
		.munoc_port_2(munoc_port_8),
		.munoc_port_5(munoc_port_3),
		.munoc_port_1(munoc_port_0),
		.munoc_port_0(munoc_signal_0),
		.munoc_port_3(munoc_port_1),
		.munoc_port_6(munoc_signal_1),
		.munoc_port_4(),
		.munoc_port_7()
	);
`else
	assign munoc_signal_1 = 0;
`endif

assign munoc_port_4 = (MUNOC_GPARA_0==1)? 0 : $unsigned(munoc_signal_1);
assign munoc_port_6 = (MUNOC_GPARA_0==1)? $unsigned(munoc_signal_1) : 0;

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR

	always @(posedge munoc_port_8, negedge munoc_port_3)
	begin
		if(munoc_port_3==0)
			munoc_signal_2 <= `MUNOC_LDEF_0;
		else if(munoc_port_0)
			case(munoc_signal_2)
				`MUNOC_LDEF_0:
					if(munoc_signal_0 && munoc_port_1)
						munoc_signal_2 <= `MUNOC_LDEF_1;
					`MUNOC_LDEF_1:
						if(munoc_port_2 && (munoc_port_7==`AHB_TRANS_IDLE) && munoc_port_1)
							munoc_signal_2 <= `MUNOC_LDEF_0;
			endcase
	end

	MUNOC_MODULE_36
	#(
		.MUNOC_GPARA_0(`MUNOC_GDEF_84),
		.MUNOC_GPARA_1(`MUNOC_GDEF_45),
		.MUNOC_GPARA_2(`MUNOC_GDEF_75)
		)
	i_munoc_instance_1
	(
		.munoc_port_0(munoc_port_8),
		.munoc_port_1(munoc_port_3),
		.munoc_port_4(munoc_port_0),
		.munoc_port_2((munoc_signal_2==`MUNOC_LDEF_0)),
		.munoc_port_3(munoc_port_5)
	);
`else
	assign munoc_port_5 = 0;
`endif

`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_0
endmodule
