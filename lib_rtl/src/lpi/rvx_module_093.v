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




module RVX_MODULE_093
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




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;
parameter MEMORY_OPERATION_TYPE = 3;

`include "burden_para.vb"

`include "lpit_function.vb"
`include "lpimo_function.vb"
`include "lpixm_function.vb"

localparam  RVX_LPARA_05 = HAS_BURDEN? BW_BURDEN : 0;
localparam  RVX_LPARA_06 = BW_LPIMO_QPARCEL(RVX_GPARA_1,RVX_GPARA_0);
localparam  RVX_LPARA_08 = BW_LPIMO_YPARCEL(RVX_GPARA_0);
localparam  RVX_LPARA_11 = BW_LPI_DATA(RVX_LPARA_05,RVX_LPARA_06);
localparam  RVX_LPARA_02 = BW_LPI_DATA(RVX_LPARA_05,RVX_LPARA_08);

localparam  RVX_LPARA_01 = RVX_LPARA_05;
localparam  RVX_LPARA_04 = BW_LPIXM_QPARCEL(RVX_GPARA_1,RVX_GPARA_0);
localparam  RVX_LPARA_09 = BW_LPIXM_YPARCEL(RVX_GPARA_0);
localparam  RVX_LPARA_03 = BW_LPI_DATA(RVX_LPARA_01,RVX_LPARA_04);
localparam  RVX_LPARA_10 = BW_LPI_DATA(RVX_LPARA_01,RVX_LPARA_09);

input wire rvx_port_20;
input wire rvx_port_06;
input wire rvx_port_12;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_08;
input wire rvx_port_10;
input wire rvx_port_24;
input wire rvx_port_07;
input wire rvx_port_09;
input wire [RVX_LPARA_11-1:0] rvx_port_00;

input wire [2-1:0] rvx_port_11;
output wire rvx_port_25;
output wire rvx_port_18;
output wire rvx_port_01;
output wire [RVX_LPARA_02-1:0] rvx_port_02;

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
input wire [RVX_LPARA_10-1:0] rvx_port_17;

localparam  RVX_LPARA_07 = RVX_GPARA_1;
localparam  RVX_LPARA_00 = RVX_GPARA_0;

wire [BW_BURDEN_NZ-1:0] rvx_signal_19;
wire [RVX_LPARA_06-1:0] rvx_signal_08;

wire rvx_signal_06;
wire rvx_signal_07;
wire [`BW_AXI_ALEN-1:0] rvx_signal_04;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_05;
wire [`BW_AXI_ABURST-1:0] rvx_signal_12;
wire [`NUM_BYTE(RVX_LPARA_00)-1:0] rvx_signal_17;
wire [RVX_LPARA_00-1:0] rvx_signal_11;
wire [RVX_LPARA_07-1:0] rvx_signal_15;

wire [BW_BURDEN_NZ-1:0] rvx_signal_16;
wire [RVX_LPARA_04-1:0] rvx_signal_14;

wire [BW_BURDEN_NZ-1:0] rvx_signal_01;
wire [RVX_LPARA_09-1:0] rvx_signal_13;

wire rvx_signal_09;
wire rvx_signal_02;
wire [`BW_AXI_RESP-1:0] rvx_signal_10;
wire [RVX_LPARA_00-1:0] rvx_signal_03;

wire [BW_BURDEN_NZ-1:0] rvx_signal_18;
wire [RVX_LPARA_08-1:0] rvx_signal_00;

assign {rvx_signal_19,rvx_signal_08} = rvx_port_00;
assign {rvx_signal_07,rvx_signal_17,rvx_signal_11,rvx_signal_15} = rvx_signal_08;

assign rvx_signal_06 = 1;
assign rvx_signal_04 = `AXI_LENGTH_01;
assign rvx_signal_05 = `GET_AXI_SIZE(RVX_LPARA_00);
assign rvx_signal_12 = `AXI_BURST_FIXED;

assign rvx_port_08 = rvx_port_16;

assign rvx_port_04 = rvx_port_10;
assign rvx_port_14 = rvx_port_24;
assign rvx_port_03 = 1;
assign rvx_port_22 = rvx_port_09;
assign rvx_port_23 = {rvx_signal_16,rvx_signal_14};

assign rvx_signal_16 = rvx_signal_19;
assign rvx_signal_14 = {rvx_signal_06,rvx_signal_07,rvx_signal_04,rvx_signal_05,rvx_signal_12,rvx_signal_17,rvx_signal_11,rvx_signal_15};

assign rvx_port_19[0] = rvx_signal_02? 1'b 1 : rvx_port_11[0];
assign rvx_port_19[1] = rvx_signal_02? rvx_port_11[0] : rvx_port_11[1];

assign {rvx_signal_01,rvx_signal_13} = rvx_port_17;
assign {rvx_signal_09,rvx_signal_02,rvx_signal_10,rvx_signal_03} = rvx_signal_13;

assign rvx_port_25 = rvx_port_05 & (~rvx_signal_02);
assign rvx_port_18 = rvx_port_21;
assign rvx_port_01 = rvx_port_13;
assign rvx_port_02 = {rvx_signal_18,rvx_signal_00};

assign rvx_signal_18 = rvx_signal_01;
assign rvx_signal_00 = {rvx_signal_09,rvx_signal_02,rvx_signal_10,rvx_signal_03};

endmodule
