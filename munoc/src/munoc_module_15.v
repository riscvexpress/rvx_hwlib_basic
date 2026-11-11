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
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"
`include "munoc_include_03.vh"
`include "munoc_include_06.vh"
`include "munoc_control.vh"
`include "munoc_include_09.vh"





module MUNOC_MODULE_15
(
	munoc_port_38,
	munoc_port_46,

	munoc_port_18,
	munoc_port_25,
	munoc_port_27,
	munoc_port_06,
	munoc_port_29,
	munoc_port_04,
	munoc_port_32,

	munoc_port_02,
	munoc_port_22,
	munoc_port_17,
	munoc_port_36,
	munoc_port_12,
	munoc_port_33, 

	munoc_port_08,
	munoc_port_50,
	munoc_port_07,
	munoc_port_44,

	munoc_port_13,
	munoc_port_26,
	munoc_port_09,
	munoc_port_19,
	munoc_port_00,
	munoc_port_15,
	munoc_port_37,

	munoc_port_35,
	munoc_port_23,
	munoc_port_20,
	munoc_port_49,
	munoc_port_11,
	munoc_port_16,

	munoc_port_42,
	munoc_port_48,
	munoc_port_45,
	munoc_port_05,

	munoc_port_01,

	munoc_port_30,
	munoc_port_41,
	munoc_port_43,
	munoc_port_34,
	munoc_port_14,
	munoc_port_21,
	munoc_port_47,
	munoc_port_28,
  munoc_port_39,
  munoc_port_24,

	munoc_port_10,
	munoc_port_40,
	munoc_port_31,
	munoc_port_03
);





parameter MUNOC_GPARA_4 = "";
parameter MUNOC_GPARA_1 = -1;
parameter MUNOC_GPARA_2 = 32;
parameter MUNOC_GPARA_3 = 32;

parameter MUNOC_GPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;

localparam  MUNOC_LPARA_2 = "APB";
localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_3==8);
localparam  MUNOC_LPARA_1 = (MUNOC_LPARA_0==1)? 32 : MUNOC_GPARA_3;

input wire munoc_port_38, munoc_port_46;

input wire [MUNOC_GPARA_0-1:0] munoc_port_18;
input wire [MUNOC_GPARA_2-1:0] munoc_port_25;
input wire [`BW_AXI_ALEN-1:0] munoc_port_27;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_06;
input wire [`BW_AXI_ABURST-1:0] munoc_port_29;
input wire munoc_port_04;
output wire munoc_port_32;

input wire [MUNOC_GPARA_0-1:0] munoc_port_02;
input wire [MUNOC_GPARA_3-1:0] munoc_port_22;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_17;
input wire munoc_port_36;
input wire munoc_port_12;
output wire munoc_port_33;

output wire [MUNOC_GPARA_0-1:0] munoc_port_08;
output wire [`BW_AXI_BRESP-1:0] munoc_port_50;
output wire munoc_port_07;
input wire munoc_port_44;

input wire [MUNOC_GPARA_0-1:0] munoc_port_13;
input wire [MUNOC_GPARA_2-1:0] munoc_port_26;
input wire [`BW_AXI_ALEN-1:0] munoc_port_09;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_19;
input wire [`BW_AXI_ABURST-1:0] munoc_port_00;
input wire munoc_port_15;
output wire munoc_port_37;

output wire [MUNOC_GPARA_0-1:0] munoc_port_35;
output wire [MUNOC_GPARA_3-1:0] munoc_port_23;
output wire [`BW_AXI_RRESP-1:0] munoc_port_20;
output wire munoc_port_49;
output wire munoc_port_11;
input wire munoc_port_16;

output wire munoc_port_42;
input wire [`MUNOC_GDEF_37-1:0] munoc_port_48;
input wire [`MUNOC_GDEF_84-1:0] munoc_port_45;
input wire munoc_port_05;

input wire munoc_port_01;

output wire [MUNOC_GPARA_2-1:0] munoc_port_30;
output wire munoc_port_41;
output wire munoc_port_43;
output wire munoc_port_34;
output wire [MUNOC_GPARA_3-1:0] munoc_port_14;
input wire [MUNOC_GPARA_3-1:0] munoc_port_21;
input wire munoc_port_47;
input wire munoc_port_28;
output wire [MUNOC_GPARA_0-1:0] munoc_port_39;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_24;

input wire [`BW_SVRING_LINK-1:0] munoc_port_10;
output wire munoc_port_40;
output wire [`BW_SVRING_LINK-1:0] munoc_port_31;
input wire munoc_port_03;

wire [MUNOC_GPARA_2-1:0] munoc_signal_24;
wire munoc_signal_39;
wire munoc_signal_11;
wire munoc_signal_18;
wire [MUNOC_GPARA_3-1:0] munoc_signal_21;
wire [MUNOC_GPARA_3-1:0] munoc_signal_01;
wire munoc_signal_17;
wire munoc_signal_36;
wire [MUNOC_GPARA_0-1:0] munoc_signal_23;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_31;

wire [MUNOC_GPARA_2-1:0] munoc_signal_08;
wire munoc_signal_09;
wire munoc_signal_33;
wire munoc_signal_04;
wire [MUNOC_GPARA_3-1:0] munoc_signal_02;
wire [MUNOC_GPARA_3-1:0] munoc_signal_25;
wire munoc_signal_20;
wire munoc_signal_27;
wire [MUNOC_GPARA_0-1:0] munoc_signal_28;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_40;

localparam  MUNOC_LPARA_3 = 8;

wire [MUNOC_GPARA_2-1:0] munoc_signal_03;
wire munoc_signal_12;
wire munoc_signal_13;
wire munoc_signal_15;
wire [MUNOC_LPARA_3-1:0] munoc_signal_26;
wire [MUNOC_LPARA_3-1:0] munoc_signal_35;
wire munoc_signal_22;
wire munoc_signal_16;
wire [MUNOC_GPARA_0-1:0] munoc_signal_29;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_3)-1:0] munoc_signal_32;

wire [MUNOC_GPARA_2-1:0] munoc_signal_37;
wire munoc_signal_06;
wire munoc_signal_34;
wire munoc_signal_19;
wire [MUNOC_GPARA_3-1:0] munoc_signal_00;
wire [MUNOC_GPARA_3-1:0] munoc_signal_38;
wire munoc_signal_41;
wire munoc_signal_42;

wire [`MUNOC_GDEF_64-1:0] munoc_signal_05;
wire [`MUNOC_GDEF_64-1:0] munoc_signal_10;
wire [`MUNOC_GDEF_00-1:0] munoc_signal_30;
wire [`MUNOC_GDEF_51-1:0] munoc_signal_14;
wire munoc_signal_07;

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(MUNOC_GPARA_0),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_2),
	.BW_NODE_DATA(MUNOC_GPARA_3)
)
i_munoc_instance_1
(
	.clk(munoc_port_38),
	.rstnn(munoc_port_46),

	.rxawid(munoc_port_18),
	.rxawaddr(munoc_port_25),
	.rxawlen(munoc_port_27),
	.rxawsize(munoc_port_06),
	.rxawburst(munoc_port_29),
	.rxawvalid(munoc_port_04),
	.rxawready(munoc_port_32),

	.rxwid(munoc_port_02),
	.rxwdata(munoc_port_22),
	.rxwstrb(munoc_port_17),
	.rxwlast(munoc_port_36),
	.rxwvalid(munoc_port_12),
	.rxwready(munoc_port_33),

	.rxbid(munoc_port_08),
	.rxbresp(munoc_port_50),
	.rxbvalid(munoc_port_07),
	.rxbready(munoc_port_44),

	.rxarid(munoc_port_13),
	.rxaraddr(munoc_port_26),
	.rxarlen(munoc_port_09),
	.rxarsize(munoc_port_19),
	.rxarburst(munoc_port_00),
	.rxarvalid(munoc_port_15),
	.rxarready(munoc_port_37),

	.rxrid(munoc_port_35),
	.rxrdata(munoc_port_23),
	.rxrresp(munoc_port_20),
	.rxrlast(munoc_port_49),
	.rxrvalid(munoc_port_11),
	.rxrready(munoc_port_16),

	.spaddr(munoc_signal_24),
	.spwrite(munoc_signal_39),
	.spsel(munoc_signal_11),
	.spenable(munoc_signal_18),
	.spwdata(munoc_signal_21),
	.sprdata(munoc_signal_01),
	.spready(munoc_signal_17),
	.spslverr(munoc_signal_36),
	.sptid(munoc_signal_23),
	.spwstrb(munoc_signal_31)
);

assign munoc_signal_01 = (MUNOC_LPARA_0==1)? munoc_signal_25 : munoc_signal_38;
assign munoc_signal_17 = (MUNOC_LPARA_0==1)? munoc_signal_20 : munoc_signal_41;
assign munoc_signal_36 = (MUNOC_LPARA_0==1)? munoc_signal_27 : munoc_signal_42;

MUNOC_MODULE_24
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_0),
	.MUNOC_GPARA_0(MUNOC_GPARA_2),
	.MUNOC_GPARA_3(MUNOC_LPARA_1),
	.MUNOC_GPARA_2(MUNOC_LPARA_3)
)
i_munoc_instance_2
(
  .munoc_port_10(munoc_signal_08),
	.munoc_port_03(munoc_signal_09),
	.munoc_port_00(munoc_signal_33),
	.munoc_port_14(munoc_signal_04),
	.munoc_port_13(munoc_signal_02),
	.munoc_port_19(munoc_signal_25),
	.munoc_port_02(munoc_signal_20),
	.munoc_port_08(munoc_signal_27),
	.munoc_port_12(munoc_signal_28),
	.munoc_port_17(munoc_signal_40),

	.munoc_port_18(munoc_signal_03),
	.munoc_port_11(munoc_signal_12),
	.munoc_port_09(munoc_signal_13),
	.munoc_port_15(munoc_signal_15),
	.munoc_port_01(munoc_signal_26),
	.munoc_port_06(munoc_signal_35),
	.munoc_port_04(munoc_signal_22),
	.munoc_port_07(munoc_signal_16),
	.munoc_port_05(munoc_signal_29),
	.munoc_port_16(munoc_signal_32)
);

assign munoc_signal_08 = munoc_signal_24;
assign munoc_signal_09 = munoc_signal_39;
assign munoc_signal_33 = munoc_signal_11;
assign munoc_signal_04 = munoc_signal_18;
assign munoc_signal_02 = munoc_signal_21;
assign munoc_signal_28 = munoc_signal_23;
assign munoc_signal_40 = munoc_signal_31;

assign munoc_signal_35 = munoc_signal_38;
assign munoc_signal_22 = munoc_signal_41;
assign munoc_signal_16 = munoc_signal_42;

MUNOC_MODULE_18
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_3),
	.MUNOC_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.munoc_port_05(munoc_port_01),

	.munoc_port_02(munoc_signal_37),
	.munoc_port_13(munoc_signal_06),
	.munoc_port_03(munoc_signal_34),
	.munoc_port_00(munoc_signal_19),
	.munoc_port_09(munoc_signal_00),
	.munoc_port_07(munoc_signal_38),
	.munoc_port_14(munoc_signal_41),
	.munoc_port_08(munoc_signal_42),

	.munoc_port_06(munoc_port_30),
	.munoc_port_15(munoc_port_41),
	.munoc_port_04(munoc_port_43),
	.munoc_port_16(munoc_port_34),
	.munoc_port_12(munoc_port_14),
	.munoc_port_01(munoc_port_21),
	.munoc_port_10(munoc_port_47),
	.munoc_port_11(munoc_port_28)
);

assign munoc_signal_37 = (MUNOC_LPARA_0==1)? munoc_signal_03 : munoc_signal_24;
assign munoc_signal_06 = (MUNOC_LPARA_0==1)? munoc_signal_12 : munoc_signal_39;
assign munoc_signal_34 = (MUNOC_LPARA_0==1)? munoc_signal_13 : munoc_signal_11;
assign munoc_signal_19 = (MUNOC_LPARA_0==1)? munoc_signal_15 : munoc_signal_18;
assign munoc_signal_00 = (MUNOC_LPARA_0==1)? munoc_signal_26 : munoc_signal_21;

assign munoc_port_39 = (MUNOC_LPARA_0==1)? munoc_signal_29 : munoc_signal_23;
assign munoc_port_24 = (MUNOC_LPARA_0==1)? munoc_signal_32 : munoc_signal_31;

`ifdef __MUNOC_INCLUDE_CONTROLLER

assign munoc_signal_05 = 0;

MUNOC_MODULE_05
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_4),
	.MUNOC_GPARA_2(MUNOC_GPARA_1),
	.MUNOC_GPARA_0(MUNOC_LPARA_2)
)
i_munoc_instance_3
(
	.munoc_port_09(munoc_port_38),
	.munoc_port_07(munoc_port_46),
	.munoc_port_12(munoc_port_48),
	.munoc_port_06(munoc_port_45),
	.munoc_port_00(munoc_port_05),
	.munoc_port_02(munoc_signal_05),
	.munoc_port_10(munoc_signal_10),
	.munoc_port_14(munoc_signal_30),
	.munoc_port_11(munoc_signal_14),
	.munoc_port_04(munoc_signal_07),
	.munoc_port_05(munoc_port_42),
	.munoc_port_13(munoc_port_10),
	.munoc_port_08(munoc_port_40),
	.munoc_port_03(munoc_port_31),
	.munoc_port_01(munoc_port_03)
);

`else

assign munoc_signal_07 = 0;
assign munoc_port_42 = 0;
assign munoc_port_40 = 0;
assign munoc_port_31 = 0;

`endif

endmodule
