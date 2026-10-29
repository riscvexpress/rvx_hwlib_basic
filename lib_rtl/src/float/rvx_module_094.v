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





module RVX_MODULE_094
(
	rvx_port_01,
	rvx_port_00,
	rvx_port_07,

	rvx_port_02,
  rvx_port_04,
  rvx_port_06,

  rvx_port_05,
  rvx_port_08,
  rvx_port_03,
	rvx_port_09
);





`include "rvx_include_03.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_0 = 0;
localparam  RVX_LPARA_0 = 0; 

localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(BW_SIGNIFICAND_EXTENDED);

input wire rvx_port_01;
input wire rvx_port_00;
input wire rvx_port_07;

input wire [BW_FPIR_VALUE-1:0] rvx_port_02;
input wire [BW_FPIR_VALUE-1:0] rvx_port_04;
input wire rvx_port_06;

output wire [BW_FPIR_VALUE-1:0] rvx_port_05;
output wire [BW_FPIR_VALUE-1:0] rvx_port_08;
output wire rvx_port_03;
output wire [BW_FPIR_VALUE-1:0] rvx_port_09;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_53;
wire rvx_signal_67;
wire [BW_EXPONENT-1:0] rvx_signal_58;
wire [BW_SIGNIFICAND-1:0] rvx_signal_50;
wire [BW_GUARD-1:0] rvx_signal_34;
wire [BW_OVERFLOW-1:0] rvx_signal_61;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_12;
wire rvx_signal_59;
wire [BW_EXPONENT-1:0] rvx_signal_10;
wire [BW_SIGNIFICAND-1:0] rvx_signal_20;
wire [BW_GUARD-1:0] rvx_signal_35;
wire [BW_OVERFLOW-1:0] rvx_signal_01;

wire [BW_EXPONENT-1:0] rvx_signal_17;
wire [BW_EXPONENT-1:0] rvx_signal_41;
wire rvx_signal_04;
wire rvx_signal_55;
reg  [`BW_FPIR_TYPE-1:0] rvx_signal_69;

reg  [BW_FPIR_VALUE-1:0] rvx_signal_40;
reg  [BW_FPIR_VALUE-1:0] rvx_signal_22;
reg  rvx_signal_18;
reg  [`BW_FPIR_TYPE-1:0] rvx_signal_25;
reg  [BW_EXPONENT-1:0] rvx_signal_70;
reg  rvx_signal_24;
reg  rvx_signal_32;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_06;
reg  [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_14;

wire [BW_FPIR_VALUE-1:0] rvx_signal_43;
wire [BW_FPIR_VALUE-1:0] rvx_signal_44;
wire rvx_signal_07;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_30;
wire rvx_signal_05;
wire [BW_EXPONENT-1:0] rvx_signal_16;
wire [BW_SIGNIFICAND-1:0] rvx_signal_37;
wire [BW_GUARD-1:0] rvx_signal_60;
wire [BW_OVERFLOW-1:0] rvx_signal_62;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_71;
wire rvx_signal_46;
wire [BW_EXPONENT-1:0] rvx_signal_09;
wire [BW_SIGNIFICAND-1:0] rvx_signal_00;
wire [BW_GUARD-1:0] rvx_signal_49;
wire [BW_OVERFLOW-1:0] rvx_signal_15;

wire [BW_GUARD-1:0] rvx_signal_54;
wire [BW_GUARD-1:0] rvx_signal_45;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_21;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_72;

wire rvx_signal_65;
reg rvx_signal_63;
reg rvx_signal_36;

wire [BW_EXPONENT-1:0] rvx_signal_11;
wire rvx_signal_13;
wire rvx_signal_66;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_42;
wire [RVX_LPARA_1-1:0] rvx_signal_23;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_08;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_57;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_47;
wire rvx_signal_03;
wire [BW_EXPONENT-1:0] rvx_signal_29;
wire [BW_SIGNIFICAND-1:0] rvx_signal_51;
wire [BW_GUARD-1:0] rvx_signal_39;
wire [BW_OVERFLOW-1:0] rvx_signal_02;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_64;
wire rvx_signal_33;
wire [BW_EXPONENT-1:0] rvx_signal_48;
wire [BW_SIGNIFICAND-1:0] rvx_signal_19;
wire [BW_GUARD-1:0] rvx_signal_56;
wire [BW_OVERFLOW-1:0] rvx_signal_38;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_31;
wire rvx_signal_52;
wire [BW_EXPONENT-1:0] rvx_signal_27;
wire [BW_SIGNIFICAND-1:0] rvx_signal_68;
wire [BW_GUARD-1:0] rvx_signal_26;
reg  [BW_OVERFLOW-1:0] rvx_signal_28;

assign {rvx_signal_53, rvx_signal_67, rvx_signal_58, rvx_signal_50, rvx_signal_34, rvx_signal_61} = rvx_port_02;
assign {rvx_signal_12, rvx_signal_59, rvx_signal_10, rvx_signal_20, rvx_signal_35, rvx_signal_01} = rvx_port_04;
assign rvx_port_05 = {rvx_signal_47, rvx_signal_03, rvx_signal_29, rvx_signal_51, rvx_signal_39, rvx_signal_02};
assign rvx_port_08 = {rvx_signal_64, rvx_signal_33, rvx_signal_48, rvx_signal_19, rvx_signal_56, rvx_signal_38};
assign rvx_port_09 = {rvx_signal_31, rvx_signal_52, rvx_signal_27, rvx_signal_68, rvx_signal_26, rvx_signal_28};

always@(*)
begin
	rvx_signal_69 = `FPIR_TYPE_NORMAL;
	if(rvx_signal_53==`FPIR_TYPE_NAN)
    rvx_signal_69 = `FPIR_TYPE_NAN;
	else if(rvx_signal_12==`FPIR_TYPE_NAN)
    rvx_signal_69 = `FPIR_TYPE_NAN;
	else
		case(rvx_signal_53)
			`FPIR_TYPE_MINF:
				case(rvx_signal_12)
					`FPIR_TYPE_MINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_NAN;
            else
              rvx_signal_69 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_MINF;
            else
              rvx_signal_69 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_MZERO:
						rvx_signal_69 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PZERO:
						rvx_signal_69 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_NORMAL:
						rvx_signal_69 = `FPIR_TYPE_MINF;
				endcase
			`FPIR_TYPE_PINF:
				case(rvx_signal_12)
					`FPIR_TYPE_MINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_PINF;
            else
              rvx_signal_69 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_NAN;
            else
              rvx_signal_69 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_69 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_PZERO:
						rvx_signal_69 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_NORMAL:
						rvx_signal_69 = `FPIR_TYPE_PINF;
				endcase
			`FPIR_TYPE_MZERO:
				case(rvx_signal_12)
					`FPIR_TYPE_MINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_PINF;
            else
              rvx_signal_69 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_MINF;
            else
              rvx_signal_69 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_69 = `FPIR_TYPE_MZERO;
					`FPIR_TYPE_PZERO:
						rvx_signal_69 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_PZERO:
				case(rvx_signal_12)
					`FPIR_TYPE_MINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_PINF;
            else
              rvx_signal_69 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_MINF;
            else
              rvx_signal_69 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_69 = `FPIR_TYPE_PZERO;
					`FPIR_TYPE_PZERO:
						rvx_signal_69 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_NORMAL:
				case(rvx_signal_12)
					`FPIR_TYPE_MINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_PINF;
            else
              rvx_signal_69 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_06)
              rvx_signal_69 = `FPIR_TYPE_MINF;
            else
              rvx_signal_69 = `FPIR_TYPE_PINF;
				endcase
		endcase
end

assign rvx_signal_17 = $signed(rvx_signal_58) - $signed(rvx_signal_10);
assign rvx_signal_04 = rvx_signal_17[BW_EXPONENT-1]; 
assign rvx_signal_41 = (rvx_signal_04)? ((~rvx_signal_17)+1'b 1) : rvx_signal_17;
assign rvx_signal_55 = ($unsigned(rvx_signal_41) >= BW_SIGNIFICAND_EXTENDED);
assign rvx_signal_06 = rvx_signal_04? {rvx_signal_50, ((RVX_GPARA_1==0)? {BW_GUARD{1'b0}} : rvx_signal_34)} : {rvx_signal_20, ((RVX_GPARA_1==0)? {BW_GUARD{1'b0}} : rvx_signal_35)};

always@(posedge rvx_port_01, negedge rvx_port_00)
begin
  if(rvx_port_00==0)
  begin
    rvx_signal_40 <= 0;
    rvx_signal_22 <= 0;
    rvx_signal_18 <= 0;
    rvx_signal_25 <= 0;
    rvx_signal_70 <= 0;
    rvx_signal_24 <= 0;
    rvx_signal_32 <= 0;
    rvx_signal_14 <= 0;
  end
  else if(rvx_port_07)
  begin
    rvx_signal_40 <= rvx_port_02;
    rvx_signal_22 <= rvx_port_04;
    rvx_signal_18 <= rvx_port_06;
    rvx_signal_25 <= rvx_signal_69;
    rvx_signal_70 <= rvx_signal_41;
    rvx_signal_24 <= rvx_signal_04;
    rvx_signal_32 <= rvx_signal_55;
    rvx_signal_14 <= rvx_signal_06;
  end
end

assign rvx_signal_43 = RVX_GPARA_0? rvx_signal_40 : rvx_port_02;
assign rvx_signal_44 = RVX_GPARA_0? rvx_signal_22 : rvx_port_04;
assign rvx_signal_07 = RVX_GPARA_0? rvx_signal_18 : rvx_port_06;
assign rvx_signal_57 = RVX_GPARA_0? rvx_signal_25 : rvx_signal_69;
assign rvx_signal_11 = RVX_GPARA_0? rvx_signal_70 : rvx_signal_41;
assign rvx_signal_13 = RVX_GPARA_0? rvx_signal_24 : rvx_signal_04;
assign rvx_signal_66 = RVX_GPARA_0? rvx_signal_32 : rvx_signal_55;

assign {rvx_signal_30, rvx_signal_05, rvx_signal_16, rvx_signal_37, rvx_signal_60, rvx_signal_62} = rvx_signal_43;
assign {rvx_signal_71, rvx_signal_46, rvx_signal_09, rvx_signal_00, rvx_signal_49, rvx_signal_15} = rvx_signal_44;

assign rvx_signal_54 = (RVX_GPARA_1==0)? 0 : rvx_signal_60;
assign rvx_signal_45 = (RVX_GPARA_1==0)? 0 : rvx_signal_49;

assign rvx_signal_21 = {rvx_signal_37, rvx_signal_54};
assign rvx_signal_72 = {rvx_signal_00, rvx_signal_45};

RVX_MODULE_038
#(
  .RVX_GPARA_1(BW_SIGNIFICAND_EXTENDED),
	.RVX_GPARA_0(RVX_LPARA_1)
)
i_rvx_instance_0
(
  .rvx_port_0(rvx_signal_42),
  .rvx_port_2(rvx_signal_23),
  .rvx_port_1(rvx_signal_08)
);

assign rvx_signal_42 = RVX_GPARA_0? rvx_signal_14 : rvx_signal_06;
assign rvx_signal_23 = rvx_signal_11;

assign rvx_signal_47 = rvx_signal_57;
assign rvx_signal_03 = rvx_signal_05;
assign rvx_signal_29 = (rvx_signal_13)? rvx_signal_09 : rvx_signal_16;
assign {rvx_signal_51,rvx_signal_39} = rvx_signal_13? rvx_signal_08 : rvx_signal_21;
assign rvx_signal_02 = 0;

assign rvx_signal_64 = rvx_signal_57;
assign rvx_signal_33 = rvx_signal_46 ^ rvx_signal_07;
assign rvx_signal_48 = rvx_signal_13? rvx_signal_09 : rvx_signal_16;
assign {rvx_signal_19,rvx_signal_56} = rvx_signal_13? rvx_signal_72 : rvx_signal_08;
assign rvx_signal_38 = 0;

assign rvx_signal_65 = (rvx_signal_57!=`FPIR_TYPE_NORMAL);

always@(*)
begin
	rvx_signal_63 = 0;
	if(rvx_signal_57==`FPIR_TYPE_NORMAL)
		case(rvx_signal_71)
			`FPIR_TYPE_MZERO,
			`FPIR_TYPE_PZERO:
				rvx_signal_63 = 1;
			`FPIR_TYPE_NORMAL:
				if(rvx_signal_66 && (~rvx_signal_13))
					rvx_signal_63 = 1;
		endcase
end

always@(*)
begin
	rvx_signal_36 = 0;
	if(rvx_signal_57==`FPIR_TYPE_NORMAL)
		case(rvx_signal_30)
			`FPIR_TYPE_MZERO,
			`FPIR_TYPE_PZERO:
				rvx_signal_36 = 1;
			`FPIR_TYPE_NORMAL:
				if(rvx_signal_66 && rvx_signal_13)
					rvx_signal_36 = 1;
		endcase
end

assign rvx_port_03 = (rvx_signal_65 | rvx_signal_63 | rvx_signal_36);
assign rvx_signal_31 = rvx_signal_57;
assign rvx_signal_52 = rvx_signal_63? rvx_signal_05 : rvx_signal_33;
assign rvx_signal_27 = rvx_signal_63? rvx_signal_16 : rvx_signal_09;
assign rvx_signal_68 = rvx_signal_63? rvx_signal_37 : rvx_signal_00;
assign rvx_signal_26 = rvx_signal_63? rvx_signal_60 : rvx_signal_49;
always@(*)
begin
  rvx_signal_28 = 0;
  if(rvx_signal_63)
  begin
    if(rvx_signal_16[BW_EXPONENT-1])
      rvx_signal_28 = -1;
  end
  else
  begin
    if(rvx_signal_09[BW_EXPONENT-1])
      rvx_signal_28 = -1;
  end
end

endmodule
