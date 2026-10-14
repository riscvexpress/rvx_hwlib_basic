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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_074
(
	rvx_port_20,
	rvx_port_06,
  rvx_port_12,
  rvx_port_15,

  rvx_port_08,
  rvx_port_10,
  rvx_port_24,
  rvx_port_07,
  rvx_port_09,
  rvx_port_00,

  rvx_port_11,
  rvx_port_25,
  rvx_port_18,
  rvx_port_01,
  rvx_port_02,

  rvx_port_16,
  rvx_port_04,
  rvx_port_14,
  rvx_port_03,
  rvx_port_22,
  rvx_port_23,

  rvx_port_19,
  rvx_port_05,
  rvx_port_21,
  rvx_port_13,
  rvx_port_17
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = 32;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_1 = 8;

`include "lpi_burden_para.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"
`include "lpixs_function.vb"

localparam  RVX_LPARA_08 = BW_LPI_BURDEN;
localparam  RVX_LPARA_02 = BW_LPIXM_QPARCEL(RVX_GPARA_0,RVX_GPARA_2);
localparam  RVX_LPARA_05 = BW_LPIXM_YPARCEL(RVX_GPARA_2);
localparam  RVX_LPARA_00 = BW_LPI_DATA(RVX_LPARA_08,RVX_LPARA_02);
localparam  RVX_LPARA_09 = BW_LPI_DATA(RVX_LPARA_08,RVX_LPARA_05);

localparam  RVX_LPARA_04 = RVX_LPARA_08;
localparam  RVX_LPARA_07 = BW_LPIXS_QPARCEL(RVX_GPARA_0,RVX_GPARA_2);
localparam  RVX_LPARA_06 = BW_LPIXS_YPARCEL(RVX_GPARA_2);
localparam  RVX_LPARA_03 = BW_LPI_DATA(RVX_LPARA_04,RVX_LPARA_07);
localparam  RVX_LPARA_01 = BW_LPI_DATA(RVX_LPARA_04,RVX_LPARA_06);

input wire rvx_port_20;
input wire rvx_port_06;
input wire rvx_port_12;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_08;
input wire rvx_port_10;
input wire rvx_port_24;
input wire rvx_port_07;
input wire rvx_port_09;
input wire [RVX_LPARA_00-1:0] rvx_port_00;

input wire [2-1:0] rvx_port_11;
output wire rvx_port_25;
output wire rvx_port_18;
output wire rvx_port_01;
output wire [RVX_LPARA_09-1:0] rvx_port_02;

input wire [2-1:0] rvx_port_16;
output wire rvx_port_04;
output wire rvx_port_14;
output wire rvx_port_03;
output wire rvx_port_22;
output wire [RVX_LPARA_03-1:0] rvx_port_23;

output wire [2-1:0] rvx_port_19;
input wire rvx_port_05;
input wire rvx_port_21;
input wire rvx_port_13;
input wire [RVX_LPARA_01-1:0] rvx_port_17;

wire [2-1:0] rvx_signal_09;
wire rvx_signal_07;
wire rvx_signal_08;
wire rvx_signal_14;
wire rvx_signal_17;
wire [RVX_LPARA_00-1:0] rvx_signal_11;

wire [2-1:0] rvx_signal_10;
wire rvx_signal_21;
wire rvx_signal_02;
wire rvx_signal_18;
wire [RVX_LPARA_09-1:0] rvx_signal_04;

wire [2-1:0] rvx_signal_03;
wire rvx_signal_05;
wire rvx_signal_01;
wire rvx_signal_19;
wire rvx_signal_12;
wire [RVX_LPARA_03-1:0] rvx_signal_15;

wire [2-1:0] rvx_signal_06;
wire rvx_signal_20;
wire rvx_signal_00;
wire rvx_signal_16;
wire [RVX_LPARA_01-1:0] rvx_signal_13;

RVX_MODULE_014
#(
  .RVX_GPARA_0(RVX_GPARA_0),
  .RVX_GPARA_2(RVX_GPARA_2),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .RVX_GPARA_1(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_20(rvx_port_20),
	.rvx_port_06(rvx_port_06),
  .rvx_port_12(rvx_port_12),
  .rvx_port_15(rvx_port_15),

  .rvx_port_08(rvx_port_08),
  .rvx_port_10(rvx_port_10),
  .rvx_port_24(rvx_port_24),
  .rvx_port_07(rvx_port_07),
  .rvx_port_09(rvx_port_09),
  .rvx_port_00(rvx_port_00),

  .rvx_port_11(rvx_port_11),
  .rvx_port_25(rvx_port_25),
  .rvx_port_18(rvx_port_18),
  .rvx_port_01(rvx_port_01),
  .rvx_port_02(rvx_port_02),

  .rvx_port_16(rvx_signal_09),
  .rvx_port_04(rvx_signal_07),
  .rvx_port_14(rvx_signal_08),
  .rvx_port_03(rvx_signal_14),
  .rvx_port_22(rvx_signal_17),
  .rvx_port_23(rvx_signal_11),

  .rvx_port_19(rvx_signal_10),
  .rvx_port_05(rvx_signal_21),
  .rvx_port_21(rvx_signal_02),
  .rvx_port_13(rvx_signal_18),
  .rvx_port_17(rvx_signal_04)
);

RVX_MODULE_061
#(
  .RVX_GPARA_0(RVX_GPARA_0),
  .RVX_GPARA_1(RVX_GPARA_2),
  .HAS_LPI_BURDEN(HAS_LPI_BURDEN),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE)
)
i_rvx_instance_1
(
	.rvx_port_20(rvx_port_20),
	.rvx_port_06(rvx_port_06),
  .rvx_port_12(rvx_port_12),
  .rvx_port_15(rvx_port_15),

  .rvx_port_08(rvx_signal_09),
  .rvx_port_10(rvx_signal_07),
  .rvx_port_24(rvx_signal_08),
  .rvx_port_07(rvx_signal_14),
  .rvx_port_09(rvx_signal_17),
  .rvx_port_00(rvx_signal_11),

  .rvx_port_11(rvx_signal_10),
  .rvx_port_25(rvx_signal_21),
  .rvx_port_18(rvx_signal_02),
  .rvx_port_01(rvx_signal_18),
  .rvx_port_02(rvx_signal_04),

  .rvx_port_16(rvx_signal_03),
  .rvx_port_04(rvx_signal_05),
  .rvx_port_14(rvx_signal_01),
  .rvx_port_03(rvx_signal_19),
  .rvx_port_22(rvx_signal_12),
  .rvx_port_23(rvx_signal_15),

  .rvx_port_19(rvx_signal_06),
  .rvx_port_05(rvx_signal_20),
  .rvx_port_21(rvx_signal_00),
  .rvx_port_13(rvx_signal_16),
  .rvx_port_17(rvx_signal_13)
);

RVX_MODULE_000
#(
  .RVX_GPARA_2(RVX_LPARA_03),
  .RVX_GPARA_1(RVX_LPARA_01),
  .RVX_GPARA_3(16),
  .RVX_GPARA_0(0)
)
i_rvx_instance_2
(
	.rvx_port_20(rvx_port_20),
	.rvx_port_06(rvx_port_06),
  .rvx_port_12(rvx_port_12),
  .rvx_port_15(rvx_port_15),

  .rvx_port_08(rvx_signal_03),
  .rvx_port_10(rvx_signal_05),
  .rvx_port_24(rvx_signal_01),
  .rvx_port_07(rvx_signal_19),
  .rvx_port_09(rvx_signal_12),
  .rvx_port_00(rvx_signal_15),

  .rvx_port_11(rvx_signal_06),
  .rvx_port_25(rvx_signal_20),
  .rvx_port_18(rvx_signal_00),
  .rvx_port_01(rvx_signal_16),
  .rvx_port_02(rvx_signal_13),

  .rvx_port_16(rvx_port_16),
  .rvx_port_04(rvx_port_04),
  .rvx_port_14(rvx_port_14),
  .rvx_port_03(rvx_port_03),
  .rvx_port_22(rvx_port_22),
  .rvx_port_23(rvx_port_23),

  .rvx_port_19(rvx_port_19),
  .rvx_port_05(rvx_port_05),
  .rvx_port_21(rvx_port_21),
  .rvx_port_13(rvx_port_13),
  .rvx_port_17(rvx_port_17)
);

endmodule
