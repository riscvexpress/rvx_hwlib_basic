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
`include "munoc_control.vh"
`include "munoc_include_00.vh"
`include "munoc_tid_control_type.vh"
`include "munoc_include_10.vh"



module MUNOC_AXI_MASTER_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

	rxawid,
	rxawaddr,
	rxawlen,
	rxawsize,
	rxawburst,
	rxawvalid,
	rxawready,

	rxwid,
	rxwdata,
	rxwstrb,
	rxwlast,
	rxwvalid,
	rxwready, 

	rxbid,
	rxbresp,
	rxbvalid,
	rxbready,

	rxarid,
	rxaraddr,
	rxarlen,
	rxarsize,
	rxarburst,
	rxarvalid,
	rxarready,

	rxrid,
	rxrdata,
	rxrresp,
	rxrlast,
	rxrvalid,
	rxrready,

	local_spaddr,
	local_spwrite,
	local_spsel,
	local_spenable,
	local_spwdata,
	local_sprdata,
	local_spready,
	local_spslverr,

	local_allows_holds,

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
parameter BW_AXI_MASTER_TID = `DEFAULT_BW_AXI_TID;
parameter LOCAL_ENABLE = 0;
parameter LOCAL_UPPER_ADDR = 0;

parameter CHECK_WID = 0;
parameter TID_CONTROL_TYPE = `SINGLE_TARGET_SLAVE;

parameter NUM_AXIAR_BUFFER = 4;
parameter NUM_AXIAW_BUFFER = 2;
parameter NUM_AXIW_BUFFER = 4;
parameter NUM_AXIR_BUFFER = 4;
parameter NUM_AXIB_BUFFER = 2;

`include "ervp_log_util.vf"

localparam  MUNOC_LPARA_2 = "AXI";

localparam  MUNOC_LPARA_0 = `MAX(`MAX(`QUANTIZERU(NUM_AXIR_BUFFER,8),NUM_AXIB_BUFFER),2);
localparam  MUNOC_LPARA_1 = NUM_AXIR_BUFFER;

input wire clk, rstnn;

input wire comm_disable;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

input wire [BW_AXI_MASTER_TID-1:0] rxawid;
input wire [BW_PLATFORM_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_MASTER_TID-1:0] rxwid;
input wire [BW_NODE_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_MASTER_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_MASTER_TID-1:0] rxarid;
input wire [BW_PLATFORM_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_MASTER_TID-1:0] rxrid;
output wire [BW_NODE_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

output wire [BW_PLATFORM_ADDR-1:0] local_spaddr;
output wire local_spwrite;
output wire local_spsel;
output wire local_spenable;
output wire [BW_NODE_DATA-1:0] local_spwdata;
input wire [BW_NODE_DATA-1:0] local_sprdata;
input wire local_spready;
input wire local_spslverr;

output wire local_allows_holds;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_097;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_025;
wire [`BW_AXI_ALEN-1:0] munoc_signal_077;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_034;
wire [`BW_AXI_ABURST-1:0] munoc_signal_103;
wire munoc_signal_111;
wire munoc_signal_090;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_091;
wire [BW_NODE_DATA-1:0] munoc_signal_033;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_072;
wire munoc_signal_020;
wire munoc_signal_099;
wire munoc_signal_008;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_056;
wire [`BW_AXI_BRESP-1:0] munoc_signal_044;
wire munoc_signal_116;
wire munoc_signal_045;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_007;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_041;
wire [`BW_AXI_ALEN-1:0] munoc_signal_112;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_040;
wire [`BW_AXI_ABURST-1:0] munoc_signal_001;
wire munoc_signal_015;
wire munoc_signal_049;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_113;
wire [BW_NODE_DATA-1:0] munoc_signal_017;
wire [`BW_AXI_RRESP-1:0] munoc_signal_058;
wire munoc_signal_063;
wire munoc_signal_038;
wire munoc_signal_000;

wire [BW_PLATFORM_ADDR-1:0] munoc_signal_074;
wire munoc_signal_069;
wire munoc_signal_003;
wire munoc_signal_052;
wire [BW_NODE_DATA-1:0] munoc_signal_005;
wire [BW_NODE_DATA-1:0] munoc_signal_108;
wire munoc_signal_067;
wire munoc_signal_086;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_081;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_076;
wire [`BW_AXI_ALEN-1:0] munoc_signal_022;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_062;
wire [`BW_AXI_ABURST-1:0] munoc_signal_083;
wire munoc_signal_029;
wire munoc_signal_026;

wire [BW_NODE_DATA-1:0] munoc_signal_036;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_082;
wire munoc_signal_068;
wire munoc_signal_030;
wire munoc_signal_013;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_035;
wire [`BW_AXI_BRESP-1:0] munoc_signal_018;
wire munoc_signal_084;
wire munoc_signal_004;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_109;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_002;
wire [`BW_AXI_ALEN-1:0] munoc_signal_107;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_114;
wire [`BW_AXI_ABURST-1:0] munoc_signal_014;
wire munoc_signal_032;
wire munoc_signal_012;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_061;
wire [BW_NODE_DATA-1:0] munoc_signal_019;
wire [`BW_AXI_RRESP-1:0] munoc_signal_071;
wire munoc_signal_088;
wire munoc_signal_050;
wire munoc_signal_102;

wire munoc_signal_037;
wire munoc_signal_089;
wire [`BW_ARCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_043;
wire munoc_signal_098;
wire munoc_signal_080;
wire [`BW_ARCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_065;

wire munoc_signal_066;
wire munoc_signal_110;
wire [`BW_AWCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_075;
wire munoc_signal_010;
wire munoc_signal_046;
wire [`BW_AWCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_021;

wire munoc_signal_060;
wire munoc_signal_023;
wire [`BW_WCHANNEL(0,BW_NODE_DATA)-1:0] munoc_signal_101;
wire munoc_signal_096;
wire munoc_signal_027;
wire [`BW_WCHANNEL(0,BW_NODE_DATA)-1:0] munoc_signal_059;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_055;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_009;
wire munoc_signal_031;
wire munoc_signal_093;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_016;
wire munoc_signal_011;

wire [BW_AXI_MASTER_TID-1:0] munoc_signal_078;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_087;
wire munoc_signal_100;
wire munoc_signal_048;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_079;
wire munoc_signal_047;

wire munoc_signal_039;
wire munoc_signal_070;
wire munoc_signal_028;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_115;
wire [BW_AXI_MASTER_TID-1:0] munoc_signal_092;
wire [`BW_AXI_BRESP-1:0] munoc_signal_051;

wire munoc_signal_057;
wire [`BW_AXI_RRESP-1:0] munoc_signal_064;
wire [BW_NODE_DATA-1:0] munoc_signal_085;

wire munoc_signal_073;
wire munoc_signal_106;

wire [`MUNOC_GDEF_28-1:0] munoc_signal_042;
wire [`MUNOC_GDEF_66-1:0] munoc_signal_006;
wire munoc_signal_095;
wire [`MUNOC_GDEF_67-1:0] munoc_signal_105;
wire [`MUNOC_GDEF_67-1:0] munoc_signal_094;
wire [`MUNOC_GDEF_84-1:0] munoc_signal_054;
wire [`MUNOC_GDEF_03-1:0] munoc_signal_024;
wire munoc_signal_104;
wire munoc_signal_053;

MUNOC_MODULE_29
#(
	.MUNOC_GPARA_2(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_1(BW_NODE_DATA),
	.MUNOC_GPARA_0(BW_PLATFORM_ADDR)
)
i_munoc_instance_00
(
	.munoc_port_26(comm_disable),

	.munoc_port_52(rxawid),
	.munoc_port_49(rxawaddr),
	.munoc_port_53(rxawlen),
	.munoc_port_60(rxawsize),
	.munoc_port_44(rxawburst),
	.munoc_port_58(rxawvalid),
	.munoc_port_31(rxawready),

	.munoc_port_29(rxwid),
	.munoc_port_22(rxwdata),
	.munoc_port_06(rxwstrb),
	.munoc_port_46(rxwlast),
	.munoc_port_07(rxwvalid),
	.munoc_port_42(rxwready), 

	.munoc_port_38(rxbid),
	.munoc_port_39(rxbresp),
	.munoc_port_59(rxbvalid),
	.munoc_port_36(rxbready),

	.munoc_port_55(rxarid),
	.munoc_port_04(rxaraddr),
	.munoc_port_15(rxarlen),
	.munoc_port_16(rxarsize),
	.munoc_port_50(rxarburst),
	.munoc_port_10(rxarvalid),
	.munoc_port_35(rxarready),

	.munoc_port_12(rxrid),
	.munoc_port_23(rxrdata),
	.munoc_port_25(rxrresp),
	.munoc_port_08(rxrlast),
	.munoc_port_11(rxrvalid),
	.munoc_port_18(rxrready),

	.munoc_port_00(munoc_signal_097),
	.munoc_port_33(munoc_signal_025),
	.munoc_port_20(munoc_signal_077),
	.munoc_port_47(munoc_signal_034),
	.munoc_port_03(munoc_signal_103),
	.munoc_port_21(munoc_signal_111),
	.munoc_port_09(munoc_signal_090),

	.munoc_port_30(munoc_signal_091),
	.munoc_port_43(munoc_signal_033),
	.munoc_port_17(munoc_signal_072),
	.munoc_port_37(munoc_signal_020),
	.munoc_port_56(munoc_signal_099),
	.munoc_port_41(munoc_signal_008), 

	.munoc_port_32(munoc_signal_056),
	.munoc_port_01(munoc_signal_044),
	.munoc_port_14(munoc_signal_116),
	.munoc_port_19(munoc_signal_045),

	.munoc_port_24(munoc_signal_007),
	.munoc_port_54(munoc_signal_041),
	.munoc_port_57(munoc_signal_112),
	.munoc_port_48(munoc_signal_040),
	.munoc_port_13(munoc_signal_001),
	.munoc_port_34(munoc_signal_015),
	.munoc_port_05(munoc_signal_049),

	.munoc_port_45(munoc_signal_113),
	.munoc_port_28(munoc_signal_017),
	.munoc_port_27(munoc_signal_058),
	.munoc_port_51(munoc_signal_063),
	.munoc_port_02(munoc_signal_038),
	.munoc_port_40(munoc_signal_000)
);

MUNOC_MODULE_42
#(
	.MUNOC_GPARA_0(BW_NODE_DATA),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR)
)
i_munoc_instance_07
(
	.munoc_port_11(comm_disable),

	.munoc_port_10(munoc_signal_074),
	.munoc_port_06(munoc_signal_069),
	.munoc_port_12(munoc_signal_003),
	.munoc_port_09(munoc_signal_052),
	.munoc_port_16(munoc_signal_005),
	.munoc_port_14(munoc_signal_108),
	.munoc_port_13(munoc_signal_067),
	.munoc_port_04(munoc_signal_086),

	.munoc_port_15(local_spaddr),
	.munoc_port_03(local_spwrite),
	.munoc_port_00(local_spsel),
	.munoc_port_08(local_spenable),
	.munoc_port_07(local_spwdata),
	.munoc_port_05(local_sprdata),
	.munoc_port_01(local_spready),
	.munoc_port_02(local_spslverr)
);

MUNOC_MODULE_32
#(
	.MUNOC_GPARA_0(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_5(BW_NODE_DATA),
	.MUNOC_GPARA_4(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_1(LOCAL_ENABLE),
	.MUNOC_GPARA_6(LOCAL_UPPER_ADDR),
	.MUNOC_GPARA_2(CHECK_WID)
)
i_munoc_instance_05
(
	.munoc_port_28(clk),
	.munoc_port_42(rstnn),

	.munoc_port_65(munoc_signal_097),
	.munoc_port_66(munoc_signal_025),
	.munoc_port_09(munoc_signal_077),
	.munoc_port_44(munoc_signal_034),
	.munoc_port_47(munoc_signal_103),
	.munoc_port_19(munoc_signal_111),
	.munoc_port_58(munoc_signal_090),

	.munoc_port_07(munoc_signal_091),
	.munoc_port_08(munoc_signal_033),
	.munoc_port_27(munoc_signal_072),
	.munoc_port_23(munoc_signal_020),
	.munoc_port_15(munoc_signal_099),
	.munoc_port_22(munoc_signal_008), 

	.munoc_port_35(munoc_signal_056),
	.munoc_port_33(munoc_signal_044),
	.munoc_port_59(munoc_signal_116),
	.munoc_port_46(munoc_signal_045),

	.munoc_port_04(munoc_signal_007),
	.munoc_port_39(munoc_signal_041),
	.munoc_port_52(munoc_signal_112),
	.munoc_port_01(munoc_signal_040),
	.munoc_port_36(munoc_signal_001),
	.munoc_port_02(munoc_signal_015),
	.munoc_port_43(munoc_signal_049),

	.munoc_port_32(munoc_signal_113),
	.munoc_port_20(munoc_signal_017),
	.munoc_port_48(munoc_signal_058),
	.munoc_port_45(munoc_signal_063),
	.munoc_port_49(munoc_signal_038),
	.munoc_port_14(munoc_signal_000),

	.munoc_port_55(munoc_signal_074),
	.munoc_port_63(munoc_signal_069),
	.munoc_port_56(munoc_signal_003),
	.munoc_port_67(munoc_signal_052),
	.munoc_port_68(munoc_signal_005),
	.munoc_port_51(munoc_signal_108),
	.munoc_port_40(munoc_signal_067),
	.munoc_port_30(munoc_signal_086),
	.munoc_port_11(local_allows_holds),

	.munoc_port_17(munoc_signal_081),
	.munoc_port_57(munoc_signal_076),
	.munoc_port_34(munoc_signal_022),
	.munoc_port_29(munoc_signal_062),
	.munoc_port_50(munoc_signal_083),
	.munoc_port_26(munoc_signal_029),
	.munoc_port_41(munoc_signal_026),

	.munoc_port_18(),
	.munoc_port_10(munoc_signal_036),
	.munoc_port_24(munoc_signal_082),
	.munoc_port_31(munoc_signal_068),
	.munoc_port_21(munoc_signal_030),
	.munoc_port_16(munoc_signal_013), 

	.munoc_port_64(munoc_signal_035),
	.munoc_port_00(munoc_signal_018),
	.munoc_port_61(munoc_signal_084),
	.munoc_port_13(munoc_signal_004),

	.munoc_port_12(munoc_signal_109),
	.munoc_port_69(munoc_signal_002),
	.munoc_port_53(munoc_signal_107),
	.munoc_port_06(munoc_signal_114),
	.munoc_port_25(munoc_signal_014),
	.munoc_port_62(munoc_signal_032),
	.munoc_port_60(munoc_signal_012),

	.munoc_port_54(munoc_signal_061),
	.munoc_port_37(munoc_signal_019),
	.munoc_port_05(munoc_signal_071),
	.munoc_port_03(munoc_signal_088),
	.munoc_port_38(munoc_signal_050),
	.munoc_port_70(munoc_signal_102)
);

MUNOC_MODULE_06
#(
	.MUNOC_GPARA_0(`BW_ARCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)),
	.MUNOC_GPARA_1(NUM_AXIAR_BUFFER)
)
i_munoc_instance_09
(
	.munoc_port_7(clk),
	.munoc_port_3(rstnn),
	.munoc_port_2(munoc_signal_037),
	.munoc_port_5(munoc_signal_089),
	.munoc_port_4(munoc_signal_043),
	.munoc_port_6(munoc_signal_098),
	.munoc_port_1(munoc_signal_080),
	.munoc_port_0(munoc_signal_065)
);

assign munoc_signal_012 = munoc_signal_037;
assign munoc_signal_089 = munoc_signal_032;
assign munoc_signal_043 = {munoc_signal_109,munoc_signal_002,munoc_signal_107,munoc_signal_114,munoc_signal_014};

MUNOC_MODULE_06
#(
	.MUNOC_GPARA_0(`BW_AWCHANNEL(BW_AXI_MASTER_TID,BW_PLATFORM_ADDR)),
	.MUNOC_GPARA_1(NUM_AXIAW_BUFFER)
)
i_munoc_instance_03
(
	.munoc_port_7(clk),
	.munoc_port_3(rstnn),
	.munoc_port_2(munoc_signal_066),
	.munoc_port_5(munoc_signal_110),
	.munoc_port_4(munoc_signal_075),
	.munoc_port_6(munoc_signal_010),
	.munoc_port_1(munoc_signal_046),
	.munoc_port_0(munoc_signal_021)
);

assign munoc_signal_026 = munoc_signal_066;
assign munoc_signal_110 = munoc_signal_029;
assign munoc_signal_075 = {munoc_signal_081,munoc_signal_076,munoc_signal_022,munoc_signal_062,munoc_signal_083};

MUNOC_MODULE_06
#(
	.MUNOC_GPARA_0(`BW_WCHANNEL(0,BW_NODE_DATA)),
	.MUNOC_GPARA_1(NUM_AXIW_BUFFER)
)
i_munoc_instance_06
(
	.munoc_port_7(clk),
	.munoc_port_3(rstnn),
	.munoc_port_2(munoc_signal_060),
	.munoc_port_5(munoc_signal_023),
	.munoc_port_4(munoc_signal_059),
	.munoc_port_6(munoc_signal_096),
	.munoc_port_1(munoc_signal_027),
	.munoc_port_0(munoc_signal_101)
);

assign munoc_signal_013 = munoc_signal_060;
assign munoc_signal_023 = munoc_signal_030;
assign munoc_signal_059 = {munoc_signal_036,munoc_signal_082,munoc_signal_068};

MUNOC_MODULE_07
#(
	.MUNOC_GPARA_3(NODE_ID),
	.MUNOC_GPARA_0(BW_FNI_PHIT),
	.MUNOC_GPARA_4(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_1(BW_NODE_DATA),
	.MUNOC_GPARA_2(BW_AXI_MASTER_TID)
)
i_munoc_instance_04
(
	.munoc_port_19(clk),
	.munoc_port_00(rstnn),
	.munoc_port_01(munoc_signal_098),
	.munoc_port_22(munoc_signal_080),
	.munoc_port_18(munoc_signal_065),
	.munoc_port_15(munoc_signal_010),
	.munoc_port_12(munoc_signal_046),
	.munoc_port_11(munoc_signal_021),
	.munoc_port_16(munoc_signal_096),
	.munoc_port_05(munoc_signal_027),
	.munoc_port_08(munoc_signal_101),
	.munoc_port_06(sfni_link),
	.munoc_port_20(sfni_ready),
	.munoc_port_13(munoc_signal_053),
	.munoc_port_21(munoc_signal_055),
	.munoc_port_07(munoc_signal_009),
	.munoc_port_03(munoc_signal_031),
	.munoc_port_02(munoc_signal_093),
	.munoc_port_09(munoc_signal_078),
	.munoc_port_14(munoc_signal_087),
	.munoc_port_04(munoc_signal_100),
	.munoc_port_17(munoc_signal_048),
	.munoc_port_10(munoc_signal_042)
);

MUNOC_MODULE_25
#(
	.MUNOC_GPARA_0(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_1(`BW_SLAVE_NODE_ID),
	.MUNOC_GPARA_2(TID_CONTROL_TYPE)
)
i_munoc_instance_10
(
	.munoc_port_07(clk),
	.munoc_port_09(rstnn),
	.munoc_port_00(munoc_signal_055),
	.munoc_port_01(munoc_signal_009),
	.munoc_port_04(munoc_signal_031),
	.munoc_port_05(munoc_signal_093),
	.munoc_port_03(clk),
	.munoc_port_02(rstnn),
	.munoc_port_08(munoc_signal_016),
	.munoc_port_06(munoc_signal_011)
);

MUNOC_MODULE_25
#(
	.MUNOC_GPARA_0(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_1(`BW_SLAVE_NODE_ID),
	.MUNOC_GPARA_2(TID_CONTROL_TYPE)
)
i_munoc_instance_01
(
	.munoc_port_07(clk),
	.munoc_port_09(rstnn),
	.munoc_port_00(munoc_signal_078),
	.munoc_port_01(munoc_signal_087),
	.munoc_port_04(munoc_signal_100),
	.munoc_port_05(munoc_signal_048),
	.munoc_port_03(clk),
	.munoc_port_02(rstnn),
	.munoc_port_08(munoc_signal_079),
	.munoc_port_06(munoc_signal_047)
);

MUNOC_MODULE_37
#(
	 .MUNOC_GPARA_5(BW_BNI_PHIT),
	 .MUNOC_GPARA_0(BW_PLATFORM_ADDR),
	 .MUNOC_GPARA_2(BW_NODE_DATA),
	 .MUNOC_GPARA_4(BW_AXI_MASTER_TID),
	 .MUNOC_GPARA_1(MUNOC_LPARA_0),
	 .MUNOC_GPARA_3(MUNOC_LPARA_1)
)
i_munoc_instance_12
(
	.munoc_port_14(clk),
	.munoc_port_11(rstnn),

	.munoc_port_10(sbni_link),
	.munoc_port_12(sbni_ready),
	.munoc_port_06(munoc_signal_053),

	.munoc_port_07(munoc_signal_039),
	.munoc_port_00(munoc_signal_070),
	.munoc_port_13(munoc_signal_028),

	.munoc_port_03(munoc_signal_115),
	.munoc_port_15(munoc_signal_092),
	.munoc_port_08(munoc_signal_051),

	.munoc_port_01(munoc_signal_057),
	.munoc_port_05(munoc_signal_064),
	.munoc_port_02(munoc_signal_085),

	.munoc_port_09(munoc_signal_073),
	.munoc_port_04(munoc_signal_106)
);

MUNOC_MODULE_18
#(
	.MUNOC_GPARA_4(NODE_ID),
	.MUNOC_GPARA_2(BW_BNI_PHIT),
	.MUNOC_GPARA_0(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_3(BW_NODE_DATA),
	.MUNOC_GPARA_1(BW_AXI_MASTER_TID)
)
i_munoc_instance_02
(
	.munoc_port_14(clk),
	.munoc_port_16(rstnn),

	.munoc_port_12(munoc_signal_039),
	.munoc_port_18(munoc_signal_070),
	.munoc_port_10(munoc_signal_028),
	.munoc_port_04(munoc_signal_115),
	.munoc_port_22(munoc_signal_092),
	.munoc_port_07(munoc_signal_051),
	.munoc_port_23(munoc_signal_057),
	.munoc_port_19(munoc_signal_064),
	.munoc_port_09(munoc_signal_085),
	.munoc_port_01(munoc_signal_073),
	.munoc_port_21(munoc_signal_106),

	.munoc_port_03(munoc_signal_016),
	.munoc_port_24(munoc_signal_011),
	.munoc_port_05(munoc_signal_079),
	.munoc_port_28(munoc_signal_047),

	.munoc_port_15(munoc_signal_035),
	.munoc_port_06(munoc_signal_018),
	.munoc_port_17(munoc_signal_084),
	.munoc_port_00(munoc_signal_004),
	.munoc_port_08(munoc_signal_061),
	.munoc_port_11(munoc_signal_019),
	.munoc_port_25(munoc_signal_071),
	.munoc_port_13(munoc_signal_088),
	.munoc_port_20(munoc_signal_050),
	.munoc_port_27(munoc_signal_102),

	.munoc_port_02(munoc_signal_006),
	.munoc_port_26(munoc_signal_095)
);

`ifdef __MUNOC_INCLUDE_CONTROLLER

MUNOC_MODULE_08
#(
	.MUNOC_GPARA_3(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_1(BW_NODE_DATA),
	.MUNOC_GPARA_6(BW_AXI_MASTER_TID),
	.MUNOC_GPARA_5(CHECK_WID),
	.MUNOC_GPARA_8(1)
)
i_munoc_instance_08
(
	.munoc_port_27(clk),
	.munoc_port_23(rstnn),
	.munoc_port_02(munoc_signal_104),

	.munoc_port_30(rxawid),
	.munoc_port_11(rxawaddr),
	.munoc_port_15(rxawlen),
	.munoc_port_16(rxawsize),
	.munoc_port_32(rxawburst),
	.munoc_port_13(rxawvalid),
	.munoc_port_24(rxawready),

	.munoc_port_19(rxwid),
	.munoc_port_05(rxwdata),
	.munoc_port_18(rxwstrb),
	.munoc_port_29(rxwlast),
	.munoc_port_00(rxwvalid),
	.munoc_port_09(rxwready), 

	.munoc_port_17(rxbid),
	.munoc_port_36(rxbresp),
	.munoc_port_08(rxbvalid),
	.munoc_port_12(rxbready),

	.munoc_port_22(rxarid),
	.munoc_port_01(rxaraddr),
	.munoc_port_25(rxarlen),
	.munoc_port_07(rxarsize),
	.munoc_port_21(rxarburst),
	.munoc_port_20(rxarvalid),
	.munoc_port_34(rxarready),

	.munoc_port_31(rxrid),
	.munoc_port_14(rxrdata),
	.munoc_port_03(rxrresp),
	.munoc_port_33(rxrlast),
	.munoc_port_26(rxrvalid),
	.munoc_port_35(rxrready),

	.munoc_port_28(munoc_signal_105),
	.munoc_port_04(munoc_signal_094),
	.munoc_port_06(munoc_signal_054),
	.munoc_port_10(munoc_signal_024)
);

MUNOC_MODULE_44
#(
	.MUNOC_GPARA_2(NAME),
	.MUNOC_GPARA_0(NODE_ID),
	.MUNOC_GPARA_1(MUNOC_LPARA_2)
)
i_munoc_instance_11
(
	.munoc_port_01(clk),
	.munoc_port_00(rstnn),
	.munoc_port_12(munoc_signal_042),
	.munoc_port_02(munoc_signal_006),
	.munoc_port_05(munoc_signal_095),
	.munoc_port_03(munoc_signal_105),
	.munoc_port_09(munoc_signal_094),
	.munoc_port_14(munoc_signal_054),
	.munoc_port_04(munoc_signal_024),
	.munoc_port_13(munoc_signal_104),
	.munoc_port_07(munoc_signal_053),
	.munoc_port_08(svri_rlink),
	.munoc_port_06(svri_rack),
	.munoc_port_10(svri_slink),
	.munoc_port_11(svri_sack)
);

`else

assign munoc_signal_104 = 0;
assign munoc_signal_053 = 0;
assign svri_rack = 0;
assign svri_slink = 0;

`endif

endmodule
