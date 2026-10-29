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
`include "munoc_control.vh"
`include "munoc_include_03.vh"
`include "munoc_include_07.vh"
`include "munoc_include_06.vh"



module MUNOC_TLOT_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
(
	clk_slave,
	rstnn_slave,
	clk_network,
	rstnn_network,

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
localparam  MUNOC_LPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;
parameter SUPPORTED_DATA_WIDTH = `BW_LONGEST_MASTER_DATA;
parameter PARTIAL_READ_WIDTH = `LLIMIT_OF_DATA_WIDTH;
parameter BW_TLUL_SIZE = 2;
parameter BW_TLUL_SOURCE = 8;
parameter BW_TLUL_SINK = 1;

localparam  MUNOC_LPARA_2 = BW_PLATFORM_ADDR;
localparam  MUNOC_LPARA_1 = BW_NODE_DATA;
localparam  MUNOC_LPARA_3 = MUNOC_LPARA_0;

`include "lpit_function.vb"
`include "lpixm_function.vb"
`include "rvx_include_12.vh"

localparam  BW_LPI_BURDEN = BW_AXI2LPIXM_BURDEN(MUNOC_LPARA_3);

input wire clk_slave, rstnn_slave;
input wire clk_network, rstnn_network;

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
output wire [MUNOC_LPARA_2-1:0] stlaaddress;
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

wire [(2)-1:0] munoc_signal_09;
wire munoc_signal_02;
wire munoc_signal_03;
wire munoc_signal_12;
wire [`BW_AXI_ALEN-1:0] munoc_signal_01;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_08;
wire [`BW_AXI_ABURST-1:0] munoc_signal_14;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] munoc_signal_17;
wire [MUNOC_LPARA_1-1:0] munoc_signal_16;
wire [MUNOC_LPARA_2-1:0] munoc_signal_15;
wire [BW_LPI_BURDEN-1:0] munoc_signal_04;

wire [(2)-1:0] munoc_signal_00;
wire munoc_signal_11;
wire munoc_signal_05;
wire munoc_signal_06;
wire [`BW_AXI_RESP-1:0] munoc_signal_07;
wire [MUNOC_LPARA_1-1:0] munoc_signal_10;
wire [BW_LPI_BURDEN-1:0] munoc_signal_13;

MUNOC_XMI_SLAVE_NETWORK_INTERFACE_MODULE_ASYNCH
#(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_SLAVE_TID(MUNOC_LPARA_0),
  .SUPPORTED_DATA_WIDTH(SUPPORTED_DATA_WIDTH),
  .PARTIAL_READ_WIDTH(PARTIAL_READ_WIDTH)
)
i_munoc_instance_0
(
	.clk_slave(clk_slave),
	.rstnn_slave(rstnn_slave),
	.clk_network(clk_network),
	.rstnn_network(rstnn_network),

	.comm_disable(comm_disable),

	.rfni_link(rfni_link),
	.rfni_ready(rfni_ready),
	.rbni_link(rbni_link),
	.rbni_ready(rbni_ready),

	.slxqdready(munoc_signal_09),
	.slxqvalid(munoc_signal_02),
	.slxqlast(munoc_signal_03),
	.slxqwrite(munoc_signal_12),
	.slxqlen(munoc_signal_01),
	.slxqsize(munoc_signal_08),
	.slxqburst(munoc_signal_14),
	.slxqwstrb(munoc_signal_17),
	.slxqwdata(munoc_signal_16),
	.slxqaddr(munoc_signal_15),
	.slxqburden(munoc_signal_04),
	.slxydready(munoc_signal_00),
	.slxyvalid(munoc_signal_11),
	.slxylast(munoc_signal_05),
	.slxywreply(munoc_signal_06),
	.slxyresp(munoc_signal_07),
	.slxyrdata(munoc_signal_10),
	.slxyburden(munoc_signal_13),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

RVX_MODULE_053
#(
  .RVX_GPARA_5(MUNOC_LPARA_2),
  .RVX_GPARA_4(MUNOC_LPARA_1),
  .RVX_GPARA_1(BW_LPI_BURDEN),
  .RVX_GPARA_3(BW_TLUL_SIZE),
  .RVX_GPARA_0(BW_TLUL_SOURCE),
  .RVX_GPARA_2(BW_TLUL_SINK)
)
i_munoc_instance_1
(
	.rvx_port_36(clk_slave),
	.rvx_port_13(rstnn_slave),

	.rvx_port_22(munoc_signal_09),
	.rvx_port_39(munoc_signal_02),
	.rvx_port_10(munoc_signal_03),
	.rvx_port_14(munoc_signal_12),
	.rvx_port_18(munoc_signal_01),
	.rvx_port_20(munoc_signal_08),
	.rvx_port_15(munoc_signal_14),
	.rvx_port_00(munoc_signal_17),
	.rvx_port_24(munoc_signal_16),
	.rvx_port_17(munoc_signal_15),
	.rvx_port_30(munoc_signal_04),

	.rvx_port_07(munoc_signal_00),
	.rvx_port_38(munoc_signal_11),
	.rvx_port_12(munoc_signal_05),
	.rvx_port_16(munoc_signal_06),
	.rvx_port_32(munoc_signal_07),
	.rvx_port_01(munoc_signal_10),
	.rvx_port_11(munoc_signal_13),

	.rvx_port_28(stlavalid),
	.rvx_port_37(stlaready),
	.rvx_port_08(stlaopcode),
	.rvx_port_09(stlaparam),
	.rvx_port_19(stlasize),
	.rvx_port_26(stlasource),
	.rvx_port_31(stlaaddress),
	.rvx_port_04(stlamask),
	.rvx_port_21(stladata),
	.rvx_port_29(stlauser),

	.rvx_port_23(stldvalid),
	.rvx_port_35(stldready),
	.rvx_port_25(stldopcode),
	.rvx_port_06(stldparam),
	.rvx_port_05(stldsize),
	.rvx_port_02(stldsource),
	.rvx_port_03(stldsink),
	.rvx_port_34(stlddata),
	.rvx_port_27(stlderror),
	.rvx_port_33(stlduser)
);

endmodule
