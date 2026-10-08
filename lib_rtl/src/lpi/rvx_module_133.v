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





module RVX_MODULE_133
(
	rvx_port_24,
	rvx_port_11,
  rvx_port_20,
  rvx_port_14,

  rvx_port_12,
  rvx_port_07,
  rvx_port_10,
  rvx_port_08,
  rvx_port_25,
  rvx_port_17,

  rvx_port_15,
  rvx_port_09,
  rvx_port_04,
  rvx_port_22,
  rvx_port_21,

  rvx_port_18,
  rvx_port_16,
  rvx_port_02,
  rvx_port_01,
  rvx_port_19,
  rvx_port_00,

  rvx_port_06,
  rvx_port_03,
  rvx_port_13,
  rvx_port_23,
  rvx_port_05
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = 32;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_1 = 8;

`include "lpi_burden_para.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = RVX_GPARA_0;
localparam  BW_LPIXM_DATA = RVX_GPARA_2;

`include "lpixm_lpara.vb"

input wire rvx_port_24;
input wire rvx_port_11;
input wire rvx_port_20;
input wire rvx_port_14;

output wire [2-1:0] rvx_port_12;
input wire rvx_port_07;
input wire rvx_port_10;
input wire rvx_port_08;
input wire rvx_port_25;
input wire [BW_LPI_QDATA-1:0] rvx_port_17;

input wire [2-1:0] rvx_port_15;
output wire rvx_port_09;
output wire rvx_port_04;
output wire rvx_port_22;
output wire [BW_LPI_YDATA-1:0] rvx_port_21;

input wire [2-1:0] rvx_port_18;
output wire rvx_port_16;
output wire rvx_port_02;
output wire rvx_port_01;
output wire rvx_port_19;
output wire [BW_LPI_QDATA-1:0] rvx_port_00;

output wire [2-1:0] rvx_port_06;
input wire rvx_port_03;
input wire rvx_port_13;
input wire rvx_port_23;
input wire [BW_LPI_YDATA-1:0] rvx_port_05;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_08;
wire [BW_LPI_QPARCEL-1:0] rvx_signal_00;

wire rvx_signal_23;
wire rvx_signal_04;
wire [`BW_AXI_ALEN-1:0] rvx_signal_19;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_11;
wire [`BW_AXI_ABURST-1:0] rvx_signal_10;
wire [`NUM_BYTE(RVX_GPARA_2)-1:0] rvx_signal_07;
wire [RVX_GPARA_2-1:0] rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_02;

localparam  RVX_LPARA_0 = BW_LPI_BURDEN_NZ + 1;

wire [2-1:0] rvx_signal_26;
wire rvx_signal_17;
wire [RVX_LPARA_0-1:0] rvx_signal_24;
wire rvx_signal_18;
wire rvx_signal_25;
wire [RVX_LPARA_0-1:0] rvx_signal_05;

wire rvx_signal_16;
wire rvx_signal_09;
wire rvx_signal_12;
wire rvx_signal_22;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_20;
wire [BW_LPI_YPARCEL-1:0] rvx_signal_06;

wire rvx_signal_13;
wire [`BW_AXI_RESP-1:0] rvx_signal_03;

wire [`BW_AXI_RESP-1:0] rvx_signal_14;
wire [`BW_AXI_RESP-1:0] rvx_signal_21;
wire [RVX_GPARA_2-1:0] rvx_signal_15;

assign {rvx_signal_08,rvx_signal_00} = rvx_port_17;
assign {rvx_signal_23,rvx_signal_04,rvx_signal_19,rvx_signal_11,rvx_signal_10,rvx_signal_07,rvx_signal_01,rvx_signal_02} = rvx_signal_00;

assign rvx_signal_16 = rvx_port_08 & rvx_port_25;
assign rvx_signal_09 = (~rvx_signal_16) | rvx_signal_26[0];

assign rvx_port_12 = rvx_signal_09? (rvx_port_18 & rvx_signal_26) : 0;
assign rvx_port_16 = rvx_signal_09 & rvx_port_07;
assign rvx_port_02 = rvx_port_10;
assign rvx_port_01 = rvx_port_08;
assign rvx_port_19 = rvx_port_25 & (~rvx_signal_04);
assign rvx_port_00 = rvx_port_17;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_GPARA_1),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_11),
	.enable(rvx_port_14),
  .clear(rvx_port_20),
	.wready(rvx_signal_26),
	.wrequest(rvx_signal_17),
	.wdata(rvx_signal_24),
	.wfull(),
  .wnum(),
	.rready(rvx_signal_18),
	.rrequest(rvx_signal_25),
	.rdata(rvx_signal_05),
	.rempty(),
	.rnum()
);

assign rvx_signal_17 = rvx_port_07 & rvx_port_12[0] & rvx_signal_16;
assign rvx_signal_24 = {rvx_signal_08, rvx_signal_04};
assign rvx_signal_25 = rvx_port_09 & rvx_port_15[0] & rvx_port_22;

assign rvx_signal_12 = rvx_signal_18;
assign {rvx_signal_20, rvx_signal_13} = rvx_signal_05;
assign rvx_signal_22 = rvx_signal_13;
assign rvx_signal_14 = `AXI_RESPONSE_OKAY;
assign {rvx_signal_21, rvx_signal_15} = rvx_port_05;

assign rvx_port_09 = rvx_signal_12 & (rvx_signal_22? 1 : rvx_port_03);
assign rvx_port_04 = 0;
assign rvx_port_22 = rvx_signal_22? 1 : rvx_port_23;
assign rvx_port_21 = {rvx_signal_20,rvx_signal_06};

assign rvx_signal_06 = {rvx_port_22, rvx_signal_13, rvx_signal_03, rvx_signal_15};
assign rvx_signal_03 = rvx_signal_22? rvx_signal_14 : rvx_signal_21;

assign rvx_port_06 = rvx_signal_12? (rvx_signal_22? 0 : rvx_port_15) : 0;

endmodule
