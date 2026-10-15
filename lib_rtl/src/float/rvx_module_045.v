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
`include "fpir_define.vh"




module RVX_MODULE_045
(
  rvx_port_0,
  rvx_port_1
);




`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

`include "rvx_include_12.vh"

input wire [BW_FPIR_VALUE-1:0] rvx_port_0;
output wire [BW_FPIR_VALUE-1:0] rvx_port_1;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_14;
wire rvx_signal_11;
wire [BW_EXPONENT-1:0] rvx_signal_05;
wire [BW_SIGNIFICAND-1:0] rvx_signal_13;
wire [BW_GUARD-1:0] rvx_signal_15;
wire [BW_OVERFLOW-1:0] rvx_signal_16;

wire [BW_EXPONENT_EXTENDED-1:0] rvx_signal_20;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_02;

localparam  RVX_LPARA_1 = BW_SIGNIFICAND_EXTENDED;
localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(BW_SIGNIFICAND_EXTENDED);

wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire [RVX_LPARA_0-1:0] rvx_signal_10;
wire rvx_signal_01;

wire [RVX_LPARA_0-1:0] rvx_signal_12;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_00;
wire [RVX_LPARA_0-1:0] rvx_signal_17;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_08;

reg  [`BW_FPIR_TYPE-1:0] rvx_signal_19;
wire rvx_signal_09;
wire [BW_EXPONENT-1:0] rvx_signal_18;
wire [BW_SIGNIFICAND-1:0] rvx_signal_06;
wire [BW_GUARD-1:0] rvx_signal_03;
wire [BW_OVERFLOW-1:0] rvx_signal_04;

assign {rvx_signal_14, rvx_signal_11, rvx_signal_05, rvx_signal_13, rvx_signal_15, rvx_signal_16} = rvx_port_0;
assign rvx_port_1 = {rvx_signal_19, rvx_signal_09, rvx_signal_18, rvx_signal_06, rvx_signal_03, rvx_signal_04};

assign rvx_signal_20 = {rvx_signal_16, rvx_signal_05};
assign rvx_signal_02 = {rvx_signal_13,rvx_signal_15};

RVX_MODULE_069
#(
	.RVX_GPARA_1(RVX_LPARA_1),
	.RVX_GPARA_0(RVX_LPARA_0)
)
i_rvx_instance_1
(
	.value(rvx_signal_07),
	.rvx_port_0(rvx_signal_10),
	.rvx_port_1(rvx_signal_01)
);

assign rvx_signal_07 = rvx_signal_02;

assign rvx_signal_12 = rvx_signal_01? 0 : rvx_signal_10;

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
i_rvx_instance_0
(
	.data_input(rvx_signal_00),
	.shift_amount(rvx_signal_17),
	.data_output(rvx_signal_08)
);

assign rvx_signal_00 = rvx_signal_02;
assign rvx_signal_17 = rvx_signal_12;

always@(*)
begin
  rvx_signal_19 = rvx_signal_14;
  if(rvx_signal_14!=`FPIR_TYPE_NORMAL)
    rvx_signal_19 = rvx_signal_14;
  else if(rvx_signal_01)
    rvx_signal_19 = rvx_signal_11? `FPIR_TYPE_MZERO : `FPIR_TYPE_PZERO;
  else
    rvx_signal_19 = rvx_signal_14;
end

assign rvx_signal_09 = rvx_signal_11;
assign {rvx_signal_04,rvx_signal_18} = $signed(rvx_signal_20) - $unsigned(rvx_signal_12);
assign {rvx_signal_06,rvx_signal_03} = rvx_signal_08;

endmodule
