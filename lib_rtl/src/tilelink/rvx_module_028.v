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
`include "rvx_include_05.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_028 (
	rvx_port_21,
	rvx_port_46,

	rvx_port_25,
	rvx_port_03,
	rvx_port_58,
	rvx_port_31,
	rvx_port_69,
	rvx_port_02,
	rvx_port_63,
	rvx_port_13,
	rvx_port_15,
	rvx_port_68,

	rvx_port_06,
	rvx_port_71,
	rvx_port_01,
	rvx_port_04,
	rvx_port_50,
	rvx_port_30,
	rvx_port_38,
	rvx_port_47,
	rvx_port_10,

	rvx_port_18,
	rvx_port_62,
	rvx_port_44,
	rvx_port_22,
	rvx_port_14,
	rvx_port_28,
	rvx_port_39,
	rvx_port_55,
	rvx_port_00,	
	rvx_port_51,

	rvx_port_59,
	rvx_port_34,
	rvx_port_33,
	rvx_port_17,
	rvx_port_27,
	rvx_port_42,
	rvx_port_12,
	rvx_port_29,
	rvx_port_43,
	rvx_port_52,

	rvx_port_19,
	rvx_port_67,
	rvx_port_61,

	rvx_port_40,
	rvx_port_07,
	rvx_port_64,
	rvx_port_26,
	rvx_port_65,
	rvx_port_08,
	rvx_port_72,

	rvx_port_70,
	rvx_port_41,
	rvx_port_16,
	rvx_port_05,
	rvx_port_36, 

	rvx_port_60,
	rvx_port_56,
	rvx_port_32,
	rvx_port_53,

	rvx_port_37,
	rvx_port_35,
	rvx_port_45,
	rvx_port_09,
	rvx_port_66,
	rvx_port_54,
	rvx_port_23,

	rvx_port_11,
	rvx_port_20,
	rvx_port_24,
	rvx_port_48,
	rvx_port_49,
	rvx_port_57
);





parameter RVX_GPARA_2 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_0 = 1; 
parameter RVX_GPARA_5 = 1; 

localparam  RVX_LPARA_2 = (RVX_GPARA_2/8); 
localparam  RVX_LPARA_1 = `RVX_GDEF_191(RVX_GPARA_3,RVX_GPARA_0);

parameter RVX_GPARA_1 = 4;

localparam  RVX_LPARA_0 = RVX_GPARA_4;
localparam  RVX_LPARA_3 = RVX_GPARA_2;

localparam  RVX_LPARA_4 = 3;

input wire rvx_port_21, rvx_port_46;

output wire rvx_port_25;
input wire rvx_port_03;
input wire [`RVX_GDEF_144-1:0] rvx_port_58;
input wire [`RVX_GDEF_440-1:0] rvx_port_31;
input wire [RVX_GPARA_0-1:0] rvx_port_69;
input wire [RVX_GPARA_3-1:0] rvx_port_02;
input wire [RVX_GPARA_4-1:0] rvx_port_63;
input wire [RVX_LPARA_2-1:0] rvx_port_13;
input wire [RVX_GPARA_2-1:0] rvx_port_15;
input wire rvx_port_68;

input wire rvx_port_06;
output wire rvx_port_71;
output wire [`RVX_GDEF_144-1:0] rvx_port_01;
output wire [`RVX_GDEF_440-1:0] rvx_port_04;
output wire [RVX_GPARA_0-1:0] rvx_port_50;
output wire [RVX_GPARA_3-1:0] rvx_port_30;
output wire [RVX_GPARA_4-1:0] rvx_port_38;
output wire [RVX_LPARA_2-1:0] rvx_port_47;
output wire [RVX_GPARA_2-1:0] rvx_port_10;

output wire rvx_port_18;
input wire rvx_port_62;
input wire [`RVX_GDEF_144-1:0] rvx_port_44;
input wire [`RVX_GDEF_440-1:0] rvx_port_22;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire [RVX_GPARA_3-1:0] rvx_port_28;
input wire [RVX_GPARA_4-1:0] rvx_port_39;
input wire [RVX_LPARA_2-1:0] rvx_port_55;
input wire [RVX_GPARA_2-1:0] rvx_port_00;
input wire rvx_port_51;

input wire rvx_port_59;
output wire rvx_port_34;
output wire [`RVX_GDEF_144-1:0] rvx_port_33;
output wire [`RVX_GDEF_440-1:0] rvx_port_17;
output wire [RVX_GPARA_0-1:0] rvx_port_27;
output wire [RVX_GPARA_3-1:0] rvx_port_42;
output wire [RVX_GPARA_5-1:0] rvx_port_12;
output wire rvx_port_29;
output wire [RVX_GPARA_2-1:0] rvx_port_43;
output wire rvx_port_52;

output wire rvx_port_19;
input wire rvx_port_67;
input wire [RVX_GPARA_5-1:0] rvx_port_61;

output wire [RVX_GPARA_1-1:0] rvx_port_40;
output wire [RVX_LPARA_0-1:0] rvx_port_07;
output wire [`BW_AXI_ALEN-1:0] rvx_port_64;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_26;
output wire [`BW_AXI_ABURST-1:0] rvx_port_65;
output wire rvx_port_08;
input wire rvx_port_72;

output wire [RVX_LPARA_3-1:0] rvx_port_70;
output wire [`BW_AXI_WSTRB(RVX_LPARA_3)-1:0] rvx_port_41;
output wire rvx_port_16;
output wire rvx_port_05;
input wire rvx_port_36;

input wire [RVX_GPARA_1-1:0] rvx_port_60;
input wire [`BW_AXI_BRESP-1:0] rvx_port_56;
input wire rvx_port_32;
output wire rvx_port_53;

output wire [RVX_GPARA_1-1:0] rvx_port_37;
output wire [RVX_LPARA_0-1:0] rvx_port_35;
output wire [`BW_AXI_ALEN-1:0] rvx_port_45;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_09;
output wire [`BW_AXI_ABURST-1:0] rvx_port_66;
output wire rvx_port_54;
input wire rvx_port_23;

input wire [RVX_GPARA_1-1:0] rvx_port_11;
input wire [RVX_LPARA_3-1:0] rvx_port_20;
input wire [`BW_AXI_RRESP-1:0] rvx_port_24;
input wire rvx_port_48;
input wire rvx_port_49;
output wire rvx_port_57;

wire rvx_signal_04;
wire rvx_signal_11;
wire [RVX_LPARA_1-1:0] rvx_signal_03;
wire rvx_signal_06;
wire rvx_signal_02;
wire [RVX_LPARA_1-1:0] rvx_signal_00;

wire rvx_signal_08;
wire rvx_signal_01;
wire [RVX_LPARA_1-1:0] rvx_signal_09;
wire rvx_signal_10;
wire rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_05;

RVX_MODULE_083
#(
	.RVX_GPARA_2(RVX_GPARA_2),
	.RVX_GPARA_0(RVX_GPARA_4),
	.RVX_GPARA_5(RVX_GPARA_3),
	.RVX_GPARA_4(RVX_GPARA_0),
	.RVX_GPARA_1(RVX_GPARA_5),
	.RVX_GPARA_3(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_35(rvx_port_21),
	.rvx_port_38(rvx_port_46),

	.rvx_port_15(rvx_port_25),
	.rvx_port_28(rvx_port_03),
	.rvx_port_21(rvx_port_58),
	.rvx_port_37(rvx_port_31),
	.rvx_port_45(rvx_port_69),
	.rvx_port_08(rvx_port_02),
	.rvx_port_23(rvx_port_63),
	.rvx_port_20(rvx_port_13),
	.rvx_port_05(rvx_port_15),
	.rvx_port_32(rvx_port_68),

	.rvx_port_19(rvx_port_18),
	.rvx_port_14(rvx_port_62),
	.rvx_port_33(rvx_port_44),
	.rvx_port_10(rvx_port_22),
	.rvx_port_06(rvx_port_14),
	.rvx_port_40(rvx_port_28),
	.rvx_port_09(rvx_port_39),
	.rvx_port_47(rvx_port_55),
	.rvx_port_18(rvx_port_00),
	.rvx_port_22(rvx_port_51),

	.rvx_port_00(rvx_port_40),
	.rvx_port_36(rvx_port_07),
	.rvx_port_02(rvx_port_64),
	.rvx_port_43(rvx_port_26),
	.rvx_port_39(rvx_port_65),
	.rvx_port_29(rvx_port_08),
	.rvx_port_25(rvx_port_72),

	.rvx_port_04(rvx_signal_04),
	.rvx_port_46(rvx_signal_11),
	.rvx_port_31(rvx_signal_03),
	.rvx_port_26(rvx_signal_08),
	.rvx_port_12(rvx_signal_01),
	.rvx_port_30(rvx_signal_09),

	.rvx_port_07(),
	.rvx_port_34(rvx_port_70),
	.rvx_port_11(rvx_port_41),
	.rvx_port_42(rvx_port_16),
	.rvx_port_03(rvx_port_05),
	.rvx_port_27(rvx_port_36),

	.rvx_port_17(rvx_port_37),
	.rvx_port_16(rvx_port_35),
	.rvx_port_01(rvx_port_45),
	.rvx_port_44(rvx_port_09),
	.rvx_port_41(rvx_port_66),
	.rvx_port_24(rvx_port_54),
	.rvx_port_13(rvx_port_23)
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(RVX_LPARA_4)
)
i_rvx_instance_0
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_46),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_04),
	.wrequest(rvx_signal_11),
	.wdata(rvx_signal_03),
	.rready(rvx_signal_06),
	.rrequest(rvx_signal_02),
	.rdata(rvx_signal_00),
	.wfull(),
	.rempty()
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(RVX_LPARA_4)
)
i_rvx_instance_3
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_46),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_08),
	.wrequest(rvx_signal_01),
	.wdata(rvx_signal_09),
	.rready(rvx_signal_10),
	.rrequest(rvx_signal_07),
	.rdata(rvx_signal_05),
	.wfull(),
	.rempty()
);

RVX_MODULE_017
#(
	.RVX_GPARA_2(RVX_GPARA_2),
	.RVX_GPARA_1(RVX_GPARA_4),
	.RVX_GPARA_3(RVX_GPARA_3),
	.RVX_GPARA_4(RVX_GPARA_0),
	.RVX_GPARA_5(RVX_GPARA_5),
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_2
(
	.rvx_port_16(rvx_port_21),
	.rvx_port_09(rvx_port_46),

	.rvx_port_13(rvx_signal_06),
	.rvx_port_04(rvx_signal_00),
	.rvx_port_18(rvx_signal_02),
	.rvx_port_00(rvx_signal_10),
	.rvx_port_07(rvx_signal_05),
	.rvx_port_02(rvx_signal_07),

	.rvx_port_01(rvx_port_60),
	.rvx_port_03(rvx_port_56),
	.rvx_port_10(rvx_port_32),
	.rvx_port_24(rvx_port_53),

	.rvx_port_21(rvx_port_11),
	.rvx_port_14(rvx_port_20),
	.rvx_port_20(rvx_port_24),
	.rvx_port_15(rvx_port_48),
	.rvx_port_22(rvx_port_49),
	.rvx_port_11(rvx_port_57),

	.rvx_port_05(rvx_port_59),
	.rvx_port_19(rvx_port_34),
	.rvx_port_27(rvx_port_33),
	.rvx_port_25(rvx_port_17),
	.rvx_port_17(rvx_port_27),
	.rvx_port_12(rvx_port_42),
	.rvx_port_23(rvx_port_12),
	.rvx_port_08(rvx_port_29),
	.rvx_port_06(rvx_port_43),
	.rvx_port_26(rvx_port_52)
);

assign rvx_port_71 = 0;
assign rvx_port_01 = 0;
assign rvx_port_04 = 0;
assign rvx_port_50 = 0;
assign rvx_port_30 = 0;
assign rvx_port_38 = 0;
assign rvx_port_47 = 0;
assign rvx_port_10 = 0;

assign rvx_port_19 = 1;

endmodule
