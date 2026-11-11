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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_10.vh"
`include "ervp_ahb_define.vh"



module MUNOC_MODULE_42
(
	munoc_port_09,

	munoc_port_00,
	munoc_port_05,
	munoc_port_17,
	munoc_port_16,
	munoc_port_11,
	munoc_port_20,
	munoc_port_02,	
	munoc_port_10,
	munoc_port_14,	
	munoc_port_01,
	munoc_port_23,
	munoc_port_07,

	munoc_port_06,
	munoc_port_19,
	munoc_port_24,
	munoc_port_22,
	munoc_port_13,
	munoc_port_18,
	munoc_port_15,	
	munoc_port_21,
	munoc_port_03,	
	munoc_port_04,
	munoc_port_08,
	munoc_port_12
);



parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_09;

input wire munoc_port_00;
input wire [MUNOC_GPARA_0-1:0] munoc_port_05;
input wire [`BW_AHB_BURST-1:0] munoc_port_17;
input wire munoc_port_16;
input wire [`BW_AHB_PROT-1:0] munoc_port_11;
input wire [`BW_AHB_SIZE-1:0] munoc_port_20;
input wire [`BW_AHB_TRANS-1:0] munoc_port_02;
input wire munoc_port_10;
input wire [MUNOC_GPARA_1-1:0] munoc_port_14;
output wire munoc_port_01;
output wire munoc_port_23;
output wire [MUNOC_GPARA_1-1:0] munoc_port_07;

output wire munoc_port_06;
output wire [MUNOC_GPARA_0-1:0] munoc_port_19;
output wire [`BW_AHB_BURST-1:0] munoc_port_24;
output wire munoc_port_22;
output wire [`BW_AHB_PROT-1:0] munoc_port_13;
output wire [`BW_AHB_SIZE-1:0] munoc_port_18;
output wire [`BW_AHB_TRANS-1:0] munoc_port_15;
output wire munoc_port_21;
output wire [MUNOC_GPARA_1-1:0] munoc_port_03;
input wire munoc_port_04;
input wire munoc_port_08;
input wire [MUNOC_GPARA_1-1:0] munoc_port_12;

assign munoc_port_06 = (munoc_port_09==0)? munoc_port_00 : `AHB_TRANS_IDLE;
assign munoc_port_19 = munoc_port_05;
assign munoc_port_24 = munoc_port_17;
assign munoc_port_22 = munoc_port_16;
assign munoc_port_13 = munoc_port_11;
assign munoc_port_18 = munoc_port_20;
assign munoc_port_15 = munoc_port_02;
assign munoc_port_21 = munoc_port_10;
assign munoc_port_03 = munoc_port_14;
assign munoc_port_01 = (~munoc_port_09) & munoc_port_04;
assign munoc_port_23 = munoc_port_08;
assign munoc_port_07 = munoc_port_12;

endmodule
