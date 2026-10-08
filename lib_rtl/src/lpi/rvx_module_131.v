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





module RVX_MODULE_131
(
	rvx_port_40,
	rvx_port_20,
  rvx_port_07,
  rvx_port_27,

  rvx_port_41,
	rvx_port_33,
	rvx_port_05,
	rvx_port_17,
	rvx_port_15,
	rvx_port_30,
	rvx_port_16,

	rvx_port_34,
	rvx_port_35,
	rvx_port_12,
	rvx_port_38,
	rvx_port_19,
	rvx_port_22,

	rvx_port_10,
  rvx_port_39,
  rvx_port_23,
  rvx_port_42,
  rvx_port_04,
  rvx_port_21,
  rvx_port_08,

  rvx_port_29,
  rvx_port_36,
  rvx_port_37,
  rvx_port_18,
  rvx_port_09,
  rvx_port_06,

  rvx_port_43,
  rvx_port_01,
  rvx_port_25,
  rvx_port_02,

  rvx_port_26,
  rvx_port_28,
  rvx_port_11,
  rvx_port_44,
  rvx_port_13,
  rvx_port_00,

  rvx_port_31,
  rvx_port_14,
  rvx_port_24,
  rvx_port_32,
  rvx_port_03
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 4;
parameter MEMORY_OPERATION_TYPE = 3;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = RVX_GPARA_2;
localparam  BW_LPIXS_DATA = RVX_GPARA_0;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(RVX_GPARA_1);

`include "lpixs_lpara.vb"

input wire rvx_port_40;
input wire rvx_port_20;
input wire rvx_port_07;
input wire rvx_port_27;

input wire [RVX_GPARA_1-1:0] rvx_port_41;
input wire [RVX_GPARA_2-1:0] rvx_port_33;
input wire [`BW_AXI_ALEN-1:0] rvx_port_05;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_17;
input wire [`BW_AXI_ABURST-1:0] rvx_port_15;
input wire rvx_port_30;
output wire rvx_port_16;

output wire [RVX_GPARA_1-1:0] rvx_port_34;
output wire [RVX_GPARA_0-1:0] rvx_port_35;
output wire [`BW_AXI_RRESP-1:0] rvx_port_12;
output wire rvx_port_38;
output wire rvx_port_19;
input wire rvx_port_22;

input wire [RVX_GPARA_1-1:0] rvx_port_10;
input wire [RVX_GPARA_2-1:0] rvx_port_39;
input wire [`BW_AXI_ALEN-1:0] rvx_port_23;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_42;
input wire [`BW_AXI_ABURST-1:0] rvx_port_04;
input wire rvx_port_21;
output wire rvx_port_08;

input wire [RVX_GPARA_1-1:0] rvx_port_29;
input wire [RVX_GPARA_0-1:0] rvx_port_36;
input wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_port_37;
input wire rvx_port_18;
input wire rvx_port_09;
output wire rvx_port_06;

output wire [RVX_GPARA_1-1:0] rvx_port_43;
output wire [`BW_AXI_BRESP-1:0] rvx_port_01;
output wire rvx_port_25;
input wire rvx_port_02;

input wire [2-1:0] rvx_port_26;
output wire rvx_port_28;
output wire rvx_port_11;
output wire rvx_port_44;
output wire rvx_port_13;
output wire [BW_LPI_QDATA-1:0] rvx_port_00;

output wire [2-1:0] rvx_port_31;
input wire rvx_port_14;
input wire rvx_port_24;
input wire rvx_port_32;
input wire [BW_LPI_YDATA-1:0] rvx_port_03;

`include "lpixm_function.vb"

localparam  RVX_LPARA_2 = BW_AXI2LPIXM_BURDEN(RVX_GPARA_1);
localparam  RVX_LPARA_0 = BW_LPIXM_QPARCEL(RVX_GPARA_2,RVX_GPARA_0);
localparam  RVX_LPARA_4 = BW_LPIXM_YPARCEL(RVX_GPARA_0);
localparam  RVX_LPARA_3 = BW_LPI_DATA(RVX_LPARA_2,RVX_LPARA_0);
localparam  RVX_LPARA_1 = BW_LPI_DATA(RVX_LPARA_2,RVX_LPARA_4);

wire [2-1:0] rvx_signal_00;
wire rvx_signal_08;
wire rvx_signal_03;
wire rvx_signal_07;
wire rvx_signal_04;
wire [RVX_LPARA_3-1:0] rvx_signal_06;

wire [2-1:0] rvx_signal_02;
wire rvx_signal_09;
wire rvx_signal_01;
wire rvx_signal_05;
wire [RVX_LPARA_1-1:0] rvx_signal_10;

RVX_MODULE_008
#(
  .RVX_GPARA_2(RVX_GPARA_2),
  .RVX_GPARA_0(RVX_GPARA_0),
  .RVX_GPARA_1(RVX_GPARA_1),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE)
)
i_rvx_instance_1
(
	.rvx_port_34(rvx_port_40),
	.rvx_port_13(rvx_port_20),
  .rvx_port_11(rvx_port_07),
  .rvx_port_14(rvx_port_27),

  .rvx_port_24(rvx_port_41),
	.rvx_port_10(rvx_port_33),
	.rvx_port_32(rvx_port_05),
	.rvx_port_31(rvx_port_17),
	.rvx_port_44(rvx_port_15),
	.rvx_port_20(rvx_port_30),
	.rvx_port_43(rvx_port_16),

	.rvx_port_27(rvx_port_34),
	.rvx_port_35(rvx_port_35),
	.rvx_port_09(rvx_port_12),
	.rvx_port_17(rvx_port_38),
	.rvx_port_05(rvx_port_19),
	.rvx_port_16(rvx_port_22),

	.rvx_port_26(rvx_port_10),
  .rvx_port_19(rvx_port_39),
  .rvx_port_29(rvx_port_23),
  .rvx_port_41(rvx_port_42),
  .rvx_port_03(rvx_port_04),
  .rvx_port_33(rvx_port_21),
  .rvx_port_12(rvx_port_08),

  .rvx_port_25(rvx_port_29),
  .rvx_port_18(rvx_port_36),
  .rvx_port_21(rvx_port_37),
  .rvx_port_39(rvx_port_18),
  .rvx_port_02(rvx_port_09),
  .rvx_port_28(rvx_port_06),

  .rvx_port_37(rvx_port_43),
  .rvx_port_01(rvx_port_01),
  .rvx_port_15(rvx_port_25),
  .rvx_port_40(rvx_port_02),

  .rvx_port_06(rvx_signal_00),
  .rvx_port_42(rvx_signal_08),
  .rvx_port_38(rvx_signal_03),
  .rvx_port_08(rvx_signal_07),
  .rvx_port_04(rvx_signal_04),
  .rvx_port_07(rvx_signal_06),

  .rvx_port_00(rvx_signal_02),
  .rvx_port_30(rvx_signal_09),
  .rvx_port_23(rvx_signal_01),
  .rvx_port_36(rvx_signal_05),
  .rvx_port_22(rvx_signal_10)
);

RVX_MODULE_108
#(
  .RVX_GPARA_1(RVX_GPARA_2),
  .RVX_GPARA_0(RVX_GPARA_0),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .BW_LPI_BURDEN(RVX_LPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_17(rvx_port_40),
	.rvx_port_18(rvx_port_20),
  .rvx_port_08(rvx_port_07),
  .rvx_port_05(rvx_port_27),

  .rvx_port_07(rvx_signal_00),
  .rvx_port_23(rvx_signal_08),
  .rvx_port_16(rvx_signal_03),
  .rvx_port_06(rvx_signal_07),
  .rvx_port_01(rvx_signal_04),
  .rvx_port_11(rvx_signal_06),

  .rvx_port_20(rvx_signal_02),
  .rvx_port_10(rvx_signal_09),
  .rvx_port_22(rvx_signal_01),
  .rvx_port_25(rvx_signal_05),
  .rvx_port_03(rvx_signal_10),

  .rvx_port_24(rvx_port_26),
  .rvx_port_15(rvx_port_28),
  .rvx_port_02(rvx_port_11),
  .rvx_port_12(rvx_port_44),
  .rvx_port_19(rvx_port_13),
  .rvx_port_14(rvx_port_00),

  .rvx_port_21(rvx_port_31),
  .rvx_port_04(rvx_port_14),
  .rvx_port_00(rvx_port_24),
  .rvx_port_13(rvx_port_32),
  .rvx_port_09(rvx_port_03)
);

endmodule
