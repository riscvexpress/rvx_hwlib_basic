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





module RVX_MODULE_049
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
  rvx_port_18,
  rvx_port_25,
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





parameter RVX_GPARA_0 = 1;
parameter BW_LPI_BURDEN = 32;
parameter BW_LPI_QPARCEL = 32;
parameter BW_LPI_YPARCEL = 4;
parameter RVX_GPARA_1 = 4;

`include "lpit_function.vb"
`include "lpig_lpara.vb"

localparam  RVX_LPARA_1 = (BW_LPI_BURDEN>0) && (RVX_GPARA_0==1);

input wire rvx_port_20;
input wire rvx_port_06;
input wire rvx_port_12;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_08;
input wire rvx_port_10;
input wire rvx_port_24;
input wire rvx_port_07;
input wire rvx_port_09;
input wire [BW_LPI_QDATA-1:0] rvx_port_00;

input wire [2-1:0] rvx_port_11;
output wire rvx_port_25;
output wire rvx_port_18;
output wire rvx_port_01;
output wire [BW_LPI_YDATA-1:0] rvx_port_02;

input wire [2-1:0] rvx_port_16;
output wire rvx_port_04;
output wire rvx_port_14;
output wire rvx_port_03;
output wire rvx_port_22;
output wire [BW_LPI_QDATA-1:0] rvx_port_23;

output wire [2-1:0] rvx_port_19;
input wire rvx_port_05;
input wire rvx_port_21;
input wire rvx_port_13;
input wire [BW_LPI_YDATA-1:0] rvx_port_17;

localparam  RVX_LPARA_0 = 1 + BW_LPI_YPARCEL;

wire [2-1:0] rvx_signal_02;
wire rvx_signal_14;
wire [RVX_LPARA_0-1:0] rvx_signal_06;
wire rvx_signal_11;
wire rvx_signal_13;
wire [RVX_LPARA_0-1:0] rvx_signal_12;

localparam  RVX_LPARA_2 = BW_LPI_BURDEN_NZ;

wire [2-1:0] rvx_signal_00;
wire rvx_signal_05;
wire [RVX_LPARA_2-1:0] rvx_signal_07;
wire rvx_signal_10;
wire rvx_signal_01;
wire [RVX_LPARA_2-1:0] rvx_signal_08;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_04;
wire [BW_LPI_YPARCEL-1:0] rvx_signal_03;

wire [2-1:0] rvx_signal_09;
wire rvx_signal_15;

assign rvx_port_08 = rvx_signal_09 & rvx_port_16;
assign rvx_port_04 = rvx_signal_09[0] & rvx_port_10;
assign rvx_port_14 = rvx_port_24;
assign rvx_port_03 = rvx_port_07;
assign rvx_port_22 = rvx_port_09;
assign rvx_port_23 = rvx_port_00;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_2),
	.DEPTH(RVX_GPARA_1),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_1
(
	.clk(rvx_port_20),
	.rstnn(rvx_port_06),
	.enable(rvx_port_15 & RVX_LPARA_1),
  .clear(rvx_port_12),
	.wready(rvx_signal_00),
	.wrequest(rvx_signal_05),
	.wdata(rvx_signal_07),
	.wfull(),
  .wnum(),
	.rready(rvx_signal_10),
	.rrequest(rvx_signal_01),
	.rdata(rvx_signal_08),
	.rempty(),
	.rnum()
);

assign rvx_signal_05 = rvx_port_10 & rvx_port_08[0] & rvx_port_07 & rvx_port_09;
assign rvx_signal_07 = rvx_port_00[BW_LPI_QDATA-1-:BW_LPI_BURDEN_NZ];
assign rvx_signal_01 = rvx_port_25 & rvx_port_11[0] & rvx_port_01;

assign rvx_signal_09 = RVX_LPARA_1? rvx_signal_00 : `ALL_ONE;
assign rvx_signal_15 = RVX_LPARA_1? rvx_signal_10 : `ALL_ONE;

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_20),
	.rstnn(rvx_port_06),
	.enable(rvx_port_15),
  .clear(rvx_port_12),
	.wready(rvx_signal_02),
	.wrequest(rvx_signal_14),
	.wdata(rvx_signal_06),
	.wfull(),
	.rready(rvx_signal_11),
	.rrequest(rvx_signal_13),
	.rdata(rvx_signal_12),
	.rempty()
);

assign rvx_signal_14 = rvx_port_05;
assign rvx_signal_06 = {rvx_port_13, rvx_port_17[BW_LPI_YPARCEL-1:0]};
assign rvx_signal_13 = rvx_port_25 & rvx_port_11[0];

assign rvx_port_19 = rvx_signal_02;

assign rvx_port_25 = rvx_signal_15 & rvx_signal_11;
assign rvx_port_18 = 0;
assign rvx_port_02 = {rvx_signal_04,rvx_signal_03};
assign {rvx_port_01,rvx_signal_03} = rvx_signal_12;
assign rvx_signal_04 = rvx_signal_08;

endmodule
