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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************
`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_049
(
	rvx_port_08,
	rvx_port_15,

	rvx_port_09,
	rvx_port_31,
	rvx_port_05,
	rvx_port_20,
	rvx_port_28,
	rvx_port_04,
	rvx_port_26,
	rvx_port_07,
	rvx_port_37,
	rvx_port_29,
	rvx_port_22,

	rvx_port_02,
	rvx_port_06,
	rvx_port_21,
	rvx_port_23,
	rvx_port_32,
	rvx_port_27,
	rvx_port_24,

	rvx_port_36,
	rvx_port_14,
	rvx_port_38,
	rvx_port_11,
	rvx_port_16,
	rvx_port_00,
	rvx_port_13,
	rvx_port_12,
	rvx_port_17,
	rvx_port_34,

	rvx_port_03,
	rvx_port_25,
	rvx_port_19,
	rvx_port_01,
	rvx_port_10,
	rvx_port_30,
	rvx_port_18,
	rvx_port_39,
	rvx_port_33,
	rvx_port_35
);





parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_5 = 2;
parameter RVX_GPARA_2 = 8;
parameter RVX_GPARA_0 = 1;

`include "rvx_include_11.vh"

localparam  RVX_LPARA_0 = `NUM_BYTE(RVX_GPARA_3);
localparam  RVX_LPARA_1 = 3'h 1;

input wire rvx_port_08;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_09;
input wire rvx_port_31;
input wire rvx_port_05;
input wire rvx_port_20;
input wire [`BW_AXI_ALEN-1:0] rvx_port_28;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_04;
input wire [`BW_AXI_ABURST-1:0] rvx_port_26;
input wire [RVX_LPARA_0-1:0] rvx_port_07;
input wire [RVX_GPARA_3-1:0] rvx_port_37;
input wire [RVX_GPARA_4-1:0] rvx_port_29;
input wire [RVX_GPARA_1-1:0] rvx_port_22;

input wire [2-1:0] rvx_port_02;
output wire rvx_port_06;
output wire rvx_port_21;
output wire rvx_port_23;
output wire [`BW_AXI_RESP-1:0] rvx_port_32;
output wire [RVX_GPARA_3-1:0] rvx_port_27;
output wire [RVX_GPARA_1-1:0] rvx_port_24;

output wire rvx_port_36;
input wire rvx_port_14;
output wire [3-1:0] rvx_port_38;
output wire [3-1:0] rvx_port_11;
output wire [RVX_GPARA_5-1:0] rvx_port_16;
output wire [RVX_GPARA_2-1:0] rvx_port_00;
output wire [RVX_GPARA_4-1:0] rvx_port_13;
output wire [RVX_LPARA_0-1:0] rvx_port_12;
output wire [RVX_GPARA_3-1:0] rvx_port_17;
output wire [BW_TLOT_A_USER-1:0] rvx_port_34;

input wire rvx_port_03;
output wire rvx_port_25;
input wire [3-1:0] rvx_port_19;
input wire [3-1:0] rvx_port_01;
input wire [RVX_GPARA_5-1:0] rvx_port_10;
input wire [RVX_GPARA_2-1:0] rvx_port_30;
input wire [RVX_GPARA_0-1:0] rvx_port_18;
input wire [RVX_GPARA_3-1:0] rvx_port_39;
input wire rvx_port_33;
input wire [BW_TLOT_D_USER-1:0] rvx_port_35;

wire [BW_TLOT_INTG-1:0] rvx_signal_0;
wire [BW_TLOT_INTG-1:0] rvx_signal_5;

wire [BW_TLOT_INTG-1:0] rvx_signal_1;
wire [BW_TLOT_INTG-1:0] rvx_signal_4;
wire rvx_signal_6;
wire rvx_signal_2;
wire rvx_signal_3;

MUNOC_XMI2TLUL
#(
	.BW_ADDR(RVX_GPARA_4),
	.BW_DATA(RVX_GPARA_3),
	.BW_BURDEN(RVX_GPARA_1),
	.BW_TLUL_SIZE(RVX_GPARA_5),
	.BW_TLUL_SOURCE(RVX_GPARA_2),
	.BW_TLUL_SINK(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_08),
	.rstnn(rvx_port_15),

	.rlxqdready(rvx_port_09),
	.rlxqvalid(rvx_port_31),
	.rlxqlast(rvx_port_05),
	.rlxqwrite(rvx_port_20),
	.rlxqlen(rvx_port_28),
	.rlxqsize(rvx_port_04),
	.rlxqburst(rvx_port_26),
	.rlxqwstrb(rvx_port_07),
	.rlxqwdata(rvx_port_37),
	.rlxqaddr(rvx_port_29),
	.rlxqburden(rvx_port_22),

	.rlxydready(rvx_port_02),
	.rlxyvalid(rvx_port_06),
	.rlxylast(rvx_port_21),
	.rlxywreply(rvx_port_23),
	.rlxyresp(rvx_port_32),
	.rlxyrdata(rvx_port_27),
	.rlxyburden(rvx_port_24),

	.stlavalid(rvx_port_36),
	.stlaready(rvx_port_14),
	.stlaopcode(rvx_port_38),
	.stlaparam(rvx_port_11),
	.stlasize(rvx_port_16),
	.stlasource(rvx_port_00),
	.stlaaddress(rvx_port_13),
	.stlamask(rvx_port_12),
	.stladata(rvx_port_17),

	.stldvalid(rvx_port_03),
	.stldready(rvx_port_25),
	.stldopcode(rvx_port_19),
	.stldparam(rvx_port_01),
	.stldsize(rvx_port_10),
	.stldsource(rvx_port_30),
	.stldsink(rvx_port_18),
	.stlddata(rvx_port_39),
	.stlderror(rvx_signal_3)
);

assign rvx_signal_0 = TLOT_SECDED_INV_64_57({TLOT_MUBI4_FALSE,rvx_port_13,rvx_port_38,rvx_port_12});
assign rvx_signal_5 = TLOT_SECDED_INV_39_32(rvx_port_17);
assign rvx_port_34 = {5'b 0, TLOT_MUBI4_FALSE, rvx_signal_0, rvx_signal_5};

assign rvx_signal_1 = TLOT_SECDED_INV_64_57({rvx_port_19,rvx_port_10,rvx_port_33});
assign rvx_signal_4 = TLOT_SECDED_INV_39_32(rvx_port_39);
assign rvx_signal_6 = (rvx_signal_1!=rvx_port_35[13:7]);
assign rvx_signal_2 = (rvx_port_19==RVX_LPARA_1) & (rvx_signal_4!=rvx_port_35[6:0]);
assign rvx_signal_3 = rvx_port_33 | rvx_signal_6 | rvx_signal_2;

endmodule
