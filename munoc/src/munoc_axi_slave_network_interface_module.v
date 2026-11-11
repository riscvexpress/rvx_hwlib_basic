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
`include "munoc_control.vh"
`include "munoc_include_08.vh"
`include "munoc_include_03.vh"
`include "munoc_include_07.vh"
`include "munoc_include_09.vh"



module MUNOC_AXI_SLAVE_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	sxawid,
	sxawaddr,
	sxawlen,
	sxawsize,
	sxawburst,
	sxawvalid,
	sxawready,

	sxwid,
	sxwdata,
	sxwstrb,
	sxwlast,
	sxwvalid,
	sxwready, 

	sxbid,
	sxbresp,
	sxbvalid,
	sxbready,

	sxarid,
	sxaraddr,
	sxarlen,
	sxarsize,
	sxarburst,
	sxarvalid,
	sxarready,

	sxrid,
	sxrdata,
	sxrresp,
	sxrlast,
	sxrvalid,
	sxrready,

	svri_rlink,
	svri_rack,
	svri_slink,
	svri_sack
);



parameter NAME = "";
parameter NODE_ID = -1;
parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;
parameter BW_AXI_SLAVE_TID = `DEFAULT_BW_AXI_TID;
parameter SUPPORTED_DATA_WIDTH = `BW_LONGEST_MASTER_DATA;
parameter PARTIAL_READ_WIDTH = `LLIMIT_OF_DATA_WIDTH;

parameter NUM_AXIAR_BUFFER = 4;
parameter NUM_AXIAW_BUFFER = 2;
parameter NUM_AXIW_BUFFER = 4;
parameter NUM_AXIR_BUFFER = 4;
parameter NUM_AXIB_BUFFER = 2;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_1 = (BW_AXI_SLAVE_TID>=`REQUIRED_BW_OF_SLAVE_TID)? 0 : 1;
localparam  MUNOC_LPARA_0 = "AXI";

input wire clk, rstnn;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire [BW_AXI_SLAVE_TID-1:0] sxawid;
output wire [BW_PLATFORM_ADDR-1:0] sxawaddr;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire sxawvalid;
input wire sxawready;

output wire [BW_AXI_SLAVE_TID-1:0] sxwid;
output wire [BW_NODE_DATA-1:0] sxwdata;
output wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] sxwstrb;
output wire sxwlast;
output wire sxwvalid;
input wire sxwready;

input wire [BW_AXI_SLAVE_TID-1:0] sxbid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire sxbvalid;
output wire sxbready;

output wire [BW_AXI_SLAVE_TID-1:0] sxarid;
output wire [BW_PLATFORM_ADDR-1:0] sxaraddr;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire sxarvalid;
input wire sxarready;

input wire [BW_AXI_SLAVE_TID-1:0] sxrid;
input wire [BW_NODE_DATA-1:0] sxrdata;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire sxrlast;
input wire sxrvalid;
output wire sxrready;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_08;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_36;
wire [`BW_AXI_ALEN-1:0] munoc_signal_00;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_04;
wire [`BW_AXI_ABURST-1:0] munoc_signal_33;
wire munoc_signal_17;
wire munoc_signal_24;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_02;
wire [BW_NODE_DATA-1:0] munoc_signal_27;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_03;
wire munoc_signal_31;
wire munoc_signal_06;
wire munoc_signal_32;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_11;
wire [`BW_AXI_BRESP-1:0] munoc_signal_15;
wire munoc_signal_13;
wire munoc_signal_34;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_05;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_28;
wire [`BW_AXI_ALEN-1:0] munoc_signal_01;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_07;
wire [`BW_AXI_ABURST-1:0] munoc_signal_29;
wire munoc_signal_09;
wire munoc_signal_12;
wire [BW_AXI_SLAVE_TID-1:0] munoc_signal_23;
wire [BW_NODE_DATA-1:0] munoc_signal_38;
wire [`BW_AXI_RRESP-1:0] munoc_signal_22;
wire munoc_signal_25;
wire munoc_signal_21;
wire munoc_signal_16;

wire munoc_signal_19;
wire [`MUNOC_GDEF_37-1:0] munoc_signal_18;
wire [`MUNOC_GDEF_84-1:0] munoc_signal_37;
wire munoc_signal_20;

wire [`MUNOC_GDEF_64-1:0] munoc_signal_14;
wire [`MUNOC_GDEF_64-1:0] munoc_signal_35;
wire [`MUNOC_GDEF_00-1:0] munoc_signal_30;
wire [`MUNOC_GDEF_51-1:0] munoc_signal_26;
wire munoc_signal_10;

MUNOC_MODULE_19
#(
	.MUNOC_GPARA_1(BW_AXI_SLAVE_TID),
	.MUNOC_GPARA_0(BW_NODE_DATA),
	.MUNOC_GPARA_2(BW_PLATFORM_ADDR)
)
i_munoc_instance_3
(
	.munoc_port_04(comm_disable),

	.munoc_port_20(munoc_signal_08),
	.munoc_port_48(munoc_signal_36),
	.munoc_port_27(munoc_signal_00),
	.munoc_port_26(munoc_signal_04),
	.munoc_port_28(munoc_signal_33),
	.munoc_port_59(munoc_signal_17),
	.munoc_port_05(munoc_signal_24),

	.munoc_port_11(munoc_signal_02),
	.munoc_port_56(munoc_signal_27),
	.munoc_port_12(munoc_signal_03),
	.munoc_port_08(munoc_signal_31),
	.munoc_port_44(munoc_signal_06),
	.munoc_port_43(munoc_signal_32), 

	.munoc_port_17(munoc_signal_11),
	.munoc_port_31(munoc_signal_15),
	.munoc_port_40(munoc_signal_13),
	.munoc_port_39(munoc_signal_34),

	.munoc_port_54(munoc_signal_05),
	.munoc_port_47(munoc_signal_28),
	.munoc_port_42(munoc_signal_01),
	.munoc_port_53(munoc_signal_07),
	.munoc_port_02(munoc_signal_29),
	.munoc_port_14(munoc_signal_09),
	.munoc_port_34(munoc_signal_12),

	.munoc_port_23(munoc_signal_23),
	.munoc_port_36(munoc_signal_38),
	.munoc_port_25(munoc_signal_22),
	.munoc_port_33(munoc_signal_25),
	.munoc_port_32(munoc_signal_21),
	.munoc_port_49(munoc_signal_16),

	.munoc_port_21(sxawid),
	.munoc_port_22(sxawaddr),
	.munoc_port_37(sxawlen),
	.munoc_port_19(sxawsize),
	.munoc_port_18(sxawburst),
	.munoc_port_09(sxawvalid),
	.munoc_port_06(sxawready),

	.munoc_port_07(sxwid),
	.munoc_port_45(sxwdata),
	.munoc_port_58(sxwstrb),
	.munoc_port_03(sxwlast),
	.munoc_port_35(sxwvalid),
	.munoc_port_30(sxwready), 

	.munoc_port_46(sxbid),
	.munoc_port_10(sxbresp),
	.munoc_port_51(sxbvalid),
	.munoc_port_50(sxbready),

	.munoc_port_57(sxarid),
	.munoc_port_16(sxaraddr),
	.munoc_port_41(sxarlen),
	.munoc_port_24(sxarsize),
	.munoc_port_60(sxarburst),
	.munoc_port_29(sxarvalid),
	.munoc_port_38(sxarready),

	.munoc_port_15(sxrid),
	.munoc_port_52(sxrdata),
	.munoc_port_55(sxrresp),
	.munoc_port_13(sxrlast),
	.munoc_port_01(sxrvalid),
	.munoc_port_00(sxrready)
);

MUNOC_MODULE_21
#(
	.MUNOC_GPARA_07(NODE_ID),
	.MUNOC_GPARA_08(BW_FNI_PHIT),
	.MUNOC_GPARA_11(BW_BNI_PHIT),
	.MUNOC_GPARA_13(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_12(BW_NODE_DATA),
	.MUNOC_GPARA_14(BW_AXI_SLAVE_TID),
	.MUNOC_GPARA_00(SUPPORTED_DATA_WIDTH),
	.MUNOC_GPARA_06(BW_NODE_DATA),
	.MUNOC_GPARA_05(NUM_AXIAR_BUFFER),
	.MUNOC_GPARA_04(NUM_AXIAW_BUFFER),
	.MUNOC_GPARA_03(NUM_AXIW_BUFFER),
	.MUNOC_GPARA_01(NUM_AXIR_BUFFER),
	.MUNOC_GPARA_10(NUM_AXIB_BUFFER),
	.MUNOC_GPARA_09(MUNOC_LPARA_1),
	.MUNOC_GPARA_02(0)
)
i_munoc_instance_1
(
	.munoc_port_20(clk),
	.munoc_port_32(rstnn),
	
	.munoc_port_06(rfni_link),
	.munoc_port_08(rfni_ready),
	.munoc_port_33(rbni_link),
	.munoc_port_30(rbni_ready),

	.munoc_port_28(munoc_signal_08),
	.munoc_port_13(munoc_signal_36),
	.munoc_port_04(munoc_signal_00),
	.munoc_port_36(munoc_signal_04),
	.munoc_port_17(munoc_signal_33),
	.munoc_port_34(munoc_signal_17),
	.munoc_port_27(munoc_signal_24),

	.munoc_port_23(munoc_signal_02),
	.munoc_port_37(munoc_signal_27),
	.munoc_port_38(munoc_signal_03),
	.munoc_port_29(munoc_signal_31),
	.munoc_port_16(munoc_signal_06),
	.munoc_port_07(munoc_signal_32),

	.munoc_port_35(munoc_signal_11),
	.munoc_port_31(munoc_signal_15),
	.munoc_port_15(munoc_signal_13),
	.munoc_port_12(munoc_signal_34),

	.munoc_port_19(munoc_signal_05),
	.munoc_port_10(munoc_signal_28),
	.munoc_port_01(munoc_signal_01),
	.munoc_port_24(munoc_signal_07),
	.munoc_port_02(munoc_signal_29),
	.munoc_port_22(munoc_signal_09),
	.munoc_port_21(munoc_signal_12),

	.munoc_port_09(munoc_signal_23),
	.munoc_port_00(munoc_signal_38),
	.munoc_port_18(munoc_signal_22),
	.munoc_port_25(munoc_signal_25),
	.munoc_port_03(munoc_signal_21),
	.munoc_port_39(munoc_signal_16),

	.munoc_port_14(munoc_signal_19),
	.munoc_port_26(munoc_signal_18),
	.munoc_port_11(munoc_signal_37),
	.munoc_port_05(munoc_signal_20)
);

`ifdef __MUNOC_INCLUDE_CONTROLLER

MUNOC_MODULE_40
#(
	.MUNOC_GPARA_8(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_5(BW_NODE_DATA),
	.MUNOC_GPARA_3(BW_AXI_SLAVE_TID),
	.MUNOC_GPARA_1(0)
)
i_munoc_instance_2
(
	.munoc_port_35(clk),
	.munoc_port_12(rstnn),
	.munoc_port_11(munoc_signal_10),

	.munoc_port_24(sxawid),
	.munoc_port_25(sxawaddr),
	.munoc_port_28(sxawlen),
	.munoc_port_05(sxawsize),
	.munoc_port_00(sxawburst),
	.munoc_port_09(sxawvalid),
	.munoc_port_32(sxawready),

	.munoc_port_03(sxwid),
	.munoc_port_26(sxwdata),
	.munoc_port_14(sxwstrb),
	.munoc_port_23(sxwlast),
	.munoc_port_21(sxwvalid),
	.munoc_port_04(sxwready), 

	.munoc_port_19(sxbid),
	.munoc_port_08(sxbresp),
	.munoc_port_20(sxbvalid),
	.munoc_port_01(sxbready),

	.munoc_port_02(sxarid),
	.munoc_port_15(sxaraddr),
	.munoc_port_10(sxarlen),
	.munoc_port_22(sxarsize),
	.munoc_port_13(sxarburst),
	.munoc_port_33(sxarvalid),
	.munoc_port_06(sxarready),

	.munoc_port_16(sxrid),
	.munoc_port_31(sxrdata),
	.munoc_port_30(sxrresp),
	.munoc_port_34(sxrlast),
	.munoc_port_18(sxrvalid),
	.munoc_port_17(sxrready),

	.munoc_port_27(munoc_signal_14),
	.munoc_port_29(munoc_signal_35),
	.munoc_port_07(munoc_signal_30),
	.munoc_port_36(munoc_signal_26)
);

MUNOC_MODULE_05
#(
	.MUNOC_GPARA_1(NAME),
	.MUNOC_GPARA_2(NODE_ID),
	.MUNOC_GPARA_0(MUNOC_LPARA_0)
)
i_munoc_instance_0
(
	.munoc_port_09(clk),
	.munoc_port_07(rstnn),
	.munoc_port_12(munoc_signal_18),
	.munoc_port_06(munoc_signal_37),
	.munoc_port_00(munoc_signal_20),
	.munoc_port_02(munoc_signal_14),
	.munoc_port_10(munoc_signal_35),
	.munoc_port_14(munoc_signal_30),
	.munoc_port_11(munoc_signal_26),
	.munoc_port_04(munoc_signal_10),
	.munoc_port_05(munoc_signal_19),
	.munoc_port_13(svri_rlink),
	.munoc_port_08(svri_rack),
	.munoc_port_03(svri_slink),
	.munoc_port_01(svri_sack)
);

`else

assign munoc_signal_10 = 0;
assign munoc_signal_19 = 0;
assign svri_rack = 0;
assign svri_slink = 0;

`endif

endmodule
