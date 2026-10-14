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





module RVX_MODULE_000
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





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = 16;
parameter RVX_GPARA_0 = 16;

input wire rvx_port_20;
input wire rvx_port_06;
input wire rvx_port_12;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_08;
input wire rvx_port_10;
input wire rvx_port_24;
input wire rvx_port_07;
input wire rvx_port_09;
input wire [RVX_GPARA_2-1:0] rvx_port_00;

input wire [2-1:0] rvx_port_11;
output wire rvx_port_25;
output wire rvx_port_18;
output wire rvx_port_01;
output wire [RVX_GPARA_1-1:0] rvx_port_02;

input wire [2-1:0] rvx_port_16;
output wire rvx_port_04;
output wire rvx_port_14;
output wire rvx_port_03;
output wire rvx_port_22;
output wire [RVX_GPARA_2-1:0] rvx_port_23;

output wire [2-1:0] rvx_port_19;
input wire rvx_port_05;
input wire rvx_port_21;
input wire rvx_port_13;
input wire [RVX_GPARA_1-1:0] rvx_port_17;

localparam  RVX_LPARA_0 = 1 + 1 + 1 + RVX_GPARA_2;

wire [2-1:0] rvx_signal_5;
wire rvx_signal_4;
wire [RVX_LPARA_0-1:0] rvx_signal_3;
wire rvx_signal_1;
wire rvx_signal_2;
wire [RVX_LPARA_0-1:0] rvx_signal_0;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_0),
  .DEPTH(RVX_GPARA_3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_0
(
  .clk(rvx_port_20),
  .rstnn(rvx_port_06),
  .enable(rvx_port_15),
  .clear(rvx_port_12),
  .wready(rvx_signal_5),
  .wfull(),
  .wrequest(rvx_signal_4),
  .wdata(rvx_signal_3),
  .wnum(),
  .rready(rvx_signal_1),
  .rempty(),
  .rrequest(rvx_signal_2),
  .rdata(rvx_signal_0),
  .rnum()
);

assign rvx_port_08 = rvx_signal_5;
assign rvx_signal_4 = rvx_port_10;
assign rvx_signal_3 = {rvx_port_24, rvx_port_07, rvx_port_09, rvx_port_00};

assign rvx_port_04 = rvx_signal_1;
assign {rvx_port_14, rvx_port_03, rvx_port_22, rvx_port_23} = rvx_signal_0;
assign rvx_signal_2 = rvx_port_16[0];

assign rvx_port_19 = rvx_port_11;
assign rvx_port_25 = rvx_port_05;
assign rvx_port_18 = rvx_port_21;
assign rvx_port_01 = rvx_port_13;
assign rvx_port_02 = rvx_port_17;

endmodule
