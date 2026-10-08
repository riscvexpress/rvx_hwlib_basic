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
`include "fpir_define.vh"




module RVX_MODULE_119
(
  rvx_port_1,
  rvx_port_0
);




`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

`include "rvx_include_22.vh"

input wire [BW_FPIR_VALUE-1:0] rvx_port_1;
output wire [BW_FPIR_VALUE-1:0] rvx_port_0;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_06;
wire rvx_signal_13;
wire [BW_EXPONENT-1:0] rvx_signal_15;
wire [BW_SIGNIFICAND-1:0] rvx_signal_12;
wire [BW_GUARD-1:0] rvx_signal_03;
wire [BW_OVERFLOW-1:0] rvx_signal_17;

wire [BW_EXPONENT_EXTENDED-1:0] rvx_signal_02;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_20;

localparam  RVX_LPARA_1 = BW_SIGNIFICAND_EXTENDED;
localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(BW_SIGNIFICAND_EXTENDED);

wire [RVX_LPARA_1-1:0] rvx_signal_19;
wire [RVX_LPARA_0-1:0] rvx_signal_09;
wire rvx_signal_01;

wire [RVX_LPARA_0-1:0] rvx_signal_14;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_16;
wire [RVX_LPARA_0-1:0] rvx_signal_18;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_00;

reg  [`BW_FPIR_TYPE-1:0] rvx_signal_10;
wire rvx_signal_05;
wire [BW_EXPONENT-1:0] rvx_signal_04;
wire [BW_SIGNIFICAND-1:0] rvx_signal_08;
wire [BW_GUARD-1:0] rvx_signal_11;
wire [BW_OVERFLOW-1:0] rvx_signal_07;

assign {rvx_signal_06, rvx_signal_13, rvx_signal_15, rvx_signal_12, rvx_signal_03, rvx_signal_17} = rvx_port_1;
assign rvx_port_0 = {rvx_signal_10, rvx_signal_05, rvx_signal_04, rvx_signal_08, rvx_signal_11, rvx_signal_07};

assign rvx_signal_02 = {rvx_signal_17, rvx_signal_15};
assign rvx_signal_20 = {rvx_signal_12,rvx_signal_03};

RVX_MODULE_091
#(
	.RVX_GPARA_1(RVX_LPARA_1),
	.RVX_GPARA_0(RVX_LPARA_0)
)
i_rvx_instance_0
(
	.rvx_port_2(rvx_signal_19),
	.rvx_port_1(rvx_signal_09),
	.rvx_port_0(rvx_signal_01)
);

assign rvx_signal_19 = rvx_signal_20;

assign rvx_signal_14 = rvx_signal_01? 0 : rvx_signal_09;

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(BW_SIGNIFICAND_EXTENDED),
	.BW_SHIFT_AMOUNT(RVX_LPARA_0),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(1),
	.CIRCULAR_SHIFT(0),
	.MSB_FILL_VALUE(0)
)
i_rvx_instance_1
(
	.data_input(rvx_signal_16),
	.shift_amount(rvx_signal_18),
	.data_output(rvx_signal_00)
);

assign rvx_signal_16 = rvx_signal_20;
assign rvx_signal_18 = rvx_signal_14;

always@(*)
begin
  rvx_signal_10 = rvx_signal_06;
  if(rvx_signal_06!=`FPIR_TYPE_NORMAL)
    rvx_signal_10 = rvx_signal_06;
  else if(rvx_signal_01)
    rvx_signal_10 = rvx_signal_13? `FPIR_TYPE_MZERO : `FPIR_TYPE_PZERO;
  else
    rvx_signal_10 = rvx_signal_06;
end

assign rvx_signal_05 = rvx_signal_13;
assign {rvx_signal_07,rvx_signal_04} = $signed(rvx_signal_02) - $unsigned(rvx_signal_14);
assign {rvx_signal_08,rvx_signal_11} = rvx_signal_00;

endmodule
