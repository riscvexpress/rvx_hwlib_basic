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
// 2026-10-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_050
(
	rvx_port_22,
	rvx_port_36,
  rvx_port_08,
  rvx_port_41,

  rvx_port_04,
	rvx_port_15,
	rvx_port_16,
	rvx_port_19,
	rvx_port_00,
	rvx_port_01,
	rvx_port_07,

	rvx_port_38,
	rvx_port_20,
	rvx_port_30,
	rvx_port_31,
	rvx_port_26,
	rvx_port_03,

	rvx_port_35,
  rvx_port_29,
  rvx_port_27,
  rvx_port_02,
  rvx_port_40,
  rvx_port_21,
  rvx_port_06,

  rvx_port_39,
  rvx_port_32,
  rvx_port_10,
  rvx_port_14,
  rvx_port_17,
  rvx_port_43,

  rvx_port_13,
  rvx_port_37,
  rvx_port_24,
  rvx_port_25,

  rvx_port_23,
	rvx_port_34,
	rvx_port_42,
	rvx_port_18,
	rvx_port_05,
	rvx_port_33,
	rvx_port_12,
	rvx_port_09,
	rvx_port_28,
  rvx_port_11
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_6 = 32;
parameter RVX_GPARA_3 = 4;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_5 = 0;

parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_2 = RVX_GPARA_6;
parameter RVX_GPARA_0 = 1;

localparam  RVX_LPARA_0 = RVX_GPARA_1;
localparam  RVX_LPARA_2 = RVX_GPARA_6;
localparam  RVX_LPARA_1 = `NUM_BYTE(RVX_GPARA_2);

input wire rvx_port_22;
input wire rvx_port_36;
input wire rvx_port_08;
input wire rvx_port_41;

input wire [RVX_GPARA_3-1:0] rvx_port_04;
input wire [RVX_LPARA_0-1:0] rvx_port_15;
input wire [`BW_AXI_ALEN-1:0] rvx_port_16;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_19;
input wire [`BW_AXI_ABURST-1:0] rvx_port_00;
input wire rvx_port_01;
output wire rvx_port_07;

output wire [RVX_GPARA_3-1:0] rvx_port_38;
output wire [RVX_LPARA_2-1:0] rvx_port_20;
output wire [`BW_AXI_RRESP-1:0] rvx_port_30;
output wire rvx_port_31;
output wire rvx_port_26;
input wire rvx_port_03;

input wire [RVX_GPARA_3-1:0] rvx_port_35;
input wire [RVX_LPARA_0-1:0] rvx_port_29;
input wire [`BW_AXI_ALEN-1:0] rvx_port_27;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_02;
input wire [`BW_AXI_ABURST-1:0] rvx_port_40;
input wire rvx_port_21;
output wire rvx_port_06;

input wire [RVX_GPARA_3-1:0] rvx_port_39;
input wire [RVX_LPARA_2-1:0] rvx_port_32;
input wire [`BW_AXI_WSTRB(RVX_LPARA_2)-1:0] rvx_port_10;
input wire rvx_port_14;
input wire rvx_port_17;
output wire rvx_port_43;

output wire [RVX_GPARA_3-1:0] rvx_port_13;
output wire [`BW_AXI_BRESP-1:0] rvx_port_37;
output wire rvx_port_24;
input wire rvx_port_25;

output wire [RVX_GPARA_0-1:0] rvx_port_23;
output wire [RVX_GPARA_4*RVX_GPARA_0-1:0] rvx_port_34;
output wire [RVX_GPARA_0-1:0] rvx_port_42;
output wire [RVX_GPARA_0-1:0] rvx_port_18;
output wire [RVX_LPARA_1*RVX_GPARA_0-1:0] rvx_port_05;
output wire [RVX_GPARA_2*RVX_GPARA_0-1:0] rvx_port_33;
output wire [RVX_GPARA_2*RVX_GPARA_0-1:0] rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_09;
input wire [RVX_GPARA_2*RVX_GPARA_0-1:0] rvx_port_28;
input wire [RVX_GPARA_0-1:0] rvx_port_11;

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = RVX_LPARA_0;
localparam  BW_LPIXM_DATA = RVX_LPARA_2;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXM_BURDEN(RVX_GPARA_3);

`include "lpixm_lpara.vb"

wire [2-1:0] rvx_signal_03;
wire rvx_signal_09;
wire rvx_signal_10;
wire rvx_signal_00;
wire rvx_signal_04;
wire [BW_LPI_QDATA-1:0] rvx_signal_01;

wire [2-1:0] rvx_signal_07;
wire rvx_signal_02;
wire rvx_signal_06;
wire rvx_signal_08;
wire [BW_LPI_YDATA-1:0] rvx_signal_05;

RVX_MODULE_114
#(
  .RVX_GPARA_1(RVX_LPARA_0),
  .RVX_GPARA_2(RVX_LPARA_2),
  .RVX_GPARA_0(RVX_GPARA_3)
)
i_rvx_instance_1
(
	.rvx_port_13(rvx_port_22),
	.rvx_port_11(rvx_port_36),
  .rvx_port_34(rvx_port_08),
  .rvx_port_37(rvx_port_41),

  .rvx_port_17(rvx_port_04),
	.rvx_port_44(rvx_port_15),
	.rvx_port_09(rvx_port_16),
	.rvx_port_12(rvx_port_19),
	.rvx_port_38(rvx_port_00),
	.rvx_port_40(rvx_port_01),
	.rvx_port_27(rvx_port_07),

	.rvx_port_22(rvx_port_38),
	.rvx_port_26(rvx_port_20),
	.rvx_port_21(rvx_port_30),
	.rvx_port_30(rvx_port_31),
	.rvx_port_01(rvx_port_26),
	.rvx_port_32(rvx_port_03),

	.rvx_port_06(rvx_port_35),
  .rvx_port_02(rvx_port_29),
  .rvx_port_08(rvx_port_27),
  .rvx_port_39(rvx_port_02),
  .rvx_port_33(rvx_port_40),
  .rvx_port_28(rvx_port_21),
  .rvx_port_03(rvx_port_06),

  .rvx_port_25(rvx_port_39),
  .rvx_port_41(rvx_port_32),
  .rvx_port_35(rvx_port_10),
  .rvx_port_24(rvx_port_14),
  .rvx_port_19(rvx_port_17),
  .rvx_port_18(rvx_port_43),

  .rvx_port_00(rvx_port_13),
  .rvx_port_20(rvx_port_37),
  .rvx_port_05(rvx_port_24),
  .rvx_port_31(rvx_port_25),

  .rvx_port_23(rvx_signal_03),
  .rvx_port_43(rvx_signal_09),
  .rvx_port_42(rvx_signal_10),
  .rvx_port_29(rvx_signal_00),
  .rvx_port_15(rvx_signal_04),
  .rvx_port_14(rvx_signal_01),

  .rvx_port_07(rvx_signal_07),
  .rvx_port_10(rvx_signal_02),
  .rvx_port_36(rvx_signal_06),
  .rvx_port_04(rvx_signal_08),
  .rvx_port_16(rvx_signal_05)
);

MUNOC_LPIXM2SCELL
#(
  .BW_ADDR(RVX_GPARA_1),
  .BW_DATA(RVX_GPARA_6),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .BASEADDR(RVX_GPARA_5),
  .BW_CELL_INDEX(RVX_GPARA_4),
  .CELL_WIDTH(RVX_GPARA_2),
  .NUM_CELL(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_36),
  .clear(rvx_port_08),
  .enable(rvx_port_41),

  .rlqdready(rvx_signal_03),
  .rlqvalid(rvx_signal_09),
  .rlqhint(rvx_signal_10),
  .rlqlast(rvx_signal_00),
  .rlqafy(rvx_signal_04),
  .rlqdata(rvx_signal_01),

  .rlydready(rvx_signal_07),
  .rlyvalid(rvx_signal_02),
  .rlyhint(rvx_signal_06),
  .rlylast(rvx_signal_08),
  .rlydata(rvx_signal_05),

  .sscell_select_list(rvx_port_23),
	.sscell_index_list(rvx_port_34),
	.sscell_enable_list(rvx_port_42),
	.sscell_wenable_list(rvx_port_18),
	.sscell_wenable_byte_list(rvx_port_05),
	.sscell_wenable_bit_list(rvx_port_33),
	.sscell_wdata_list(rvx_port_12),
	.sscell_renable_list(rvx_port_09),
	.sscell_rdata_list(rvx_port_28),
  .sscell_stall_list(rvx_port_11)
);

endmodule
