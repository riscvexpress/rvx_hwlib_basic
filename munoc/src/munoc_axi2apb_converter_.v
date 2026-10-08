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



module MUNOC_AXI2APB_CONVERTER_
(
	clk,
	rstnn,

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

	spaddr,
	spwrite,
	spsel,
	spenable,
	spwdata,
	sprdata,
	spready,
	spslverr,
	sptid,
	spwstrb
);



parameter BW_AXI_TID = 1;
parameter BW_PLATFORM_ADDR = 8;
parameter BW_NODE_DATA = 8;
parameter IGNORE_BYTE_INFO = 1;
parameter CHECK_WID = 0;

input wire clk, rstnn;

localparam  MUNOC_LPARA_1 = BW_PLATFORM_ADDR;
localparam  MUNOC_LPARA_3 = BW_NODE_DATA;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [MUNOC_LPARA_1-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [MUNOC_LPARA_3-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(MUNOC_LPARA_3)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [MUNOC_LPARA_1-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [MUNOC_LPARA_3-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

localparam  MUNOC_LPARA_0 = MUNOC_LPARA_1;
localparam  MUNOC_LPARA_2 = MUNOC_LPARA_3;

output wire [MUNOC_LPARA_0-1:0] spaddr;
output wire spwrite;
output wire spsel;
output wire spenable;
output wire [MUNOC_LPARA_2-1:0] spwdata;
input wire [MUNOC_LPARA_2-1:0] sprdata;
input wire spready;
input wire spslverr;
output wire [BW_AXI_TID-1:0] sptid;
output wire [`BW_AXI_WSTRB(MUNOC_LPARA_2)-1:0] spwstrb;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = MUNOC_LPARA_1;
localparam  BW_LPIXS_DATA = MUNOC_LPARA_3;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(BW_AXI_TID);

`include "lpixs_lpara.vb"

wire [2-1:0] munoc_signal_09;
wire munoc_signal_02;
wire munoc_signal_01;
wire munoc_signal_07;
wire munoc_signal_04;
wire [BW_LPI_QDATA-1:0] munoc_signal_00;

wire [2-1:0] munoc_signal_06;
wire munoc_signal_10;
wire munoc_signal_05;
wire munoc_signal_08;
wire [BW_LPI_YDATA-1:0] munoc_signal_03;

RVX_MODULE_128
#(
  .RVX_GPARA_1(MUNOC_LPARA_1),
  .RVX_GPARA_0(MUNOC_LPARA_3),
  .RVX_GPARA_2(BW_AXI_TID)
)
i_munoc_instance_0
(
	.rvx_port_41(clk),
	.rvx_port_15(rstnn),
  .rvx_port_00(1'b 0),
  .rvx_port_24(1'b 1),

  .rvx_port_17(rxarid),
	.rvx_port_36(rxaraddr),
	.rvx_port_22(rxarlen),
	.rvx_port_37(rxarsize),
	.rvx_port_11(rxarburst),
	.rvx_port_23(rxarvalid),
	.rvx_port_34(rxarready),

	.rvx_port_18(rxrid),
	.rvx_port_28(rxrdata),
	.rvx_port_08(rxrresp),
	.rvx_port_35(rxrlast),
	.rvx_port_30(rxrvalid),
	.rvx_port_07(rxrready),

	.rvx_port_33(rxawid),
  .rvx_port_12(rxawaddr),
  .rvx_port_06(rxawlen),
  .rvx_port_27(rxawsize),
  .rvx_port_43(rxawburst),
  .rvx_port_03(rxawvalid),
  .rvx_port_04(rxawready),

  .rvx_port_01(rxwid),
  .rvx_port_21(rxwdata),
  .rvx_port_26(rxwstrb),
  .rvx_port_42(rxwlast),
  .rvx_port_10(rxwvalid),
  .rvx_port_32(rxwready),

  .rvx_port_14(rxbid),
  .rvx_port_02(rxbresp),
  .rvx_port_20(rxbvalid),
  .rvx_port_09(rxbready),

  .rvx_port_29(munoc_signal_09),
  .rvx_port_05(munoc_signal_02),
  .rvx_port_13(munoc_signal_01),
  .rvx_port_16(munoc_signal_07),
  .rvx_port_19(munoc_signal_04),
  .rvx_port_40(munoc_signal_00),

  .rvx_port_25(munoc_signal_06),
  .rvx_port_31(munoc_signal_10),
  .rvx_port_38(munoc_signal_05),
  .rvx_port_44(munoc_signal_08),
  .rvx_port_39(munoc_signal_03)
);

RVX_MODULE_051
#(
  .RVX_GPARA_1(BW_PLATFORM_ADDR),
  .RVX_GPARA_0(BW_NODE_DATA),
  .RVX_GPARA_2(BW_AXI_TID)
)
i_munoc_instance_1
(
	.rvx_port_19(clk),
	.rvx_port_09(rstnn),
  .rvx_port_17(1'b 0),
  .rvx_port_01(1'b 1),

  .rvx_port_24(munoc_signal_09),
  .rvx_port_06(munoc_signal_02),
  .rvx_port_16(munoc_signal_01),
  .rvx_port_03(munoc_signal_07),
  .rvx_port_05(munoc_signal_04),
  .rvx_port_08(munoc_signal_00),

  .rvx_port_12(munoc_signal_06),
  .rvx_port_18(munoc_signal_10),
  .rvx_port_23(munoc_signal_05),
  .rvx_port_20(munoc_signal_08),
  .rvx_port_14(munoc_signal_03),

  .rvx_port_02(spsel),
	.rvx_port_15(spenable),
  .rvx_port_07(spaddr),
	.rvx_port_13(spwrite),
	.rvx_port_04(spwdata),
	.rvx_port_10(sprdata),
	.rvx_port_21(spready),
	.rvx_port_22(spslverr),
  .rvx_port_11(sptid),
	.rvx_port_00(spwstrb)
);

endmodule
