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
// 2026-10-20
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_03.vh"
`include "munoc_include_07.vh"
`include "munoc_include_08.vh"
`include "munoc_control.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_44
(
	munoc_port_42,
	munoc_port_27,

	munoc_port_13,
	munoc_port_24,
	munoc_port_29,
	munoc_port_35,
	munoc_port_47,
	munoc_port_07,
	munoc_port_38,

	munoc_port_30,
	munoc_port_04,
	munoc_port_36,
	munoc_port_03,
	munoc_port_28,
	munoc_port_44, 

	munoc_port_00,
	munoc_port_18,
	munoc_port_22,
	munoc_port_40,

	munoc_port_05,
	munoc_port_06,
	munoc_port_21,
	munoc_port_23,
	munoc_port_16,
	munoc_port_34,
	munoc_port_10,

	munoc_port_26,
	munoc_port_15,
	munoc_port_46,
	munoc_port_45,
	munoc_port_49,
	munoc_port_25,

	munoc_port_02,
	munoc_port_19,
	munoc_port_14,
	munoc_port_17,

	munoc_port_50,

	munoc_port_39,
	munoc_port_20,
	munoc_port_12,
	munoc_port_32,
	munoc_port_48,
	munoc_port_43,
	munoc_port_01,
	munoc_port_09,
  munoc_port_33,
  munoc_port_37,

	munoc_port_31,
	munoc_port_11,
	munoc_port_41,
	munoc_port_08
);





parameter MUNOC_GPARA_2 = "";
parameter MUNOC_GPARA_3 = -1;
parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_4 = 32;

parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;

localparam  MUNOC_LPARA_3 = "APB";
localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_4==8);
localparam  MUNOC_LPARA_1 = (MUNOC_LPARA_0==1)? 32 : MUNOC_GPARA_4;

input wire munoc_port_42, munoc_port_27;

input wire [MUNOC_GPARA_1-1:0] munoc_port_13;
input wire [MUNOC_GPARA_0-1:0] munoc_port_24;
input wire [`BW_AXI_ALEN-1:0] munoc_port_29;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_35;
input wire [`BW_AXI_ABURST-1:0] munoc_port_47;
input wire munoc_port_07;
output wire munoc_port_38;

input wire [MUNOC_GPARA_1-1:0] munoc_port_30;
input wire [MUNOC_GPARA_4-1:0] munoc_port_04;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_4)-1:0] munoc_port_36;
input wire munoc_port_03;
input wire munoc_port_28;
output wire munoc_port_44;

output wire [MUNOC_GPARA_1-1:0] munoc_port_00;
output wire [`BW_AXI_BRESP-1:0] munoc_port_18;
output wire munoc_port_22;
input wire munoc_port_40;

input wire [MUNOC_GPARA_1-1:0] munoc_port_05;
input wire [MUNOC_GPARA_0-1:0] munoc_port_06;
input wire [`BW_AXI_ALEN-1:0] munoc_port_21;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_23;
input wire [`BW_AXI_ABURST-1:0] munoc_port_16;
input wire munoc_port_34;
output wire munoc_port_10;

output wire [MUNOC_GPARA_1-1:0] munoc_port_26;
output wire [MUNOC_GPARA_4-1:0] munoc_port_15;
output wire [`BW_AXI_RRESP-1:0] munoc_port_46;
output wire munoc_port_45;
output wire munoc_port_49;
input wire munoc_port_25;

output wire munoc_port_02;
input wire [`MUNOC_GDEF_81-1:0] munoc_port_19;
input wire [`MUNOC_GDEF_93-1:0] munoc_port_14;
input wire munoc_port_17;

input wire munoc_port_50;

output wire [MUNOC_GPARA_0-1:0] munoc_port_39;
output wire munoc_port_20;
output wire munoc_port_12;
output wire munoc_port_32;
output wire [MUNOC_GPARA_4-1:0] munoc_port_48;
input wire [MUNOC_GPARA_4-1:0] munoc_port_43;
input wire munoc_port_01;
input wire munoc_port_09;
output wire [MUNOC_GPARA_1-1:0] munoc_port_33;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_4)-1:0] munoc_port_37;

input wire [`BW_SVRING_LINK-1:0] munoc_port_31;
output wire munoc_port_11;
output wire [`BW_SVRING_LINK-1:0] munoc_port_41;
input wire munoc_port_08;

wire [MUNOC_GPARA_0-1:0] munoc_signal_10;
wire munoc_signal_03;
wire munoc_signal_20;
wire munoc_signal_35;
wire [MUNOC_GPARA_4-1:0] munoc_signal_19;
wire [MUNOC_GPARA_4-1:0] munoc_signal_16;
wire munoc_signal_02;
wire munoc_signal_25;
wire [MUNOC_GPARA_1-1:0] munoc_signal_29;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_4)-1:0] munoc_signal_04;

wire [MUNOC_GPARA_0-1:0] munoc_signal_40;
wire munoc_signal_18;
wire munoc_signal_27;
wire munoc_signal_30;
wire [MUNOC_GPARA_4-1:0] munoc_signal_37;
wire [MUNOC_GPARA_4-1:0] munoc_signal_07;
wire munoc_signal_15;
wire munoc_signal_00;
wire [MUNOC_GPARA_1-1:0] munoc_signal_42;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_4)-1:0] munoc_signal_39;

localparam  MUNOC_LPARA_2 = 8;

wire [MUNOC_GPARA_0-1:0] munoc_signal_26;
wire munoc_signal_05;
wire munoc_signal_01;
wire munoc_signal_13;
wire [MUNOC_LPARA_2-1:0] munoc_signal_24;
wire [MUNOC_LPARA_2-1:0] munoc_signal_32;
wire munoc_signal_22;
wire munoc_signal_23;
wire [MUNOC_GPARA_1-1:0] munoc_signal_41;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_2)-1:0] munoc_signal_12;

wire [MUNOC_GPARA_0-1:0] munoc_signal_06;
wire munoc_signal_28;
wire munoc_signal_38;
wire munoc_signal_36;
wire [MUNOC_GPARA_4-1:0] munoc_signal_14;
wire [MUNOC_GPARA_4-1:0] munoc_signal_33;
wire munoc_signal_21;
wire munoc_signal_31;

wire [`MUNOC_GDEF_42-1:0] munoc_signal_17;
wire [`MUNOC_GDEF_42-1:0] munoc_signal_34;
wire [`MUNOC_GDEF_66-1:0] munoc_signal_08;
wire [`MUNOC_GDEF_46-1:0] munoc_signal_11;
wire munoc_signal_09;

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(MUNOC_GPARA_1),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_0),
	.BW_NODE_DATA(MUNOC_GPARA_4)
)
i_munoc_instance_0
(
	.clk(munoc_port_42),
	.rstnn(munoc_port_27),

	.rxawid(munoc_port_13),
	.rxawaddr(munoc_port_24),
	.rxawlen(munoc_port_29),
	.rxawsize(munoc_port_35),
	.rxawburst(munoc_port_47),
	.rxawvalid(munoc_port_07),
	.rxawready(munoc_port_38),

	.rxwid(munoc_port_30),
	.rxwdata(munoc_port_04),
	.rxwstrb(munoc_port_36),
	.rxwlast(munoc_port_03),
	.rxwvalid(munoc_port_28),
	.rxwready(munoc_port_44),

	.rxbid(munoc_port_00),
	.rxbresp(munoc_port_18),
	.rxbvalid(munoc_port_22),
	.rxbready(munoc_port_40),

	.rxarid(munoc_port_05),
	.rxaraddr(munoc_port_06),
	.rxarlen(munoc_port_21),
	.rxarsize(munoc_port_23),
	.rxarburst(munoc_port_16),
	.rxarvalid(munoc_port_34),
	.rxarready(munoc_port_10),

	.rxrid(munoc_port_26),
	.rxrdata(munoc_port_15),
	.rxrresp(munoc_port_46),
	.rxrlast(munoc_port_45),
	.rxrvalid(munoc_port_49),
	.rxrready(munoc_port_25),

	.spaddr(munoc_signal_10),
	.spwrite(munoc_signal_03),
	.spsel(munoc_signal_20),
	.spenable(munoc_signal_35),
	.spwdata(munoc_signal_19),
	.sprdata(munoc_signal_16),
	.spready(munoc_signal_02),
	.spslverr(munoc_signal_25),
	.sptid(munoc_signal_29),
	.spwstrb(munoc_signal_04)
);

assign munoc_signal_16 = (MUNOC_LPARA_0==1)? munoc_signal_07 : munoc_signal_33;
assign munoc_signal_02 = (MUNOC_LPARA_0==1)? munoc_signal_15 : munoc_signal_21;
assign munoc_signal_25 = (MUNOC_LPARA_0==1)? munoc_signal_00 : munoc_signal_31;

MUNOC_MODULE_03
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_1),
	.MUNOC_GPARA_0(MUNOC_GPARA_0),
	.MUNOC_GPARA_3(MUNOC_LPARA_1),
	.MUNOC_GPARA_1(MUNOC_LPARA_2)
)
i_munoc_instance_2
(
  .munoc_port_02(munoc_signal_40),
	.munoc_port_14(munoc_signal_18),
	.munoc_port_15(munoc_signal_27),
	.munoc_port_10(munoc_signal_30),
	.munoc_port_16(munoc_signal_37),
	.munoc_port_00(munoc_signal_07),
	.munoc_port_19(munoc_signal_15),
	.munoc_port_05(munoc_signal_00),
	.munoc_port_04(munoc_signal_42),
	.munoc_port_13(munoc_signal_39),

	.munoc_port_01(munoc_signal_26),
	.munoc_port_06(munoc_signal_05),
	.munoc_port_03(munoc_signal_01),
	.munoc_port_18(munoc_signal_13),
	.munoc_port_11(munoc_signal_24),
	.munoc_port_09(munoc_signal_32),
	.munoc_port_07(munoc_signal_22),
	.munoc_port_17(munoc_signal_23),
	.munoc_port_08(munoc_signal_41),
	.munoc_port_12(munoc_signal_12)
);

assign munoc_signal_40 = munoc_signal_10;
assign munoc_signal_18 = munoc_signal_03;
assign munoc_signal_27 = munoc_signal_20;
assign munoc_signal_30 = munoc_signal_35;
assign munoc_signal_37 = munoc_signal_19;
assign munoc_signal_42 = munoc_signal_29;
assign munoc_signal_39 = munoc_signal_04;

assign munoc_signal_32 = munoc_signal_33;
assign munoc_signal_22 = munoc_signal_21;
assign munoc_signal_23 = munoc_signal_31;

MUNOC_MODULE_43
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_09(munoc_port_50),

	.munoc_port_00(munoc_signal_06),
	.munoc_port_11(munoc_signal_28),
	.munoc_port_16(munoc_signal_38),
	.munoc_port_05(munoc_signal_36),
	.munoc_port_10(munoc_signal_14),
	.munoc_port_08(munoc_signal_33),
	.munoc_port_02(munoc_signal_21),
	.munoc_port_12(munoc_signal_31),

	.munoc_port_13(munoc_port_39),
	.munoc_port_03(munoc_port_20),
	.munoc_port_04(munoc_port_12),
	.munoc_port_14(munoc_port_32),
	.munoc_port_15(munoc_port_48),
	.munoc_port_06(munoc_port_43),
	.munoc_port_01(munoc_port_01),
	.munoc_port_07(munoc_port_09)
);

assign munoc_signal_06 = (MUNOC_LPARA_0==1)? munoc_signal_26 : munoc_signal_10;
assign munoc_signal_28 = (MUNOC_LPARA_0==1)? munoc_signal_05 : munoc_signal_03;
assign munoc_signal_38 = (MUNOC_LPARA_0==1)? munoc_signal_01 : munoc_signal_20;
assign munoc_signal_36 = (MUNOC_LPARA_0==1)? munoc_signal_13 : munoc_signal_35;
assign munoc_signal_14 = (MUNOC_LPARA_0==1)? munoc_signal_24 : munoc_signal_19;

assign munoc_port_33 = (MUNOC_LPARA_0==1)? munoc_signal_41 : munoc_signal_29;
assign munoc_port_37 = (MUNOC_LPARA_0==1)? munoc_signal_12 : munoc_signal_04;

`ifdef __MUNOC_INCLUDE_CONTROLLER

assign munoc_signal_17 = 0;

MUNOC_MODULE_02
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_2),
	.MUNOC_GPARA_1(MUNOC_GPARA_3),
	.MUNOC_GPARA_0(MUNOC_LPARA_3)
)
i_munoc_instance_3
(
	.munoc_port_07(munoc_port_42),
	.munoc_port_00(munoc_port_27),
	.munoc_port_02(munoc_port_19),
	.munoc_port_09(munoc_port_14),
	.munoc_port_08(munoc_port_17),
	.munoc_port_14(munoc_signal_17),
	.munoc_port_05(munoc_signal_34),
	.munoc_port_12(munoc_signal_08),
	.munoc_port_10(munoc_signal_11),
	.munoc_port_13(munoc_signal_09),
	.munoc_port_04(munoc_port_02),
	.munoc_port_11(munoc_port_31),
	.munoc_port_01(munoc_port_11),
	.munoc_port_03(munoc_port_41),
	.munoc_port_06(munoc_port_08)
);

`else

assign munoc_signal_09 = 0;
assign munoc_port_02 = 0;
assign munoc_port_11 = 0;
assign munoc_port_41 = 0;

`endif

endmodule
