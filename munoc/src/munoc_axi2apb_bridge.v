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
`include "ervp_axi_define.vh"



module MUNOC_AXI2APB_BRIDGE (
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
	sptid,
	sprdata,
	spready,
	spslverr,
	spwstrb
);



parameter BW_AXI_TID = 4;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;
parameter CHECK_WID = 0;

input wire clk, rstnn;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [BW_PLATFORM_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [BW_NODE_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [BW_PLATFORM_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [BW_NODE_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

output wire [BW_PLATFORM_ADDR-1:0] spaddr;
output wire spwrite;
output wire spsel;
output wire spenable;
output wire [BW_NODE_DATA-1:0] spwdata;
output wire [BW_AXI_TID-1:0] sptid;
input wire [BW_NODE_DATA-1:0] sprdata;
input wire spready;
input wire spslverr;
output wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] spwstrb;

wire munoc_signal_34;
wire munoc_signal_27;
wire [`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_20;
wire munoc_signal_13;
wire munoc_signal_28;
wire [`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_00;

wire [BW_AXI_TID-1:0] munoc_signal_05;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_14;
wire [`BW_AXI_ALEN-1:0] munoc_signal_12;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_31;
wire [`BW_AXI_ABURST-1:0] munoc_signal_33;
wire munoc_signal_22;
wire munoc_signal_17;

wire munoc_signal_25;
wire munoc_signal_11;
wire [`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_21;
wire munoc_signal_23;
wire munoc_signal_16;
wire [`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_06;

wire [BW_AXI_TID-1:0] munoc_signal_01;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_07;
wire [`BW_AXI_ALEN-1:0] munoc_signal_24;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_18;
wire [`BW_AXI_ABURST-1:0] munoc_signal_35;
wire munoc_signal_32;
wire munoc_signal_03;

wire munoc_signal_04;
wire munoc_signal_30;
wire [`BW_BCHANNEL(BW_NODE_DATA)-1:0] munoc_signal_29;
wire munoc_signal_02;
wire munoc_signal_19;
wire [`BW_BCHANNEL(BW_NODE_DATA)-1:0] munoc_signal_09;

wire [BW_AXI_TID-1:0] munoc_signal_08;
wire [`BW_AXI_BRESP-1:0] munoc_signal_10;
wire munoc_signal_26;
wire munoc_signal_15;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)),
	.DEPTH(2)
)
i_munoc_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_34),
	.wrequest(munoc_signal_27),
	.wdata(munoc_signal_20),
	.rready(munoc_signal_13),
	.rrequest(munoc_signal_28),
	.rdata(munoc_signal_00),
	.wfull(),
	.rempty()
);

assign rxarready = munoc_signal_34;
assign munoc_signal_27 = rxarvalid;
assign munoc_signal_20 = {rxarid,rxaraddr,rxarlen,rxarsize,rxarburst};
assign munoc_signal_22 = munoc_signal_13;
assign munoc_signal_28 = munoc_signal_17;
assign {munoc_signal_05,munoc_signal_14,munoc_signal_12,munoc_signal_31,munoc_signal_33} = munoc_signal_00;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)),
	.DEPTH(2)
)
i_munoc_instance_3
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_25),
	.wrequest(munoc_signal_11),
	.wdata(munoc_signal_21),
	.rready(munoc_signal_23),
	.rrequest(munoc_signal_16),
	.rdata(munoc_signal_06),
	.wfull(),
	.rempty()
);

assign rxawready = munoc_signal_25;
assign munoc_signal_11 = rxawvalid;
assign munoc_signal_21 = {rxawid,rxawaddr,rxawlen,rxawsize,rxawburst};
assign munoc_signal_32 = munoc_signal_23;
assign munoc_signal_16 = munoc_signal_03;
assign {munoc_signal_01,munoc_signal_07,munoc_signal_24,munoc_signal_18,munoc_signal_35} = munoc_signal_06;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_BCHANNEL(BW_NODE_DATA)),
	.DEPTH(2)
)
i_munoc_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_04),
	.wrequest(munoc_signal_30),
	.wdata(munoc_signal_09),
	.rready(munoc_signal_02),
	.rrequest(munoc_signal_19),
	.rdata(munoc_signal_29),
	.wfull(),
	.rempty()
);

assign munoc_signal_15 = munoc_signal_04;
assign munoc_signal_30 = munoc_signal_26;
assign munoc_signal_09 = {munoc_signal_08,munoc_signal_10};
assign rxbvalid = munoc_signal_02;
assign munoc_signal_19 = rxbready;
assign {rxbid,rxbresp} = munoc_signal_29;

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(BW_AXI_TID),
	.BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
	.BW_NODE_DATA(BW_NODE_DATA),
	.CHECK_WID(CHECK_WID)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),

	.rxawid(munoc_signal_01),
	.rxawaddr(munoc_signal_07),
	.rxawlen(munoc_signal_24),
	.rxawsize(munoc_signal_18),
	.rxawburst(munoc_signal_35),
	.rxawvalid(munoc_signal_32),
	.rxawready(munoc_signal_03),

	.rxwid(rxwid),
	.rxwdata(rxwdata),
	.rxwstrb(rxwstrb),
	.rxwlast(rxwlast),
	.rxwvalid(rxwvalid),
	.rxwready(rxwready),

	.rxbid(munoc_signal_08),
	.rxbresp(munoc_signal_10),
	.rxbvalid(munoc_signal_26),
	.rxbready(munoc_signal_15),

	.rxarid(munoc_signal_05),
	.rxaraddr(munoc_signal_14),
	.rxarlen(munoc_signal_12),
	.rxarsize(munoc_signal_31),
	.rxarburst(munoc_signal_33),
	.rxarvalid(munoc_signal_22),
	.rxarready(munoc_signal_17),

	.rxrid(rxrid),
	.rxrdata(rxrdata),
	.rxrresp(rxrresp),
	.rxrlast(rxrlast),
	.rxrvalid(rxrvalid),
	.rxrready(rxrready),

	.spaddr(spaddr),
	.spwrite(spwrite),
	.spsel(spsel),
	.spenable(spenable),
	.spwdata(spwdata),
	.sptid(sptid),
	.sprdata(sprdata),
	.spready(spready),
	.spslverr(spslverr),
	.spwstrb(spwstrb)
);

endmodule
