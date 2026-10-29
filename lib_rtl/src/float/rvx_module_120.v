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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "fpir_define.vh"





module RVX_MODULE_120
(
	rvx_port_4,
	rvx_port_6,
	rvx_port_2,

	rvx_port_5,
	rvx_port_3,
	rvx_port_1,
	rvx_port_0
);





`include "rvx_include_03.vh"
`include "rvx_include_16.vh"
parameter RVX_GPARA_0 = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire rvx_port_4;
input wire rvx_port_6;
input wire rvx_port_2;

input wire rvx_port_5;
input wire [BW_FPIR_VALUE-1:0] rvx_port_3;
output wire rvx_port_1;
output wire [BW_IEEE_VALUE-1:0] rvx_port_0;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_06;
wire rvx_signal_29;
wire [BW_EXPONENT-1:0] rvx_signal_26;
wire [BW_SIGNIFICAND-1:0] rvx_signal_02;
wire [BW_GUARD-1:0] rvx_signal_13;
wire [BW_OVERFLOW-1:0] rvx_signal_50;

localparam  RVX_LPARA_0 = `MAX(BW_IEEE_EXPONENT, BW_EXPONENT_EXTENDED);
localparam  RVX_LPARA_1 = BW_SIGNIFICAND_EXTENDED + BW_IEEE_SIGNIFICAND;

wire [RVX_LPARA_0-1:0] rvx_signal_00;
wire [RVX_LPARA_1-1:0] rvx_signal_31;

wire [RVX_LPARA_1-1:0] rvx_signal_14;
wire [RVX_LPARA_1-1:0] rvx_signal_45;
wire rvx_signal_36;

wire [RVX_LPARA_0-1:0] rvx_signal_42;
reg  [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_15;

localparam  RVX_LPARA_3 = RVX_LPARA_1;
localparam  RVX_LPARA_2 = REQUIRED_BITWIDTH_INDEX(BW_IEEE_MANTISSA+1+BW_SIGNIFICAND_EXTENDED);

wire [RVX_LPARA_3-1:0] rvx_signal_43;
wire [RVX_LPARA_2-1:0] rvx_signal_40;
wire [RVX_LPARA_3-1:0] rvx_signal_38;

reg  [`BW_FPIR_TYPE-1:0] rvx_signal_23;
reg  rvx_signal_25;
reg  [RVX_LPARA_1-1:0] rvx_signal_09;
reg  [RVX_LPARA_0-1:0] rvx_signal_34;
reg  [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_39;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_28;
wire rvx_signal_10;
wire [RVX_LPARA_1-1:0] rvx_signal_32;
wire [RVX_LPARA_0-1:0] rvx_signal_22;
wire [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_21;

wire rvx_signal_20;
wire rvx_signal_08;
wire rvx_signal_03;

reg  [`BW_FPIR_TYPE-1:0] rvx_signal_37;
reg  rvx_signal_49;
reg  [RVX_LPARA_0-1:0] rvx_signal_17;
reg  [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_05;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_46;
reg  rvx_signal_01;
reg  rvx_signal_30;
reg  rvx_signal_16;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_47;
wire rvx_signal_07;
wire [RVX_LPARA_0-1:0] rvx_signal_19;
wire [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_11;
wire [BW_IEEE_MANTISSA-1:0] rvx_signal_04;
wire rvx_signal_33;
wire rvx_signal_24;
wire rvx_signal_48;

wire rvx_signal_27;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_44;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_35;

reg  rvx_signal_18;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_41;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_12;

assign {rvx_signal_06, rvx_signal_29, rvx_signal_26, rvx_signal_02, rvx_signal_13, rvx_signal_50} = rvx_port_3;

assign rvx_signal_00 = $signed({rvx_signal_50,rvx_signal_26});

RVX_MODULE_018
#(
  .RVX_GPARA_0(BW_SIGNIFICAND_EXTENDED),
  .RVX_GPARA_1(RVX_LPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_0({rvx_signal_02,rvx_signal_13}),
	.rvx_port_1(rvx_signal_31)
);

RVX_MODULE_104
#(
  .RVX_GPARA_2(RVX_LPARA_1),
  .RVX_GPARA_0(BW_SIGNIFICAND_EXTENDED),
  .UNSIGNED(1)
)
i_rvx_instance_2
(
	.rvx_port_1(rvx_signal_14),
	.rvx_port_0(rvx_signal_45),
  .rvx_port_2(rvx_signal_36)
);

assign rvx_signal_14 = rvx_signal_31;

assign rvx_signal_42 = $signed(rvx_signal_00) + IEEE_EXPONENT_BIAS  + $unsigned(rvx_signal_36);
always@(*)
begin
  rvx_signal_15 = 0;
  if(rvx_signal_36)
    rvx_signal_15[BW_IEEE_SIGNIFICAND-1] = 1;
  else
    rvx_signal_15 = rvx_signal_45[RVX_LPARA_1-1-:BW_IEEE_SIGNIFICAND];
end

always@(posedge rvx_port_4, negedge rvx_port_6)
begin
  if(rvx_port_6==0)
  begin
    rvx_signal_23 <= 0;
    rvx_signal_25 <= 0;
    rvx_signal_09 <= 0;
    rvx_signal_34 <= 0;
    rvx_signal_39 <= 0;
  end
  else if(rvx_port_2)
  begin
    rvx_signal_23 <= rvx_signal_06;
    rvx_signal_25 <= rvx_signal_29;
    rvx_signal_09 <= rvx_signal_31;
    rvx_signal_34 <= rvx_signal_42;
    rvx_signal_39 <= rvx_signal_15;
  end
end

assign rvx_signal_28 = (RVX_GPARA_0>=1)? rvx_signal_23 : rvx_signal_06;
assign rvx_signal_10 = (RVX_GPARA_0>=1)? rvx_signal_25 : rvx_signal_29;
assign rvx_signal_32 = (RVX_GPARA_0>=1)? rvx_signal_09 : rvx_signal_31;
assign rvx_signal_22 = (RVX_GPARA_0>=1)? rvx_signal_34 : rvx_signal_42;
assign rvx_signal_21 = (RVX_GPARA_0>=1)? rvx_signal_39 : rvx_signal_15;

assign rvx_signal_20 = (rvx_signal_21==0) | ($signed(rvx_signal_22)<(IEEE_EXPONENT_MIN_NORMALIZED-1));
assign rvx_signal_08 = (~rvx_signal_20) & ($signed(rvx_signal_22)<=0);
assign rvx_signal_03 = ($signed(rvx_signal_22)>IEEE_EXPONENT_MAX);

RVX_MODULE_038
#(
  .RVX_GPARA_1(RVX_LPARA_3),
  .RVX_GPARA_0(RVX_LPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_0(rvx_signal_43),
	.rvx_port_2(rvx_signal_40),
	.rvx_port_1(rvx_signal_38)
);

assign rvx_signal_43 = rvx_signal_32;
assign rvx_signal_40 = (~rvx_signal_22) + 1'b 1 + 1'b 1 + BW_SIGNIFICAND_EXTENDED;

always@(posedge rvx_port_4, negedge rvx_port_6)
begin
  if(rvx_port_6==0)
  begin
    rvx_signal_37 <= 0;
    rvx_signal_49 <= 0;
    rvx_signal_17 <= 0;
    rvx_signal_05 <= 0;
    rvx_signal_46 <= 0;
    rvx_signal_01 <= 0;
    rvx_signal_30 <= 0;
    rvx_signal_16 <= 0;
  end
  else if(rvx_port_2)
  begin
    rvx_signal_37 <= rvx_signal_28;
    rvx_signal_49 <= rvx_signal_10;
    rvx_signal_17 <= rvx_signal_22;
    rvx_signal_05 <= rvx_signal_21;
    rvx_signal_46 <= rvx_signal_38;
    rvx_signal_01 <= rvx_signal_20;
    rvx_signal_30 <= rvx_signal_08;
    rvx_signal_16 <= rvx_signal_03;
  end
end

assign rvx_signal_47 = (RVX_GPARA_0>=2)? rvx_signal_37 : rvx_signal_28;
assign rvx_signal_07 = (RVX_GPARA_0>=2)? rvx_signal_49 : rvx_signal_10;
assign rvx_signal_19 = (RVX_GPARA_0>=2)? rvx_signal_17 : rvx_signal_22;
assign rvx_signal_11 = (RVX_GPARA_0>=2)? rvx_signal_05 : rvx_signal_21;
assign rvx_signal_04 = (RVX_GPARA_0>=2)? rvx_signal_46 : rvx_signal_38;
assign rvx_signal_33 = (RVX_GPARA_0>=2)? rvx_signal_01 : rvx_signal_20;
assign rvx_signal_24 = (RVX_GPARA_0>=2)? rvx_signal_30 : rvx_signal_08;
assign rvx_signal_48 = (RVX_GPARA_0>=2)? rvx_signal_16 : rvx_signal_03;

assign rvx_signal_27 = rvx_signal_07;
always@(*)
begin
  rvx_signal_44 = 0;
  rvx_signal_35 = 0;
  if(rvx_signal_33)
  begin
    rvx_signal_44 = 0;
    rvx_signal_35 = 0;
  end
  else if(rvx_signal_24)
  begin
    rvx_signal_44 = 0;
    rvx_signal_35 = rvx_signal_04;
  end
  else if(rvx_signal_48)
  begin
    rvx_signal_44 = IEEE_INF_EXPONENT;
    rvx_signal_35 = IEEE_INF_MANTISSA;
  end
  else
  begin
    rvx_signal_44 = rvx_signal_19;
    rvx_signal_35 = rvx_signal_11;
  end
end

always@(*)
begin
	rvx_signal_18 = 1'b1;
	rvx_signal_41 = IEEE_NAN_EXPONENT;
	rvx_signal_12 = IEEE_NAN_MANTISSA;
	case(rvx_signal_47)
		`FPIR_TYPE_NAN:
		begin
			rvx_signal_18= 1'b1;
			rvx_signal_41 = IEEE_NAN_EXPONENT;
			rvx_signal_12 = IEEE_NAN_MANTISSA;
		end
		`FPIR_TYPE_MINF:
		begin
			rvx_signal_18= 1'b1;
			rvx_signal_41 = IEEE_INF_EXPONENT;
			rvx_signal_12 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_PINF:
		begin
			rvx_signal_18= 1'b 0;
			rvx_signal_41 = IEEE_INF_EXPONENT;
			rvx_signal_12 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_MZERO:
		begin
			rvx_signal_18= 1'b1;
			rvx_signal_41 = 0;
			rvx_signal_12 = 0;
		end
		`FPIR_TYPE_PZERO:
		begin
			rvx_signal_18= 1'b 0;
			rvx_signal_41 = 0;
			rvx_signal_12 = 0;
		end
		default:
		begin
			rvx_signal_18= rvx_signal_27;
			rvx_signal_41 = rvx_signal_44;
			rvx_signal_12 = rvx_signal_35;
		end
	endcase
end

assign rvx_port_1 = rvx_port_5;
assign rvx_port_0 = {rvx_signal_18,rvx_signal_41,rvx_signal_12};

endmodule
