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
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "ervp_ahb_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_04.vh"
`include "munoc_include_08.vh"
`include "munoc_include_01.vh"
`include "munoc_control.vh"
`include "munoc_include_02.vh"





module MUNOC_MODULE_01
(
	munoc_port_24,
	munoc_port_30,

	munoc_port_03,
	munoc_port_02,
	munoc_port_26,
	munoc_port_07,
	munoc_port_39,
	munoc_port_15,
	munoc_port_44,

	munoc_port_14,
	munoc_port_50,
	munoc_port_11,
	munoc_port_34,
	munoc_port_09,
	munoc_port_00, 

	munoc_port_22,
	munoc_port_29,
	munoc_port_10,
	munoc_port_36,

	munoc_port_37,
	munoc_port_38,
	munoc_port_18,
	munoc_port_47,
	munoc_port_21,
	munoc_port_16,
	munoc_port_01,

	munoc_port_52,
	munoc_port_53,
	munoc_port_33,
	munoc_port_19,
	munoc_port_27,
	munoc_port_05,

	munoc_port_17,
	munoc_port_20,
	munoc_port_48,
	munoc_port_45,

	munoc_port_28,

	munoc_port_25,
	munoc_port_51,
	munoc_port_23,
	munoc_port_46,
	munoc_port_43,
	munoc_port_06,
	munoc_port_31,	
	munoc_port_04,
	munoc_port_32,
	munoc_port_35,
	munoc_port_49,
	munoc_port_40,
	munoc_port_08,

	munoc_port_41,
	munoc_port_12,
	munoc_port_13,
	munoc_port_42
);





parameter MUNOC_GPARA_4 = "";
parameter MUNOC_GPARA_2 = -1;
parameter MUNOC_GPARA_1 = 32;
parameter MUNOC_GPARA_0 = 32;

parameter MUNOC_GPARA_3 = `REQUIRED_BW_OF_SLAVE_TID;

localparam  MUNOC_LPARA_0 = "AHB";

input wire munoc_port_24, munoc_port_30;

input wire [MUNOC_GPARA_3-1:0] munoc_port_03;
input wire [MUNOC_GPARA_1-1:0] munoc_port_02;
input wire [`BW_AXI_ALEN-1:0] munoc_port_26;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_07;
input wire [`BW_AXI_ABURST-1:0] munoc_port_39;
input wire munoc_port_15;
output wire munoc_port_44;

input wire [MUNOC_GPARA_3-1:0] munoc_port_14;
input wire [MUNOC_GPARA_0-1:0] munoc_port_50;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_port_11;
input wire munoc_port_34;
input wire munoc_port_09;
output wire munoc_port_00;

output wire [MUNOC_GPARA_3-1:0] munoc_port_22;
output wire [`BW_AXI_BRESP-1:0] munoc_port_29;
output wire munoc_port_10;
input wire munoc_port_36;

input wire [MUNOC_GPARA_3-1:0] munoc_port_37;
input wire [MUNOC_GPARA_1-1:0] munoc_port_38;
input wire [`BW_AXI_ALEN-1:0] munoc_port_18;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_47;
input wire [`BW_AXI_ABURST-1:0] munoc_port_21;
input wire munoc_port_16;
output wire munoc_port_01;

output wire [MUNOC_GPARA_3-1:0] munoc_port_52;
output wire [MUNOC_GPARA_0-1:0] munoc_port_53;
output wire [`BW_AXI_RRESP-1:0] munoc_port_33;
output wire munoc_port_19;
output wire munoc_port_27;
input wire munoc_port_05;

output wire munoc_port_17;
input wire [`MUNOC_GDEF_02-1:0] munoc_port_20;
input wire [`MUNOC_GDEF_49-1:0] munoc_port_48;
input wire munoc_port_45;

input wire munoc_port_28;

output wire munoc_port_25;
output wire [MUNOC_GPARA_1-1:0] munoc_port_51;
output wire [`BW_AHB_BURST-1:0] munoc_port_23;
output wire munoc_port_46;
output wire [`BW_AHB_PROT-1:0] munoc_port_43;
output wire [`BW_AHB_SIZE-1:0] munoc_port_06;
output wire [`BW_AHB_TRANS-1:0] munoc_port_31;
output wire munoc_port_04;
output wire [MUNOC_GPARA_0-1:0] munoc_port_32;
output wire munoc_port_35;

input wire munoc_port_49;
input wire munoc_port_40;
input wire [MUNOC_GPARA_0-1:0] munoc_port_08;

input wire [`BW_SVRING_LINK-1:0] munoc_port_41;
output wire munoc_port_12;
output wire [`BW_SVRING_LINK-1:0] munoc_port_13;
input wire munoc_port_42;

wire munoc_signal_05;
wire [MUNOC_GPARA_1-1:0] munoc_signal_08;
wire [`BW_AHB_BURST-1:0] munoc_signal_01;
wire munoc_signal_09;
wire [`BW_AHB_PROT-1:0] munoc_signal_13;
wire [`BW_AHB_SIZE-1:0] munoc_signal_14;
wire [`BW_AHB_TRANS-1:0] munoc_signal_03;
wire munoc_signal_15;
wire [MUNOC_GPARA_0-1:0] munoc_signal_02;
wire munoc_signal_07;
wire munoc_signal_16;
wire [MUNOC_GPARA_0-1:0] munoc_signal_11;

wire [`MUNOC_GDEF_32-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_32-1:0] munoc_signal_12;
wire [`MUNOC_GDEF_24-1:0] munoc_signal_04;
wire [`MUNOC_GDEF_78-1:0] munoc_signal_10;
wire munoc_signal_00;

MUNOC_MODULE_21
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_3),
	.MUNOC_GPARA_1(MUNOC_GPARA_1),
	.MUNOC_GPARA_0(MUNOC_GPARA_0)
)
i_munoc_instance_2
(
	.munoc_port_27(munoc_port_24),
	.munoc_port_07(munoc_port_30),

	.munoc_port_38(munoc_port_03),
	.munoc_port_36(munoc_port_02),
	.munoc_port_44(munoc_port_26),
	.munoc_port_18(munoc_port_07),
	.munoc_port_24(munoc_port_39),
	.munoc_port_13(munoc_port_15),
	.munoc_port_34(munoc_port_44),

	.munoc_port_42(munoc_port_14),
	.munoc_port_39(munoc_port_50),
	.munoc_port_25(munoc_port_11),
	.munoc_port_01(munoc_port_34),
	.munoc_port_20(munoc_port_09),
	.munoc_port_22(munoc_port_00),

	.munoc_port_37(munoc_port_22),
	.munoc_port_35(munoc_port_29),
	.munoc_port_33(munoc_port_10),
	.munoc_port_31(munoc_port_36),

	.munoc_port_11(munoc_port_37),
	.munoc_port_10(munoc_port_38),
	.munoc_port_23(munoc_port_18),
	.munoc_port_16(munoc_port_47),
	.munoc_port_32(munoc_port_21),
	.munoc_port_05(munoc_port_16),
	.munoc_port_08(munoc_port_01),

	.munoc_port_06(munoc_port_52),
	.munoc_port_15(munoc_port_53),
	.munoc_port_17(munoc_port_33),
	.munoc_port_30(munoc_port_19),
	.munoc_port_04(munoc_port_27),
	.munoc_port_02(munoc_port_05),

	.munoc_port_09(munoc_signal_05),
	.munoc_port_19(munoc_signal_08),
	.munoc_port_28(munoc_signal_01),
	.munoc_port_03(munoc_signal_09),
	.munoc_port_41(munoc_signal_13),
	.munoc_port_14(munoc_signal_14),
	.munoc_port_29(munoc_signal_03),
	.munoc_port_43(munoc_signal_15),
	.munoc_port_21(munoc_signal_02),
	.munoc_port_26(),
	.munoc_port_12(munoc_signal_07),
	.munoc_port_00(munoc_signal_16),
	.munoc_port_40(munoc_signal_11)
);

MUNOC_MODULE_44
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_0),
	.MUNOC_GPARA_1(MUNOC_GPARA_1)
)
i_munoc_instance_1
(
	.munoc_port_13(munoc_port_28),

	.munoc_port_07(munoc_signal_05),
	.munoc_port_21(munoc_signal_08),
	.munoc_port_12(munoc_signal_01),
	.munoc_port_10(munoc_signal_09),
	.munoc_port_17(munoc_signal_13),
	.munoc_port_02(munoc_signal_14),
	.munoc_port_04(munoc_signal_03),	
	.munoc_port_22(munoc_signal_15),
	.munoc_port_18(munoc_signal_02),	
	.munoc_port_24(munoc_signal_07),
	.munoc_port_15(munoc_signal_16),
	.munoc_port_14(munoc_signal_11),

	.munoc_port_11(munoc_port_25),
	.munoc_port_05(munoc_port_51),
	.munoc_port_01(munoc_port_23),
	.munoc_port_16(munoc_port_46),
	.munoc_port_08(munoc_port_43),
	.munoc_port_09(munoc_port_06),
	.munoc_port_19(munoc_port_31),	
	.munoc_port_06(munoc_port_04),
	.munoc_port_23(munoc_port_32),	
	.munoc_port_20(munoc_port_49),
	.munoc_port_00(munoc_port_40),
	.munoc_port_03(munoc_port_08)
);

assign munoc_port_35 = munoc_port_49;

`ifdef __MUNOC_INCLUDE_CONTROLLER

assign munoc_signal_06 = 0;

MUNOC_MODULE_35
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(MUNOC_GPARA_2),
	.MUNOC_GPARA_1(MUNOC_LPARA_0)
)
i_munoc_instance_0
(
	.munoc_port_12(munoc_port_24),
	.munoc_port_14(munoc_port_30),
	.munoc_port_10(munoc_port_20),
	.munoc_port_06(munoc_port_48),
	.munoc_port_08(munoc_port_45),
	.munoc_port_01(munoc_signal_06),
	.munoc_port_05(munoc_signal_12),
	.munoc_port_07(munoc_signal_04),
	.munoc_port_11(munoc_signal_10),
	.munoc_port_02(munoc_signal_00),
	.munoc_port_13(munoc_port_17),
	.munoc_port_00(munoc_port_41),
	.munoc_port_09(munoc_port_12),
	.munoc_port_04(munoc_port_13),
	.munoc_port_03(munoc_port_42)
);

`else

assign munoc_signal_00 = 0;
assign munoc_port_17 = 0;
assign munoc_port_12 = 0;
assign munoc_port_13 = 0;

`endif

endmodule
