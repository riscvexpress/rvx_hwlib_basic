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
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_083
(
	rvx_port_09,
	rvx_port_28,
  rvx_port_43,
  rvx_port_13,

  rvx_port_07,
	rvx_port_03,
	rvx_port_44,
	rvx_port_39,
	rvx_port_04,
	rvx_port_37,
	rvx_port_08,

	rvx_port_05,
	rvx_port_45,
	rvx_port_23,
	rvx_port_15,
	rvx_port_27,
	rvx_port_31,

	rvx_port_36,
  rvx_port_38,
  rvx_port_14,
  rvx_port_29,
  rvx_port_35,
  rvx_port_06,
  rvx_port_01,

  rvx_port_42,
  rvx_port_46,
  rvx_port_26,
  rvx_port_47,
  rvx_port_40,
  rvx_port_21,

  rvx_port_11,
  rvx_port_32,
  rvx_port_33,
  rvx_port_10,

  rvx_port_18,
	rvx_port_02,
	rvx_port_12,

	rvx_port_19,
	rvx_port_20,
	rvx_port_24,
	rvx_port_50, 

	rvx_port_16,
	rvx_port_41,
	rvx_port_48,

	rvx_port_30,
	rvx_port_25,
	rvx_port_22,

	rvx_port_49,
	rvx_port_34,
	rvx_port_00,
	rvx_port_17
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = 4;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_3 = 4;

input wire rvx_port_09;
input wire rvx_port_28;
input wire rvx_port_43;
input wire rvx_port_13;

input wire [RVX_GPARA_2-1:0] rvx_port_07;
input wire [RVX_GPARA_1-1:0] rvx_port_03;
input wire [`BW_AXI_ALEN-1:0] rvx_port_44;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_39;
input wire [`BW_AXI_ABURST-1:0] rvx_port_04;
input wire rvx_port_37;
output wire rvx_port_08;

output wire [RVX_GPARA_2-1:0] rvx_port_05;
output wire [RVX_GPARA_0-1:0] rvx_port_45;
output wire [`BW_AXI_RRESP-1:0] rvx_port_23;
output wire rvx_port_15;
output wire rvx_port_27;
input wire rvx_port_31;

input wire [RVX_GPARA_2-1:0] rvx_port_36;
input wire [RVX_GPARA_1-1:0] rvx_port_38;
input wire [`BW_AXI_ALEN-1:0] rvx_port_14;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_29;
input wire [`BW_AXI_ABURST-1:0] rvx_port_35;
input wire rvx_port_06;
output wire rvx_port_01;

input wire [RVX_GPARA_2-1:0] rvx_port_42;
input wire [RVX_GPARA_0-1:0] rvx_port_46;
input wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_port_26;
input wire rvx_port_47;
input wire rvx_port_40;
output wire rvx_port_21;

output wire [RVX_GPARA_2-1:0] rvx_port_11;
output wire [`BW_AXI_BRESP-1:0] rvx_port_32;
output wire rvx_port_33;
input wire rvx_port_10;

output wire [RVX_GPARA_1-1:0] rvx_port_18;
output wire rvx_port_02;
input wire rvx_port_12;

output wire [RVX_GPARA_0-1:0] rvx_port_19;
output wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_port_20;
output wire rvx_port_24;
input wire rvx_port_50;

input wire [`BW_AXI_BRESP-1:0] rvx_port_16;
input wire rvx_port_41;
output wire rvx_port_48;

output wire [RVX_GPARA_1-1:0] rvx_port_30;
output wire rvx_port_25;
input wire rvx_port_22;

input wire [RVX_GPARA_0-1:0] rvx_port_49;
input wire [`BW_AXI_RRESP-1:0] rvx_port_34;
input wire rvx_port_00;
output wire rvx_port_17;

wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire [RVX_GPARA_1-1:0] rvx_signal_33;
wire [`BW_AXI_ALEN-1:0] rvx_signal_04;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_30;
wire [`BW_AXI_ABURST-1:0] rvx_signal_38;
wire rvx_signal_18;
wire rvx_signal_20;
wire rvx_signal_40;

wire [RVX_GPARA_2-1:0] rvx_signal_43;
wire [RVX_GPARA_0-1:0] rvx_signal_26;
wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_signal_35;
wire rvx_signal_22;
wire rvx_signal_39;
wire rvx_signal_10;

wire [RVX_GPARA_2-1:0] rvx_signal_09;
wire [`BW_AXI_BRESP-1:0] rvx_signal_37;
wire rvx_signal_05;
wire rvx_signal_25;

wire [RVX_GPARA_2-1:0] rvx_signal_46;
wire [RVX_GPARA_1-1:0] rvx_signal_02;
wire [`BW_AXI_ALEN-1:0] rvx_signal_41;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_16;
wire [`BW_AXI_ABURST-1:0] rvx_signal_08;
wire rvx_signal_47;
wire rvx_signal_36;
wire rvx_signal_23;

wire [RVX_GPARA_2-1:0] rvx_signal_34;
wire [RVX_GPARA_0-1:0] rvx_signal_42;
wire [`BW_AXI_RRESP-1:0] rvx_signal_24;
wire rvx_signal_21;
wire rvx_signal_31;
wire rvx_signal_28;

wire rvx_signal_12;

localparam  RVX_LPARA_0 = 1 + RVX_GPARA_2; 

wire rvx_signal_45;
wire rvx_signal_17;
wire rvx_signal_48;
wire [RVX_LPARA_0-1:0] rvx_signal_11;
wire rvx_signal_03;
wire rvx_signal_00;
wire rvx_signal_29;
wire [RVX_LPARA_0-1:0] rvx_signal_07;

wire rvx_signal_14;
wire rvx_signal_13;
wire rvx_signal_32;
wire [RVX_LPARA_0-1:0] rvx_signal_44;
wire rvx_signal_01;
wire rvx_signal_15;
wire rvx_signal_19;
wire [RVX_LPARA_0-1:0] rvx_signal_27;

RVX_MODULE_067
#(
  .RVX_GPARA_1(RVX_GPARA_1),
  .RVX_GPARA_2(RVX_GPARA_0),
  .RVX_GPARA_0(RVX_GPARA_2),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE)
)
i_rvx_instance_1
(
	.rvx_port_45(rvx_port_09),
	.rvx_port_43(rvx_port_28),
  .rvx_port_46(rvx_port_43),
  .rvx_port_61(rvx_port_13),

  .rvx_port_14(rvx_port_07),
	.rvx_port_24(rvx_port_03),
	.rvx_port_62(rvx_port_44),
	.rvx_port_41(rvx_port_39),
	.rvx_port_29(rvx_port_04),
	.rvx_port_27(rvx_port_37),
	.rvx_port_53(rvx_port_08),

	.rvx_port_03(rvx_port_05),
	.rvx_port_34(rvx_port_45),
	.rvx_port_18(rvx_port_23),
	.rvx_port_54(rvx_port_15),
	.rvx_port_10(rvx_port_27),
	.rvx_port_30(rvx_port_31),

	.rvx_port_19(rvx_port_36),
  .rvx_port_40(rvx_port_38),
  .rvx_port_23(rvx_port_14),
  .rvx_port_59(rvx_port_29),
  .rvx_port_42(rvx_port_35),
  .rvx_port_38(rvx_port_06),
  .rvx_port_32(rvx_port_01),

  .rvx_port_44(rvx_port_42),
  .rvx_port_37(rvx_port_46),
  .rvx_port_08(rvx_port_26),
  .rvx_port_64(rvx_port_47),
  .rvx_port_04(rvx_port_40),
  .rvx_port_20(rvx_port_21),

  .rvx_port_63(rvx_port_11),
  .rvx_port_07(rvx_port_32),
  .rvx_port_47(rvx_port_33),
  .rvx_port_01(rvx_port_10),

  .rvx_port_39(rvx_signal_06),
	.rvx_port_12(rvx_signal_33),
  .rvx_port_13(rvx_signal_04),
	.rvx_port_02(rvx_signal_30),
  .rvx_port_22(rvx_signal_38),
  .rvx_port_48(rvx_signal_18),
	.rvx_port_36(rvx_signal_20),
	.rvx_port_09(rvx_signal_40),

	.rvx_port_21(rvx_signal_43),
  .rvx_port_31(rvx_signal_26),
	.rvx_port_26(rvx_signal_35),
	.rvx_port_65(rvx_signal_22),
	.rvx_port_58(rvx_signal_39),
	.rvx_port_52(rvx_signal_10), 

	.rvx_port_35(rvx_signal_09),
	.rvx_port_17(rvx_signal_37),
	.rvx_port_49(rvx_signal_05),
	.rvx_port_00(rvx_signal_25),

  .rvx_port_56(rvx_signal_46),
	.rvx_port_05(rvx_signal_02),
  .rvx_port_11(rvx_signal_41),
	.rvx_port_51(rvx_signal_16),
  .rvx_port_50(rvx_signal_08),
  .rvx_port_15(rvx_signal_47),
	.rvx_port_60(rvx_signal_36),
	.rvx_port_33(rvx_signal_23),

	.rvx_port_25(rvx_signal_34),
	.rvx_port_55(rvx_signal_42),
	.rvx_port_28(rvx_signal_24),
	.rvx_port_57(rvx_signal_21),
	.rvx_port_06(rvx_signal_31),
	.rvx_port_16(rvx_signal_28)
);

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_GPARA_3)
)
i_rvx_instance_2
(
	.clk(rvx_port_09),
	.rstnn(rvx_port_28),
	.enable(rvx_port_13),
  .clear(rvx_port_43),
	.wready(rvx_signal_45),
	.wrequest(rvx_signal_17),
	.wdata(rvx_signal_11),
  .wnum(),
	.rready(rvx_signal_03),
	.rrequest(rvx_signal_00),
	.rdata(rvx_signal_07),
	.wfull(),
	.rempty(),
  .rnum()
);

assign rvx_signal_17 = rvx_signal_36 & rvx_port_22;
assign rvx_signal_11 = {rvx_signal_47, rvx_signal_46};
assign rvx_signal_00 = rvx_port_00 & rvx_signal_28;

assign rvx_port_30 = rvx_signal_02;
assign rvx_port_25 = rvx_signal_45 & rvx_signal_36;
assign rvx_signal_23 = rvx_signal_45 & rvx_port_22;

assign {rvx_signal_21,rvx_signal_34} = rvx_signal_07;
assign rvx_signal_42 = rvx_port_49;
assign rvx_signal_24 = rvx_port_34;
assign rvx_signal_31 = rvx_signal_03 & rvx_port_00;
assign rvx_port_17 = rvx_signal_03 & rvx_signal_28;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_GPARA_3)
)
i_rvx_instance_0
(
	.clk(rvx_port_09),
	.rstnn(rvx_port_28),
	.enable(rvx_port_13),
  .clear(rvx_port_43),
	.wready(rvx_signal_14),
	.wrequest(rvx_signal_13),
	.wdata(rvx_signal_44),
  .wnum(),
	.rready(rvx_signal_01),
	.rrequest(rvx_signal_15),
	.rdata(rvx_signal_27),
	.wfull(),
	.rempty(),
  .rnum()
);

assign rvx_signal_13 = rvx_signal_20 & rvx_port_12;
assign rvx_signal_44 = {rvx_signal_18, rvx_signal_06};
assign rvx_signal_15 = rvx_port_41 & rvx_port_48;

assign rvx_port_18 = rvx_signal_33;
assign rvx_port_02 = rvx_signal_14 & rvx_signal_20;
assign rvx_signal_40 = rvx_signal_14 & rvx_port_12;

assign rvx_port_19 = rvx_signal_26;
assign rvx_port_20 = rvx_signal_35;
assign rvx_port_24 = rvx_signal_39;
assign rvx_signal_10 = rvx_port_50;

assign {rvx_signal_12, rvx_signal_09} = rvx_signal_27;
assign rvx_signal_37 = rvx_port_16;
assign rvx_signal_05 = rvx_signal_01 & rvx_signal_12 & rvx_port_41;
assign rvx_port_48 = rvx_signal_01 & (rvx_signal_12? rvx_signal_25 : 0);

endmodule
