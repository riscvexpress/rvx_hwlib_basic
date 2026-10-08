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
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_00.vh"
`include "munoc_include_08.vh"
`include "munoc_include_09.vh"
`include "munoc_control.vh"
`include "munoc_include_10.vh"





module MUNOC_MODULE_10
(
	munoc_port_20,
	munoc_port_28,

	munoc_port_27,
	munoc_port_17,
	munoc_port_09,
	munoc_port_03,
	munoc_port_25,
	munoc_port_30,
	munoc_port_04,

	munoc_port_48,
	munoc_port_50,
	munoc_port_15,
	munoc_port_12,
	munoc_port_23,
	munoc_port_41, 

	munoc_port_18,
	munoc_port_16,
	munoc_port_44,
	munoc_port_01,

	munoc_port_29,
	munoc_port_05,
	munoc_port_40,
	munoc_port_24,
	munoc_port_35,
	munoc_port_08,
	munoc_port_02,

	munoc_port_33,
	munoc_port_47,
	munoc_port_06,
	munoc_port_38,
	munoc_port_07,
	munoc_port_45,

	munoc_port_14,
	munoc_port_37,
	munoc_port_49,
	munoc_port_10,

	munoc_port_13,

	munoc_port_43,
	munoc_port_32,
	munoc_port_36,
	munoc_port_26,
	munoc_port_39,
	munoc_port_11,
	munoc_port_46,
	munoc_port_00,
  munoc_port_42,
  munoc_port_19,

	munoc_port_31,
	munoc_port_22,
	munoc_port_34,
	munoc_port_21
);





parameter MUNOC_GPARA_1 = "";
parameter MUNOC_GPARA_4 = -1;
parameter MUNOC_GPARA_2 = 32;
parameter MUNOC_GPARA_3 = 32;

parameter MUNOC_GPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;

localparam  MUNOC_LPARA_0 = "APB";
localparam  MUNOC_LPARA_2 = (MUNOC_GPARA_3==8);
localparam  MUNOC_LPARA_3 = (MUNOC_LPARA_2==1)? 32 : MUNOC_GPARA_3;

input wire munoc_port_20, munoc_port_28;

input wire [MUNOC_GPARA_0-1:0] munoc_port_27;
input wire [MUNOC_GPARA_2-1:0] munoc_port_17;
input wire [`BW_AXI_ALEN-1:0] munoc_port_09;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_03;
input wire [`BW_AXI_ABURST-1:0] munoc_port_25;
input wire munoc_port_30;
output wire munoc_port_04;

input wire [MUNOC_GPARA_0-1:0] munoc_port_48;
input wire [MUNOC_GPARA_3-1:0] munoc_port_50;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_15;
input wire munoc_port_12;
input wire munoc_port_23;
output wire munoc_port_41;

output wire [MUNOC_GPARA_0-1:0] munoc_port_18;
output wire [`BW_AXI_BRESP-1:0] munoc_port_16;
output wire munoc_port_44;
input wire munoc_port_01;

input wire [MUNOC_GPARA_0-1:0] munoc_port_29;
input wire [MUNOC_GPARA_2-1:0] munoc_port_05;
input wire [`BW_AXI_ALEN-1:0] munoc_port_40;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_24;
input wire [`BW_AXI_ABURST-1:0] munoc_port_35;
input wire munoc_port_08;
output wire munoc_port_02;

output wire [MUNOC_GPARA_0-1:0] munoc_port_33;
output wire [MUNOC_GPARA_3-1:0] munoc_port_47;
output wire [`BW_AXI_RRESP-1:0] munoc_port_06;
output wire munoc_port_38;
output wire munoc_port_07;
input wire munoc_port_45;

output wire munoc_port_14;
input wire [`MUNOC_GDEF_72-1:0] munoc_port_37;
input wire [`MUNOC_GDEF_55-1:0] munoc_port_49;
input wire munoc_port_10;

input wire munoc_port_13;

output wire [MUNOC_GPARA_2-1:0] munoc_port_43;
output wire munoc_port_32;
output wire munoc_port_36;
output wire munoc_port_26;
output wire [MUNOC_GPARA_3-1:0] munoc_port_39;
input wire [MUNOC_GPARA_3-1:0] munoc_port_11;
input wire munoc_port_46;
input wire munoc_port_00;
output wire [MUNOC_GPARA_0-1:0] munoc_port_42;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_19;

input wire [`BW_SVRING_LINK-1:0] munoc_port_31;
output wire munoc_port_22;
output wire [`BW_SVRING_LINK-1:0] munoc_port_34;
input wire munoc_port_21;

wire [MUNOC_GPARA_2-1:0] munoc_signal_40;
wire munoc_signal_03;
wire munoc_signal_13;
wire munoc_signal_38;
wire [MUNOC_GPARA_3-1:0] munoc_signal_29;
wire [MUNOC_GPARA_3-1:0] munoc_signal_21;
wire munoc_signal_33;
wire munoc_signal_24;
wire [MUNOC_GPARA_0-1:0] munoc_signal_39;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_34;

wire [MUNOC_GPARA_2-1:0] munoc_signal_11;
wire munoc_signal_05;
wire munoc_signal_02;
wire munoc_signal_12;
wire [MUNOC_GPARA_3-1:0] munoc_signal_42;
wire [MUNOC_GPARA_3-1:0] munoc_signal_20;
wire munoc_signal_30;
wire munoc_signal_15;
wire [MUNOC_GPARA_0-1:0] munoc_signal_19;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_41;

localparam  MUNOC_LPARA_1 = 8;

wire [MUNOC_GPARA_2-1:0] munoc_signal_31;
wire munoc_signal_37;
wire munoc_signal_25;
wire munoc_signal_00;
wire [MUNOC_LPARA_1-1:0] munoc_signal_32;
wire [MUNOC_LPARA_1-1:0] munoc_signal_26;
wire munoc_signal_09;
wire munoc_signal_23;
wire [MUNOC_GPARA_0-1:0] munoc_signal_07;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] munoc_signal_22;

wire [MUNOC_GPARA_2-1:0] munoc_signal_10;
wire munoc_signal_27;
wire munoc_signal_28;
wire munoc_signal_17;
wire [MUNOC_GPARA_3-1:0] munoc_signal_16;
wire [MUNOC_GPARA_3-1:0] munoc_signal_08;
wire munoc_signal_14;
wire munoc_signal_04;

wire [`MUNOC_GDEF_67-1:0] munoc_signal_36;
wire [`MUNOC_GDEF_67-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_84-1:0] munoc_signal_18;
wire [`MUNOC_GDEF_03-1:0] munoc_signal_01;
wire munoc_signal_35;

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(MUNOC_GPARA_0),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_2),
	.BW_NODE_DATA(MUNOC_GPARA_3)
)
i_munoc_instance_0
(
	.clk(munoc_port_20),
	.rstnn(munoc_port_28),

	.rxawid(munoc_port_27),
	.rxawaddr(munoc_port_17),
	.rxawlen(munoc_port_09),
	.rxawsize(munoc_port_03),
	.rxawburst(munoc_port_25),
	.rxawvalid(munoc_port_30),
	.rxawready(munoc_port_04),

	.rxwid(munoc_port_48),
	.rxwdata(munoc_port_50),
	.rxwstrb(munoc_port_15),
	.rxwlast(munoc_port_12),
	.rxwvalid(munoc_port_23),
	.rxwready(munoc_port_41),

	.rxbid(munoc_port_18),
	.rxbresp(munoc_port_16),
	.rxbvalid(munoc_port_44),
	.rxbready(munoc_port_01),

	.rxarid(munoc_port_29),
	.rxaraddr(munoc_port_05),
	.rxarlen(munoc_port_40),
	.rxarsize(munoc_port_24),
	.rxarburst(munoc_port_35),
	.rxarvalid(munoc_port_08),
	.rxarready(munoc_port_02),

	.rxrid(munoc_port_33),
	.rxrdata(munoc_port_47),
	.rxrresp(munoc_port_06),
	.rxrlast(munoc_port_38),
	.rxrvalid(munoc_port_07),
	.rxrready(munoc_port_45),

	.spaddr(munoc_signal_40),
	.spwrite(munoc_signal_03),
	.spsel(munoc_signal_13),
	.spenable(munoc_signal_38),
	.spwdata(munoc_signal_29),
	.sprdata(munoc_signal_21),
	.spready(munoc_signal_33),
	.spslverr(munoc_signal_24),
	.sptid(munoc_signal_39),
	.spwstrb(munoc_signal_34)
);

assign munoc_signal_21 = (MUNOC_LPARA_2==1)? munoc_signal_20 : munoc_signal_08;
assign munoc_signal_33 = (MUNOC_LPARA_2==1)? munoc_signal_30 : munoc_signal_14;
assign munoc_signal_24 = (MUNOC_LPARA_2==1)? munoc_signal_15 : munoc_signal_04;

MUNOC_MODULE_00
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_0),
	.MUNOC_GPARA_3(MUNOC_GPARA_2),
	.MUNOC_GPARA_2(MUNOC_LPARA_3),
	.MUNOC_GPARA_0(MUNOC_LPARA_1)
)
i_munoc_instance_1
(
  .munoc_port_08(munoc_signal_11),
	.munoc_port_15(munoc_signal_05),
	.munoc_port_00(munoc_signal_02),
	.munoc_port_11(munoc_signal_12),
	.munoc_port_16(munoc_signal_42),
	.munoc_port_13(munoc_signal_20),
	.munoc_port_09(munoc_signal_30),
	.munoc_port_12(munoc_signal_15),
	.munoc_port_19(munoc_signal_19),
	.munoc_port_04(munoc_signal_41),

	.munoc_port_07(munoc_signal_31),
	.munoc_port_18(munoc_signal_37),
	.munoc_port_10(munoc_signal_25),
	.munoc_port_06(munoc_signal_00),
	.munoc_port_03(munoc_signal_32),
	.munoc_port_01(munoc_signal_26),
	.munoc_port_14(munoc_signal_09),
	.munoc_port_02(munoc_signal_23),
	.munoc_port_05(munoc_signal_07),
	.munoc_port_17(munoc_signal_22)
);

assign munoc_signal_11 = munoc_signal_40;
assign munoc_signal_05 = munoc_signal_03;
assign munoc_signal_02 = munoc_signal_13;
assign munoc_signal_12 = munoc_signal_38;
assign munoc_signal_42 = munoc_signal_29;
assign munoc_signal_19 = munoc_signal_39;
assign munoc_signal_41 = munoc_signal_34;

assign munoc_signal_26 = munoc_signal_08;
assign munoc_signal_09 = munoc_signal_14;
assign munoc_signal_23 = munoc_signal_04;

MUNOC_MODULE_42
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_3),
	.MUNOC_GPARA_1(MUNOC_GPARA_2)
)
i_munoc_instance_2
(
	.munoc_port_11(munoc_port_13),

	.munoc_port_10(munoc_signal_10),
	.munoc_port_06(munoc_signal_27),
	.munoc_port_12(munoc_signal_28),
	.munoc_port_09(munoc_signal_17),
	.munoc_port_16(munoc_signal_16),
	.munoc_port_14(munoc_signal_08),
	.munoc_port_13(munoc_signal_14),
	.munoc_port_04(munoc_signal_04),

	.munoc_port_15(munoc_port_43),
	.munoc_port_03(munoc_port_32),
	.munoc_port_00(munoc_port_36),
	.munoc_port_08(munoc_port_26),
	.munoc_port_07(munoc_port_39),
	.munoc_port_05(munoc_port_11),
	.munoc_port_01(munoc_port_46),
	.munoc_port_02(munoc_port_00)
);

assign munoc_signal_10 = (MUNOC_LPARA_2==1)? munoc_signal_31 : munoc_signal_40;
assign munoc_signal_27 = (MUNOC_LPARA_2==1)? munoc_signal_37 : munoc_signal_03;
assign munoc_signal_28 = (MUNOC_LPARA_2==1)? munoc_signal_25 : munoc_signal_13;
assign munoc_signal_17 = (MUNOC_LPARA_2==1)? munoc_signal_00 : munoc_signal_38;
assign munoc_signal_16 = (MUNOC_LPARA_2==1)? munoc_signal_32 : munoc_signal_29;

assign munoc_port_42 = (MUNOC_LPARA_2==1)? munoc_signal_07 : munoc_signal_39;
assign munoc_port_19 = (MUNOC_LPARA_2==1)? munoc_signal_22 : munoc_signal_34;

`ifdef __MUNOC_INCLUDE_CONTROLLER

assign munoc_signal_36 = 0;

MUNOC_MODULE_01
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_1),
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_1(MUNOC_LPARA_0)
)
i_munoc_instance_3
(
	.munoc_port_02(munoc_port_20),
	.munoc_port_05(munoc_port_28),
	.munoc_port_13(munoc_port_37),
	.munoc_port_01(munoc_port_49),
	.munoc_port_09(munoc_port_10),
	.munoc_port_08(munoc_signal_36),
	.munoc_port_06(munoc_signal_06),
	.munoc_port_10(munoc_signal_18),
	.munoc_port_07(munoc_signal_01),
	.munoc_port_00(munoc_signal_35),
	.munoc_port_11(munoc_port_14),
	.munoc_port_04(munoc_port_31),
	.munoc_port_12(munoc_port_22),
	.munoc_port_03(munoc_port_34),
	.munoc_port_14(munoc_port_21)
);

`else

assign munoc_signal_35 = 0;
assign munoc_port_14 = 0;
assign munoc_port_22 = 0;
assign munoc_port_34 = 0;

`endif

endmodule
