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
`include "ervp_axi_define.vh"
`include "ervp_ahb_define.vh"



module MUNOC_AXI2AHB_BRIDGE (
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

	shsel,
	shaddr,
	shburst,
	shmasterlock,
	shprot,
	shsize,
	shtrans,
	shwrite,
	shwdata,	
	shready,
	shresp,
	shrdata
);



parameter BW_AXI_TID = 4;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;

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

output wire shsel;
output wire [BW_PLATFORM_ADDR-1:0] shaddr;
output wire [`BW_AHB_BURST-1:0] shburst;
output wire shmasterlock;
output wire [`BW_AHB_PROT-1:0] shprot;
output wire [`BW_AHB_SIZE-1:0] shsize;
output wire [`BW_AHB_TRANS-1:0] shtrans;
output wire shwrite;
output wire [BW_NODE_DATA-1:0] shwdata;

input wire shready;
input wire shresp;
input wire [BW_NODE_DATA-1:0] shrdata;

wire munoc_signal_31;
wire munoc_signal_29;
wire [`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_05;
wire munoc_signal_07;
wire munoc_signal_12;
wire [`BW_ARCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_20;

wire [BW_AXI_TID-1:0] munoc_signal_02;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_09;
wire [`BW_AXI_ALEN-1:0] munoc_signal_04;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_24;
wire [`BW_AXI_ABURST-1:0] munoc_signal_27;
wire munoc_signal_14;
wire munoc_signal_33;

wire munoc_signal_21;
wire munoc_signal_25;
wire [`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_00;
wire munoc_signal_08;
wire munoc_signal_34;
wire [`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)-1:0] munoc_signal_22;

wire [BW_AXI_TID-1:0] munoc_signal_15;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_18;
wire [`BW_AXI_ALEN-1:0] munoc_signal_13;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_30;
wire [`BW_AXI_ABURST-1:0] munoc_signal_32;
wire munoc_signal_11;
wire munoc_signal_19;

wire munoc_signal_23;
wire munoc_signal_01;
wire [`BW_BCHANNEL(BW_NODE_DATA)-1:0] munoc_signal_10;
wire munoc_signal_28;
wire munoc_signal_26;
wire [`BW_BCHANNEL(BW_NODE_DATA)-1:0] munoc_signal_35;

wire [BW_AXI_TID-1:0] munoc_signal_06;
wire [`BW_AXI_BRESP-1:0] munoc_signal_03;
wire munoc_signal_16;
wire munoc_signal_17;

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
	.wready(munoc_signal_31),
	.wrequest(munoc_signal_29),
	.wdata(munoc_signal_05),
	.rready(munoc_signal_07),
	.rrequest(munoc_signal_12),
	.rdata(munoc_signal_20),
	.wfull(),
	.rempty()
);

assign rxarready = munoc_signal_31;
assign munoc_signal_29 = rxarvalid;
assign munoc_signal_05 = {rxarid,rxaraddr,rxarlen,rxarsize,rxarburst};
assign munoc_signal_14 = munoc_signal_07;
assign munoc_signal_12 = munoc_signal_33;
assign {munoc_signal_02,munoc_signal_09,munoc_signal_04,munoc_signal_24,munoc_signal_27} = munoc_signal_20;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_AWCHANNEL(BW_AXI_TID,BW_PLATFORM_ADDR)),
	.DEPTH(2)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_21),
	.wrequest(munoc_signal_25),
	.wdata(munoc_signal_00),
	.rready(munoc_signal_08),
	.rrequest(munoc_signal_34),
	.rdata(munoc_signal_22),
	.wfull(),
	.rempty()
);

assign rxawready = munoc_signal_21;
assign munoc_signal_25 = rxawvalid;
assign munoc_signal_00 = {rxawid,rxawaddr,rxawlen,rxawsize,rxawburst};
assign munoc_signal_11 = munoc_signal_08;
assign munoc_signal_34 = munoc_signal_19;
assign {munoc_signal_15,munoc_signal_18,munoc_signal_13,munoc_signal_30,munoc_signal_32} = munoc_signal_22;

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
	.wready(munoc_signal_23),
	.wrequest(munoc_signal_01),
	.wdata(munoc_signal_35),
	.rready(munoc_signal_28),
	.rrequest(munoc_signal_26),
	.rdata(munoc_signal_10),
	.wfull(),
	.rempty()
);

assign munoc_signal_17 = munoc_signal_23;
assign munoc_signal_01 = munoc_signal_16;
assign munoc_signal_35 = {munoc_signal_06,munoc_signal_03};
assign rxbvalid = munoc_signal_28;
assign munoc_signal_26 = rxbready;
assign {rxbid,rxbresp} = munoc_signal_10;

MUNOC_MODULE_21
#(
	.MUNOC_GPARA_2(BW_AXI_TID),
	.MUNOC_GPARA_1(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_0(BW_NODE_DATA)
)
i_munoc_instance_3
(
	.munoc_port_27(clk),
	.munoc_port_07(rstnn),

	.munoc_port_38(munoc_signal_15),
	.munoc_port_36(munoc_signal_18),
	.munoc_port_44(munoc_signal_13),
	.munoc_port_18(munoc_signal_30),
	.munoc_port_24(munoc_signal_32),
	.munoc_port_13(munoc_signal_11),
	.munoc_port_34(munoc_signal_19),

	.munoc_port_42(rxwid),
	.munoc_port_39(rxwdata),
	.munoc_port_25(rxwstrb),
	.munoc_port_01(rxwlast),
	.munoc_port_20(rxwvalid),
	.munoc_port_22(rxwready),

	.munoc_port_37(munoc_signal_06),
	.munoc_port_35(munoc_signal_03),
	.munoc_port_33(munoc_signal_16),
	.munoc_port_31(munoc_signal_17),

	.munoc_port_11(munoc_signal_02),
	.munoc_port_10(munoc_signal_09),
	.munoc_port_23(munoc_signal_04),
	.munoc_port_16(munoc_signal_24),
	.munoc_port_32(munoc_signal_27),
	.munoc_port_05(munoc_signal_14),
	.munoc_port_08(munoc_signal_33),

	.munoc_port_06(rxrid),
	.munoc_port_15(rxrdata),
	.munoc_port_17(rxrresp),
	.munoc_port_30(rxrlast),
	.munoc_port_04(rxrvalid),
	.munoc_port_02(rxrready),

	.munoc_port_09(shsel),
	.munoc_port_19(shaddr),
	.munoc_port_28(shburst),
	.munoc_port_03(shmasterlock),
	.munoc_port_41(shprot),
	.munoc_port_14(shsize),
	.munoc_port_29(shtrans),
	.munoc_port_43(shwrite),
	.munoc_port_21(shwdata),
	.munoc_port_26(),

	.munoc_port_12(shready),
	.munoc_port_00(shresp),
	.munoc_port_40(shrdata)
);

endmodule
