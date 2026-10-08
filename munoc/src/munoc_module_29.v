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
`include "ervp_axi_define.vh"



module MUNOC_MODULE_29
(
	munoc_port_26,

	munoc_port_52,
	munoc_port_49,
	munoc_port_53,
	munoc_port_60,
	munoc_port_44,
	munoc_port_58,
	munoc_port_31,

	munoc_port_29,
	munoc_port_22,
	munoc_port_06,
	munoc_port_46,
	munoc_port_07,
	munoc_port_42, 

	munoc_port_38,
	munoc_port_39,
	munoc_port_59,
	munoc_port_36,

	munoc_port_55,
	munoc_port_04,
	munoc_port_15,
	munoc_port_16,
	munoc_port_50,
	munoc_port_10,
	munoc_port_35,

	munoc_port_12,
	munoc_port_23,
	munoc_port_25,
	munoc_port_08,
	munoc_port_11,
	munoc_port_18,

	munoc_port_00,
	munoc_port_33,
	munoc_port_20,
	munoc_port_47,
	munoc_port_03,
	munoc_port_21,
	munoc_port_09,

	munoc_port_30,
	munoc_port_43,
	munoc_port_17,
	munoc_port_37,
	munoc_port_56,
	munoc_port_41, 

	munoc_port_32,
	munoc_port_01,
	munoc_port_14,
	munoc_port_19,

	munoc_port_24,
	munoc_port_54,
	munoc_port_57,
	munoc_port_48,
	munoc_port_13,
	munoc_port_34,
	munoc_port_05,

	munoc_port_45,
	munoc_port_28,
	munoc_port_27,
	munoc_port_51,
	munoc_port_02,
	munoc_port_40
);



parameter MUNOC_GPARA_2 = `DEFAULT_BW_AXI_TID;
parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_26;

input wire [MUNOC_GPARA_2-1:0] munoc_port_52;
input wire [MUNOC_GPARA_0-1:0] munoc_port_49;
input wire [`BW_AXI_ALEN-1:0] munoc_port_53;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_60;
input wire [`BW_AXI_ABURST-1:0] munoc_port_44;
input wire munoc_port_58;
output wire munoc_port_31;

input wire [MUNOC_GPARA_2-1:0] munoc_port_29;
input wire [MUNOC_GPARA_1-1:0] munoc_port_22;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_06;
input wire munoc_port_46;
input wire munoc_port_07;
output wire munoc_port_42;

output wire [MUNOC_GPARA_2-1:0] munoc_port_38;
output wire [`BW_AXI_BRESP-1:0] munoc_port_39;
output wire munoc_port_59;
input wire munoc_port_36;

input wire [MUNOC_GPARA_2-1:0] munoc_port_55;
input wire [MUNOC_GPARA_0-1:0] munoc_port_04;
input wire [`BW_AXI_ALEN-1:0] munoc_port_15;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_16;
input wire [`BW_AXI_ABURST-1:0] munoc_port_50;
input wire munoc_port_10;
output wire munoc_port_35;

output wire [MUNOC_GPARA_2-1:0] munoc_port_12;
output wire [MUNOC_GPARA_1-1:0] munoc_port_23;
output wire [`BW_AXI_RRESP-1:0] munoc_port_25;
output wire munoc_port_08;
output wire munoc_port_11;
input wire munoc_port_18;

output wire [MUNOC_GPARA_2-1:0] munoc_port_00;
output wire [MUNOC_GPARA_0-1:0] munoc_port_33;
output wire [`BW_AXI_ALEN-1:0] munoc_port_20;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_47;
output wire [`BW_AXI_ABURST-1:0] munoc_port_03;
output wire munoc_port_21;
input wire munoc_port_09;

output wire [MUNOC_GPARA_2-1:0] munoc_port_30;
output wire [MUNOC_GPARA_1-1:0] munoc_port_43;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_17;
output wire munoc_port_37;
output wire munoc_port_56;
input wire munoc_port_41;

input wire [MUNOC_GPARA_2-1:0] munoc_port_32;
input wire [`BW_AXI_BRESP-1:0] munoc_port_01;
input wire munoc_port_14;
output wire munoc_port_19;

output wire [MUNOC_GPARA_2-1:0] munoc_port_24;
output wire [MUNOC_GPARA_0-1:0] munoc_port_54;
output wire [`BW_AXI_ALEN-1:0] munoc_port_57;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_48;
output wire [`BW_AXI_ABURST-1:0] munoc_port_13;
output wire munoc_port_34;
input wire munoc_port_05;

input wire [MUNOC_GPARA_2-1:0] munoc_port_45;
input wire [MUNOC_GPARA_1-1:0] munoc_port_28;
input wire [`BW_AXI_RRESP-1:0] munoc_port_27;
input wire munoc_port_51;
input wire munoc_port_02;
output wire munoc_port_40;

assign munoc_port_00 = munoc_port_52;
assign munoc_port_33 = munoc_port_49;
assign munoc_port_20 = munoc_port_53;
assign munoc_port_47 = munoc_port_60;
assign munoc_port_03 = munoc_port_44;
assign munoc_port_21 = (~munoc_port_26) & munoc_port_58;
assign munoc_port_31 = (~munoc_port_26) & munoc_port_09;

assign munoc_port_30 = munoc_port_29;
assign munoc_port_43 = munoc_port_22;
assign munoc_port_17 = munoc_port_06;
assign munoc_port_37 = munoc_port_46;
assign munoc_port_56 = (~munoc_port_26) & munoc_port_07;
assign munoc_port_42 = (~munoc_port_26) & munoc_port_41;

assign munoc_port_38 = munoc_port_32;
assign munoc_port_39 = munoc_port_01;
assign munoc_port_59 = (~munoc_port_26) & munoc_port_14;
assign munoc_port_19 = (~munoc_port_26) & munoc_port_36;

assign munoc_port_24 = munoc_port_55;
assign munoc_port_54 = munoc_port_04;
assign munoc_port_57 = munoc_port_15;
assign munoc_port_48 = munoc_port_16;
assign munoc_port_13 = munoc_port_50;
assign munoc_port_34 = (~munoc_port_26) & munoc_port_10;
assign munoc_port_35 = (~munoc_port_26) & munoc_port_05;

assign munoc_port_12 = munoc_port_45;
assign munoc_port_23 = munoc_port_28;
assign munoc_port_25 = munoc_port_27;
assign munoc_port_08 = munoc_port_51;
assign munoc_port_11 = (~munoc_port_26) & munoc_port_02;
assign munoc_port_40 = (~munoc_port_26) & munoc_port_18;

endmodule
