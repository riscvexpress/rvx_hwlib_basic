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





module RVX_MODULE_033
(
	rvx_port_17,
	rvx_port_23,
  rvx_port_16,
  rvx_port_03,

  rvx_port_14,
  rvx_port_00,
  rvx_port_19,
  rvx_port_06,
  rvx_port_22,
  rvx_port_21,

  rvx_port_25,
  rvx_port_10,
  rvx_port_20,
  rvx_port_02,
  rvx_port_05,

  rvx_port_09,
  rvx_port_08,
  rvx_port_01,
  rvx_port_11,
  rvx_port_07,
  rvx_port_13,

  rvx_port_18,
  rvx_port_04,
  rvx_port_24,
  rvx_port_12,
  rvx_port_15
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = 16;
parameter RVX_GPARA_2 = 16;

input wire rvx_port_17;
input wire rvx_port_23;
input wire rvx_port_16;
input wire rvx_port_03;

output wire [2-1:0] rvx_port_14;
input wire rvx_port_00;
input wire rvx_port_19;
input wire rvx_port_06;
input wire rvx_port_22;
input wire [RVX_GPARA_0-1:0] rvx_port_21;

input wire [2-1:0] rvx_port_25;
output wire rvx_port_10;
output wire rvx_port_20;
output wire rvx_port_02;
output wire [RVX_GPARA_1-1:0] rvx_port_05;

input wire [2-1:0] rvx_port_09;
output wire rvx_port_08;
output wire rvx_port_01;
output wire rvx_port_11;
output wire rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_13;

output wire [2-1:0] rvx_port_18;
input wire rvx_port_04;
input wire rvx_port_24;
input wire rvx_port_12;
input wire [RVX_GPARA_1-1:0] rvx_port_15;

localparam  RVX_LPARA_0 = 1 + 1 + 1 + RVX_GPARA_0;

wire [2-1:0] rvx_signal_1;
wire rvx_signal_3;
wire [RVX_LPARA_0-1:0] rvx_signal_2;
wire rvx_signal_4;
wire rvx_signal_0;
wire [RVX_LPARA_0-1:0] rvx_signal_5;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_0),
  .DEPTH(RVX_GPARA_3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_0
(
  .clk(rvx_port_17),
  .rstnn(rvx_port_23),
  .enable(rvx_port_03),
  .clear(rvx_port_16),
  .wready(rvx_signal_1),
  .wfull(),
  .wrequest(rvx_signal_3),
  .wdata(rvx_signal_2),
  .wnum(),
  .rready(rvx_signal_4),
  .rempty(),
  .rrequest(rvx_signal_0),
  .rdata(rvx_signal_5),
  .rnum()
);

assign rvx_port_14 = rvx_signal_1;
assign rvx_signal_3 = rvx_port_00;
assign rvx_signal_2 = {rvx_port_19, rvx_port_06, rvx_port_22, rvx_port_21};

assign rvx_port_08 = rvx_signal_4;
assign {rvx_port_01, rvx_port_11, rvx_port_07, rvx_port_13} = rvx_signal_5;
assign rvx_signal_0 = rvx_port_09[0];

assign rvx_port_18 = rvx_port_25;
assign rvx_port_10 = rvx_port_04;
assign rvx_port_20 = rvx_port_24;
assign rvx_port_02 = rvx_port_12;
assign rvx_port_05 = rvx_port_15;

endmodule
