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




module RVX_MODULE_013
(
	rvx_port_5,
	rvx_port_1,
	rvx_port_0,

	rvx_port_2,
	rvx_port_3,
	rvx_port_6,
	rvx_port_4
);




`include "rvx_include_12.vh"
`include "rvx_include_11.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire rvx_port_5;
input wire rvx_port_1;
input wire rvx_port_0;

input wire rvx_port_2;
input wire [BW_FPIR_VALUE-1:0] rvx_port_3;
output wire rvx_port_6;
output wire [BW_IEEE_VALUE-1:0] rvx_port_4;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_03;
wire rvx_signal_02;
wire [BW_EXPONENT-1:0] rvx_signal_24;
wire [BW_SIGNIFICAND-1:0] rvx_signal_01;
wire [BW_GUARD-1:0] rvx_signal_23;
wire [BW_OVERFLOW-1:0] rvx_signal_11;

localparam  RVX_LPARA_3 = `MAX(BW_IEEE_EXPONENT, BW_EXPONENT_EXTENDED);
localparam  RVX_LPARA_0 = BW_SIGNIFICAND_EXTENDED + BW_IEEE_SIGNIFICAND;

wire [RVX_LPARA_3-1:0] rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_09;

wire [RVX_LPARA_0-1:0] rvx_signal_10;
wire [RVX_LPARA_0-1:0] rvx_signal_19;
wire rvx_signal_17;

wire [RVX_LPARA_3-1:0] rvx_signal_12;
reg  [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_22;

localparam  RVX_LPARA_1 = RVX_LPARA_0;
localparam  RVX_LPARA_2 = REQUIRED_BITWIDTH_INDEX(BW_IEEE_MANTISSA+1+BW_SIGNIFICAND_EXTENDED);

wire [RVX_LPARA_1-1:0] rvx_signal_13;
wire [RVX_LPARA_2-1:0] rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_08;

wire rvx_signal_14;
wire rvx_signal_16;
wire rvx_signal_00;

wire rvx_signal_20;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_18;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_05;

reg  rvx_signal_04;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_21;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_15;

assign {rvx_signal_03, rvx_signal_02, rvx_signal_24, rvx_signal_01, rvx_signal_23, rvx_signal_11} = rvx_port_3;

assign rvx_signal_06 = $signed({rvx_signal_11,rvx_signal_24});

RVX_MODULE_102
#(
  .RVX_GPARA_0(BW_SIGNIFICAND_EXTENDED),
  .RVX_GPARA_1(RVX_LPARA_0)
)
i_rvx_instance_0
(
	.rvx_port_0({rvx_signal_01,rvx_signal_23}),
	.rvx_port_1(rvx_signal_09)
);

RVX_MODULE_095
#(
  .RVX_GPARA_1(RVX_LPARA_0),
  .RVX_GPARA_0(BW_SIGNIFICAND_EXTENDED),
  .UNSIGNED(1)
)
i_rvx_instance_1
(
	.rvx_port_2(rvx_signal_10),
	.rvx_port_1(rvx_signal_19),
  .rvx_port_0(rvx_signal_17)
);

assign rvx_signal_10 = rvx_signal_09;

assign rvx_signal_12 = $signed(rvx_signal_06) + IEEE_EXPONENT_BIAS  + $unsigned(rvx_signal_17);
always@(*)
begin
  rvx_signal_22 = 0;
  if(rvx_signal_17)
    rvx_signal_22[BW_IEEE_SIGNIFICAND-1] = 1;
  else
    rvx_signal_22 = rvx_signal_19[RVX_LPARA_0-1-:BW_IEEE_SIGNIFICAND];
end

assign rvx_signal_14 = (rvx_signal_22==0) | ($signed(rvx_signal_12)<(IEEE_EXPONENT_MIN_NORMALIZED-1));
assign rvx_signal_16 = (~rvx_signal_14) & ($signed(rvx_signal_12)<=0);
assign rvx_signal_00 = ($signed(rvx_signal_12)>IEEE_EXPONENT_MAX);

RVX_MODULE_030
#(
  .RVX_GPARA_3(RVX_LPARA_1),
  .RVX_GPARA_2(RVX_LPARA_2)
)
i_rvx_instance_2
(
	.rvx_port_0(rvx_signal_13),
	.rvx_port_2(rvx_signal_07),
	.rvx_port_1(rvx_signal_08)
);

assign rvx_signal_13 = rvx_signal_09;
assign rvx_signal_07 = (~rvx_signal_12) + 1'b 1 + 1'b 1 + BW_SIGNIFICAND_EXTENDED;

assign rvx_signal_20 = rvx_signal_02;
always@(*)
begin
  rvx_signal_18 = 0;
  rvx_signal_05 = 0;
  if(rvx_signal_14)
  begin
    rvx_signal_18 = 0;
    rvx_signal_05 = 0;
  end
  else if(rvx_signal_16)
  begin
    rvx_signal_18 = 0;
    rvx_signal_05 = rvx_signal_08;
  end
  else if(rvx_signal_00)
  begin
    rvx_signal_18 = IEEE_INF_EXPONENT;
    rvx_signal_05 = IEEE_INF_MANTISSA;
  end
  else
  begin
    rvx_signal_18 = rvx_signal_12;
    rvx_signal_05 = rvx_signal_22;
  end
end

always@(*)
begin
	rvx_signal_04 = 1'b1;
	rvx_signal_21 = IEEE_NAN_EXPONENT;
	rvx_signal_15 = IEEE_NAN_MANTISSA;
	case(rvx_signal_03)
		`FPIR_TYPE_NAN:
		begin
			rvx_signal_04= 1'b1;
			rvx_signal_21 = IEEE_NAN_EXPONENT;
			rvx_signal_15 = IEEE_NAN_MANTISSA;
		end
		`FPIR_TYPE_MINF:
		begin
			rvx_signal_04= 1'b1;
			rvx_signal_21 = IEEE_INF_EXPONENT;
			rvx_signal_15 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_PINF:
		begin
			rvx_signal_04= 1'b 0;
			rvx_signal_21 = IEEE_INF_EXPONENT;
			rvx_signal_15 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_MZERO:
		begin
			rvx_signal_04= 1'b1;
			rvx_signal_21 = 0;
			rvx_signal_15 = 0;
		end
		`FPIR_TYPE_PZERO:
		begin
			rvx_signal_04= 1'b 0;
			rvx_signal_21 = 0;
			rvx_signal_15 = 0;
		end
		default:
		begin
			rvx_signal_04= rvx_signal_20;
			rvx_signal_21 = rvx_signal_18;
			rvx_signal_15 = rvx_signal_05;
		end
	endcase
end

assign rvx_port_6 = rvx_port_2;
assign rvx_port_4 = {rvx_signal_04,rvx_signal_21,rvx_signal_15};

endmodule
