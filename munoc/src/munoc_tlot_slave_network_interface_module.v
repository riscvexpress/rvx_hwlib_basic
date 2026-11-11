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



module MUNOC_TLOT_SLAVE_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	stlavalid,
	stlaready,
	stlaopcode,
	stlaparam,
	stlasize,
	stlasource,
	stlaaddress,
	stlamask,
	stladata,
	stlauser,

	stldvalid,
	stldready,
	stldopcode,
	stldparam,
	stldsize,
	stldsource,
	stldsink,
	stlddata,
	stlderror,
	stlduser,

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
localparam  MUNOC_LPARA_2 = `REQUIRED_BW_OF_SLAVE_TID;
parameter SUPPORTED_DATA_WIDTH = `BW_LONGEST_MASTER_DATA;
parameter PARTIAL_READ_WIDTH = `LLIMIT_OF_DATA_WIDTH;
parameter BW_TLUL_SIZE = 2;
parameter BW_TLUL_SOURCE = 8;
parameter BW_TLUL_SINK = 1;

localparam  MUNOC_LPARA_0 = BW_PLATFORM_ADDR;
localparam  MUNOC_LPARA_1 = BW_NODE_DATA;
localparam  MUNOC_LPARA_3 = MUNOC_LPARA_2;

`include "lpit_function.vb"
`include "lpixm_function.vb"
`include "rvx_include_11.vh"

localparam  BW_LPI_BURDEN = BW_AXI2LPIXM_BURDEN(MUNOC_LPARA_3);

input wire clk, rstnn;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire stlavalid;
input wire stlaready;
output wire [3-1:0] stlaopcode;
output wire [3-1:0] stlaparam;
output wire [BW_TLUL_SIZE-1:0] stlasize;
output wire [BW_TLUL_SOURCE-1:0] stlasource;
output wire [MUNOC_LPARA_0-1:0] stlaaddress;
output wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] stlamask;
output wire [MUNOC_LPARA_1-1:0] stladata;
output wire [BW_TLOT_A_USER-1:0] stlauser;

input wire stldvalid;
output wire stldready;
input wire [3-1:0] stldopcode;
input wire [3-1:0] stldparam;
input wire [BW_TLUL_SIZE-1:0] stldsize;
input wire [BW_TLUL_SOURCE-1:0] stldsource;
input wire [BW_TLUL_SINK-1:0] stldsink;
input wire [MUNOC_LPARA_1-1:0] stlddata;
input wire stlderror;
input wire [BW_TLOT_D_USER-1:0] stlduser;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [(2)-1:0] munoc_signal_12;
wire munoc_signal_03;
wire munoc_signal_05;
wire munoc_signal_06;
wire [`BW_AXI_ALEN-1:0] munoc_signal_01;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_02;
wire [`BW_AXI_ABURST-1:0] munoc_signal_17;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] munoc_signal_07;
wire [MUNOC_LPARA_1-1:0] munoc_signal_09;
wire [MUNOC_LPARA_0-1:0] munoc_signal_04;
wire [BW_LPI_BURDEN-1:0] munoc_signal_00;

wire [(2)-1:0] munoc_signal_08;
wire munoc_signal_16;
wire munoc_signal_11;
wire munoc_signal_15;
wire [`BW_AXI_RESP-1:0] munoc_signal_14;
wire [MUNOC_LPARA_1-1:0] munoc_signal_13;
wire [BW_LPI_BURDEN-1:0] munoc_signal_10;

MUNOC_XMI_SLAVE_NETWORK_INTERFACE_MODULE
#(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_SLAVE_TID(MUNOC_LPARA_2),
  .SUPPORTED_DATA_WIDTH(SUPPORTED_DATA_WIDTH),
  .PARTIAL_READ_WIDTH(PARTIAL_READ_WIDTH)
)
i_munoc_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.comm_disable(comm_disable),

	.rfni_link(rfni_link),
	.rfni_ready(rfni_ready),
	.rbni_link(rbni_link),
	.rbni_ready(rbni_ready),

	.slxqdready(munoc_signal_12),
	.slxqvalid(munoc_signal_03),
	.slxqlast(munoc_signal_05),
	.slxqwrite(munoc_signal_06),
	.slxqlen(munoc_signal_01),
	.slxqsize(munoc_signal_02),
	.slxqburst(munoc_signal_17),
	.slxqwstrb(munoc_signal_07),
	.slxqwdata(munoc_signal_09),
	.slxqaddr(munoc_signal_04),
	.slxqburden(munoc_signal_00),
	.slxydready(munoc_signal_08),
	.slxyvalid(munoc_signal_16),
	.slxylast(munoc_signal_11),
	.slxywreply(munoc_signal_15),
	.slxyresp(munoc_signal_14),
	.slxyrdata(munoc_signal_13),
	.slxyburden(munoc_signal_10),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

RVX_MODULE_049
#(
  .RVX_GPARA_4(MUNOC_LPARA_0),
  .RVX_GPARA_3(MUNOC_LPARA_1),
  .RVX_GPARA_1(BW_LPI_BURDEN),
  .RVX_GPARA_5(BW_TLUL_SIZE),
  .RVX_GPARA_2(BW_TLUL_SOURCE),
  .RVX_GPARA_0(BW_TLUL_SINK)
)
i_munoc_instance_1
(
	.rvx_port_08(clk),
	.rvx_port_15(rstnn),

	.rvx_port_09(munoc_signal_12),
	.rvx_port_31(munoc_signal_03),
	.rvx_port_05(munoc_signal_05),
	.rvx_port_20(munoc_signal_06),
	.rvx_port_28(munoc_signal_01),
	.rvx_port_04(munoc_signal_02),
	.rvx_port_26(munoc_signal_17),
	.rvx_port_07(munoc_signal_07),
	.rvx_port_37(munoc_signal_09),
	.rvx_port_29(munoc_signal_04),
	.rvx_port_22(munoc_signal_00),

	.rvx_port_02(munoc_signal_08),
	.rvx_port_06(munoc_signal_16),
	.rvx_port_21(munoc_signal_11),
	.rvx_port_23(munoc_signal_15),
	.rvx_port_32(munoc_signal_14),
	.rvx_port_27(munoc_signal_13),
	.rvx_port_24(munoc_signal_10),

	.rvx_port_36(stlavalid),
	.rvx_port_14(stlaready),
	.rvx_port_38(stlaopcode),
	.rvx_port_11(stlaparam),
	.rvx_port_16(stlasize),
	.rvx_port_00(stlasource),
	.rvx_port_13(stlaaddress),
	.rvx_port_12(stlamask),
	.rvx_port_17(stladata),
	.rvx_port_34(stlauser),

	.rvx_port_03(stldvalid),
	.rvx_port_25(stldready),
	.rvx_port_19(stldopcode),
	.rvx_port_01(stldparam),
	.rvx_port_10(stldsize),
	.rvx_port_30(stldsource),
	.rvx_port_18(stldsink),
	.rvx_port_39(stlddata),
	.rvx_port_33(stlderror),
	.rvx_port_35(stlduser)
);

endmodule
