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




module RVX_MODULE_001
(
	rvx_port_42,
	rvx_port_56,
  rvx_port_27,
  rvx_port_06,

  rvx_port_65,
	rvx_port_50,
	rvx_port_07,
	rvx_port_55,
	rvx_port_57,
	rvx_port_44,
	rvx_port_22,

	rvx_port_11,
	rvx_port_59,
	rvx_port_37,
	rvx_port_30,
	rvx_port_15,
	rvx_port_51,

	rvx_port_03,
  rvx_port_38,
  rvx_port_64,
  rvx_port_09,
  rvx_port_21,
  rvx_port_13,
  rvx_port_34,

  rvx_port_12,
  rvx_port_31,
  rvx_port_62,
  rvx_port_54,
  rvx_port_17,
  rvx_port_53,

  rvx_port_39,
  rvx_port_36,
  rvx_port_60,
  rvx_port_02,

  rvx_port_04,
	rvx_port_58,
  rvx_port_26,
	rvx_port_63,
  rvx_port_00,
  rvx_port_41,
	rvx_port_48,
	rvx_port_47,

	rvx_port_20,
  rvx_port_40,
	rvx_port_46,
	rvx_port_32,
	rvx_port_49,
	rvx_port_25, 

	rvx_port_05,
	rvx_port_52,
	rvx_port_14,
	rvx_port_35,

	rvx_port_24,
	rvx_port_61,
  rvx_port_33,
	rvx_port_08,
  rvx_port_10,
  rvx_port_43,
	rvx_port_45,
	rvx_port_01,

	rvx_port_18,
	rvx_port_19,
	rvx_port_28,
	rvx_port_23,
	rvx_port_29,
	rvx_port_16
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 4;
parameter MEMORY_OPERATION_TYPE = 3;

input wire rvx_port_42;
input wire rvx_port_56;
input wire rvx_port_27;
input wire rvx_port_06;

input wire [RVX_GPARA_0-1:0] rvx_port_65;
input wire [RVX_GPARA_1-1:0] rvx_port_50;
input wire [`BW_AXI_ALEN-1:0] rvx_port_07;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_55;
input wire [`BW_AXI_ABURST-1:0] rvx_port_57;
input wire rvx_port_44;
output wire rvx_port_22;

output wire [RVX_GPARA_0-1:0] rvx_port_11;
output wire [RVX_GPARA_2-1:0] rvx_port_59;
output wire [`BW_AXI_RRESP-1:0] rvx_port_37;
output wire rvx_port_30;
output wire rvx_port_15;
input wire rvx_port_51;

input wire [RVX_GPARA_0-1:0] rvx_port_03;
input wire [RVX_GPARA_1-1:0] rvx_port_38;
input wire [`BW_AXI_ALEN-1:0] rvx_port_64;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_09;
input wire [`BW_AXI_ABURST-1:0] rvx_port_21;
input wire rvx_port_13;
output wire rvx_port_34;

input wire [RVX_GPARA_0-1:0] rvx_port_12;
input wire [RVX_GPARA_2-1:0] rvx_port_31;
input wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_62;
input wire rvx_port_54;
input wire rvx_port_17;
output wire rvx_port_53;

output wire [RVX_GPARA_0-1:0] rvx_port_39;
output wire [`BW_AXI_BRESP-1:0] rvx_port_36;
output wire rvx_port_60;
input wire rvx_port_02;

output wire [RVX_GPARA_0-1:0] rvx_port_04;
output wire [RVX_GPARA_1-1:0] rvx_port_58;
output wire [`BW_AXI_ALEN-1:0] rvx_port_26;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_63;
output wire [`BW_AXI_ABURST-1:0] rvx_port_00;
output wire rvx_port_41;
output wire rvx_port_48;
input wire rvx_port_47;

output wire [RVX_GPARA_0-1:0] rvx_port_20;
output wire [RVX_GPARA_2-1:0] rvx_port_40;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_46;
output wire rvx_port_32;
output wire rvx_port_49;
input wire rvx_port_25;

input wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire [`BW_AXI_BRESP-1:0] rvx_port_52;
input wire rvx_port_14;
output wire rvx_port_35;

output wire [RVX_GPARA_0-1:0] rvx_port_24;
output wire [RVX_GPARA_1-1:0] rvx_port_61;
output wire [`BW_AXI_ALEN-1:0] rvx_port_33;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_08;
output wire [`BW_AXI_ABURST-1:0] rvx_port_10;
output wire rvx_port_43;
output wire rvx_port_45;
input wire rvx_port_01;

input wire [RVX_GPARA_0-1:0] rvx_port_18;
input wire [RVX_GPARA_2-1:0] rvx_port_19;
input wire [`BW_AXI_RRESP-1:0] rvx_port_28;
input wire rvx_port_23;
input wire rvx_port_29;
output wire rvx_port_16;

`include "motype_lpara.vb"

RVX_MODULE_114
#(
  .RVX_GPARA_1(RVX_GPARA_1),
  .RVX_GPARA_0(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.rvx_port_17(rvx_port_42),
	.rvx_port_10(rvx_port_56),
  .rvx_port_07(rvx_port_27),
  .rvx_port_16(rvx_port_06 & READ_SUPPORTED),

  .rvx_port_12(rvx_port_65),
	.rvx_port_04(rvx_port_50),
	.rvx_port_15(rvx_port_07),
	.rvx_port_08(rvx_port_55),
	.rvx_port_11(rvx_port_57),
	.rvx_port_14(rvx_port_44),
	.rvx_port_18(rvx_port_22),

	.rvx_port_03(rvx_port_24),
	.rvx_port_01(rvx_port_61),
  .rvx_port_06(rvx_port_33),
	.rvx_port_09(rvx_port_08),
  .rvx_port_02(rvx_port_10),
  .rvx_port_05(rvx_port_43),
	.rvx_port_13(rvx_port_45),
	.rvx_port_00(rvx_port_01)
);

assign rvx_port_11 = rvx_port_18;
assign rvx_port_59 = rvx_port_19;
assign rvx_port_37 = rvx_port_28;
assign rvx_port_30 = rvx_port_23;
assign rvx_port_15 = rvx_port_29;
assign rvx_port_16 = rvx_port_51;

RVX_MODULE_114
#(
  .RVX_GPARA_1(RVX_GPARA_1),
  .RVX_GPARA_0(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.rvx_port_17(rvx_port_42),
	.rvx_port_10(rvx_port_56),
  .rvx_port_07(rvx_port_27),
  .rvx_port_16(rvx_port_06 & WRITE_SUPPORTED),

  .rvx_port_12(rvx_port_03),
	.rvx_port_04(rvx_port_38),
	.rvx_port_15(rvx_port_64),
	.rvx_port_08(rvx_port_09),
	.rvx_port_11(rvx_port_21),
	.rvx_port_14(rvx_port_13),
	.rvx_port_18(rvx_port_34),

	.rvx_port_03(rvx_port_04),
	.rvx_port_01(rvx_port_58),
	.rvx_port_06(rvx_port_26),
	.rvx_port_09(rvx_port_63),
	.rvx_port_02(rvx_port_00),
  .rvx_port_05(rvx_port_41),
	.rvx_port_13(rvx_port_48),
	.rvx_port_00(rvx_port_47)
);

assign rvx_port_20 = rvx_port_12;
assign rvx_port_40 = rvx_port_31;
assign rvx_port_46 = rvx_port_62;
assign rvx_port_32 = rvx_port_54;
assign rvx_port_49 = rvx_port_17;
assign rvx_port_53 = rvx_port_25;

assign rvx_port_39 = rvx_port_05;
assign rvx_port_36 = rvx_port_52;
assign rvx_port_60 = rvx_port_14;
assign rvx_port_35 = rvx_port_02;

endmodule
