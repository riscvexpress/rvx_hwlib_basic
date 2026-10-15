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
`include "ervp_endian.vh"
`include "rvx_include_08.vh"
`include "fpir_define.vh"



module ERVP_FLORIAN
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr
);



`include "rvx_include_13.vh"
`include "rvx_include_05.vh"

parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter SUPPORT_DOUBLE = 0;
parameter INCLUDE_DIVIDER = 1;

input wire clk, rstnn;
input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

localparam  RVX_LPARA_09 = (SUPPORT_DOUBLE? BW_IEEEDP_EXPONENT : BW_IEEESP_EXPONENT) + 1;
localparam  RVX_LPARA_08 = (SUPPORT_DOUBLE? BW_IEEEDP_SIGNIFICAND : BW_IEEESP_SIGNIFICAND);
localparam  RVX_LPARA_10 = `MAX((48-RVX_LPARA_08),3);
localparam  RVX_LPARA_03 = 2;

localparam  RVX_LPARA_05 = `BW_FPIR_TYPE + 1 + RVX_LPARA_09 + RVX_LPARA_08 + RVX_LPARA_10 + RVX_LPARA_03;

localparam  RVX_LPARA_12 = RVX_LPARA_08 + RVX_LPARA_10;
localparam  RVX_LPARA_06 = RVX_LPARA_09 + RVX_LPARA_03;

wire rvx_signal_075;
wire rvx_signal_015;
wire rvx_signal_038;
wire [BW_DATA-1:0] rvx_signal_056;
wire rvx_signal_012;
wire rvx_signal_103;
wire [BW_DATA-1:0] rvx_signal_024;
reg  rvx_signal_021;
wire [32-1:0] rvx_signal_034;
wire rvx_signal_026;

wire rvx_signal_005;
wire rvx_signal_004;
wire rvx_signal_059;
wire [BW_DATA-1:0] rvx_signal_039;
wire rvx_signal_057;
wire rvx_signal_083;
wire [BW_DATA-1:0] rvx_signal_052;
reg  rvx_signal_093;
reg  [32-1:0] rvx_signal_049;
wire rvx_signal_001;

reg [`RVX_GDEF_208-1:0] rvx_signal_097;
reg [`RVX_GDEF_062-1:0] rvx_signal_019;
reg [`RVX_GDEF_444-1:0] rvx_signal_069;
reg [`RVX_GDEF_444-1:0] rvx_signal_045;
wire rvx_signal_107;
wire rvx_signal_110;
wire rvx_signal_048;
wire rvx_signal_092;
reg  rvx_signal_060;
wire rvx_signal_054;
wire rvx_signal_096;

localparam  RVX_LPARA_07 = 4;

wire rvx_signal_072;
wire rvx_signal_008;
wire [RVX_LPARA_07-1:0] rvx_signal_091;
reg [RVX_LPARA_07-1:0] rvx_signal_010;
reg [RVX_LPARA_07-1:0] rvx_signal_085;

reg [32-1:0] rvx_signal_109;
reg rvx_signal_104;
reg [32-1:0] rvx_signal_108;
reg rvx_signal_044;
reg rvx_signal_068;
wire rvx_signal_007;

localparam  RVX_LPARA_02 = 32;

wire rvx_signal_098;
wire [RVX_LPARA_02-1:0] rvx_signal_082;

wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_066;
wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_051;

wire [RVX_LPARA_05-1:0] rvx_signal_099;
wire [RVX_LPARA_05-1:0] rvx_signal_112;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_050;
wire rvx_signal_040;
wire [RVX_LPARA_09-1:0] rvx_signal_074;
wire [RVX_LPARA_08-1:0] rvx_signal_006;
wire [RVX_LPARA_10-1:0] rvx_signal_081;
wire [RVX_LPARA_03-1:0] rvx_signal_009;

wire [24-1:0] rvx_signal_042;

reg [RVX_LPARA_05-1:0] rvx_signal_018;
reg rvx_signal_053;

reg [RVX_LPARA_05-1:0] rvx_signal_020;
reg rvx_signal_067;

localparam  RVX_LPARA_11 = RVX_LPARA_12 + 1;

reg [RVX_LPARA_11-1:0] rvx_signal_071;
reg [RVX_LPARA_11-1:0] rvx_signal_029;
reg rvx_signal_037;
wire [RVX_LPARA_11-1:0] rvx_signal_013;

wire [RVX_LPARA_05-1:0] rvx_signal_035;
wire [RVX_LPARA_05-1:0] rvx_signal_030;
wire rvx_signal_073;
wire [RVX_LPARA_05-1:0] rvx_signal_023;
wire [RVX_LPARA_05-1:0] rvx_signal_041;
wire rvx_signal_105;
wire [RVX_LPARA_05-1:0] rvx_signal_033;
wire [RVX_LPARA_11-1:0] rvx_signal_002;
wire [RVX_LPARA_11-1:0] rvx_signal_114;
wire rvx_signal_046;
wire [RVX_LPARA_11-1:0] rvx_signal_115;
wire [RVX_LPARA_05-1:0] rvx_signal_032;
wire rvx_signal_027;

localparam  RVX_LPARA_01 = RVX_LPARA_08;
localparam  RVX_LPARA_04 = RVX_LPARA_08;
localparam  RVX_LPARA_13 = 2*RVX_LPARA_08;

wire [RVX_LPARA_05-1:0] rvx_signal_014;
wire [RVX_LPARA_05-1:0] rvx_signal_028;
wire rvx_signal_022;
wire [RVX_LPARA_01-1:0] rvx_signal_084;
wire [RVX_LPARA_01-1:0] rvx_signal_058;
wire [2*RVX_LPARA_01-1:0] rvx_signal_000;
wire [RVX_LPARA_04-1:0] rvx_signal_080;
wire [RVX_LPARA_04-1:0] rvx_signal_062;
wire [RVX_LPARA_13-1:0] rvx_signal_090;
wire [RVX_LPARA_11-1:0] rvx_signal_055;
wire [RVX_LPARA_11-1:0] rvx_signal_070;
wire rvx_signal_088;
wire [RVX_LPARA_11-1:0] rvx_signal_087;
wire [RVX_LPARA_05-1:0] rvx_signal_011;

wire rvx_signal_076;
wire rvx_signal_064;
wire [RVX_LPARA_08-1:0] rvx_signal_089;
wire [RVX_LPARA_08-1:0] rvx_signal_043;
wire rvx_signal_025;
wire rvx_signal_016;
wire [RVX_LPARA_13-1:0] rvx_signal_061;

wire [RVX_LPARA_05-1:0] rvx_signal_102;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_113;
wire rvx_signal_086;
wire [RVX_LPARA_09-1:0] rvx_signal_063;
wire [RVX_LPARA_08-1:0] rvx_signal_047;
wire [RVX_LPARA_10-1:0] rvx_signal_077;
wire [RVX_LPARA_03-1:0] rvx_signal_036;

wire [RVX_LPARA_05-1:0] rvx_signal_017;
wire [RVX_LPARA_05-1:0] rvx_signal_101;

wire [RVX_LPARA_05-1:0] rvx_signal_094;
wire [RVX_LPARA_05-1:0] rvx_signal_106;

reg [RVX_LPARA_05-1:0] rvx_signal_095;
reg [RVX_LPARA_05-1:0] rvx_signal_065;
reg [RVX_LPARA_05-1:0] rvx_signal_031;
wire [BW_IEEESP_VALUE-1:0] rvx_signal_078;
wire [BW_IEEEDP_VALUE-1:0] rvx_signal_003;

localparam  RVX_LPARA_00 = RVX_LPARA_07;

reg [RVX_LPARA_00*BW_DATA-1:0] rvx_signal_079;

wire [32-1:0] rvx_signal_111;
reg  [32-1:0] rvx_signal_100;

RVX_MODULE_072
#(
  .RVX_GPARA_2(BW_ADDR),
  .RVX_GPARA_0(BW_DATA),
  .RVX_GPARA_1(ENDIAN_TYPE)
)
i_rvx_instance_09
(
	.rvx_port_17(clk),
	.rvx_port_22(rstnn),

	.rvx_port_21(rpsel),
	.rvx_port_12(rpenable),
	.rvx_port_16(rpaddr),
	.rvx_port_04(rpwrite),
	.rvx_port_13(rpwdata),
	.rvx_port_25(rprdata),
	.rvx_port_28(rpready),
	.rvx_port_18(rpslverr),

	.rvx_port_11(1'b 0),
  .rvx_port_06(rvx_signal_075),
	.rvx_port_08(rvx_signal_012),
	.rvx_port_27(rvx_signal_103),
	.rvx_port_01(rvx_signal_024),
	.rvx_port_05(rvx_signal_021),
	.rvx_port_29(rvx_signal_034),
	.rvx_port_15(rvx_signal_015),
	.rvx_port_19(rvx_signal_038),
	.rvx_port_20(rvx_signal_056),
	.rvx_port_00(rvx_signal_026),
	.rvx_port_23(rvx_signal_005),
	.rvx_port_02(rvx_signal_004),
	.rvx_port_03(rvx_signal_059),
	.rvx_port_26(rvx_signal_039),
	.rvx_port_30(rvx_signal_057),
	.rvx_port_24(rvx_signal_083),
	.rvx_port_14(rvx_signal_052),
	.rvx_port_09(rvx_signal_093),
	.rvx_port_07(rvx_signal_049),
	.rvx_port_10(rvx_signal_001)
);

assign rvx_signal_075 = 0;
assign rvx_signal_026 = ~rvx_signal_038;
assign rvx_signal_005 = 0;
assign rvx_signal_001 = ~rvx_signal_059;

always@(*)
begin
  rvx_signal_021 = 0;
  case(rvx_signal_097)
    `RVX_GDEF_298:
      rvx_signal_021 = 1;
    `RVX_GDEF_129:
      rvx_signal_021 = 1;
  endcase
end

always@(*)
begin
  rvx_signal_093 = 0;
  case(rvx_signal_097)
    `RVX_GDEF_129:
      case(rvx_signal_019)
        `RVX_GDEF_413:
          rvx_signal_093 = rvx_signal_053 | rvx_signal_067;
        `RVX_GDEF_107:
          if(INCLUDE_DIVIDER==0)
            rvx_signal_093 = rvx_signal_053 | rvx_signal_067;
      endcase
    `RVX_GDEF_567:
      rvx_signal_093 = 1;
  endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_00)
)
i_rvx_instance_00
(
	.data_input_list(rvx_signal_079),
	.select(rvx_signal_091[RVX_LPARA_00-1:0]),
	.data_output(rvx_signal_111)
);

always@(*)
begin
  rvx_signal_100 = $unsigned(rvx_signal_042);
  case(rvx_signal_019)
    `RVX_GDEF_413,
    `RVX_GDEF_107:
      rvx_signal_100 = $unsigned(rvx_signal_042);
  endcase
end

always@(*)
begin
  rvx_signal_049 = rvx_signal_111;
  case(rvx_signal_097)
    `RVX_GDEF_129:
      rvx_signal_049 = rvx_signal_100;
    `RVX_GDEF_567:
      rvx_signal_049 = rvx_signal_111;
  endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_097 <= `RVX_GDEF_298;
  else
    case(rvx_signal_097)
      `RVX_GDEF_298:
        if(rvx_signal_110)
          rvx_signal_097 <= `RVX_GDEF_129;
      `RVX_GDEF_129:
        if(rvx_signal_092)
          rvx_signal_097 <= `RVX_GDEF_591;
      `RVX_GDEF_591:
        if(rvx_signal_060)
          rvx_signal_097 <= `RVX_GDEF_137;
      `RVX_GDEF_137:
        rvx_signal_097 <= `RVX_GDEF_584;
      `RVX_GDEF_584:
        rvx_signal_097 <= `RVX_GDEF_567;
      `RVX_GDEF_567:
        if(rvx_signal_096)
          rvx_signal_097 <= `RVX_GDEF_298;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  {rvx_signal_019,rvx_signal_069,rvx_signal_045} <= 0;
  else if(rvx_signal_110)
    {rvx_signal_019,rvx_signal_069,rvx_signal_045} <= rvx_signal_034;
end

assign rvx_signal_107 = rvx_signal_012 & rvx_signal_021;
assign rvx_signal_110 = (rvx_signal_097==`RVX_GDEF_298) & rvx_signal_107;
assign rvx_signal_048 = (rvx_signal_097==`RVX_GDEF_129) & rvx_signal_107;

always@(*)
begin
  rvx_signal_060 = 0;
  case(rvx_signal_097)
    `RVX_GDEF_591:
      if(rvx_signal_019==`RVX_GDEF_107)
      begin
        if(INCLUDE_DIVIDER)
          rvx_signal_060 = rvx_signal_025;
        else
          rvx_signal_060 = 1;
      end
      else
        rvx_signal_060 = 1;
  endcase
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_07)
)
i_rvx_instance_12
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(1'b 1),
	.init(rvx_signal_072),
  .count(rvx_signal_008),
	.value(rvx_signal_091),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_072 = rvx_signal_092 | rvx_signal_096;
assign rvx_signal_008 = rvx_signal_048 | rvx_signal_054;

always@(*)
begin
  rvx_signal_010 = ((1'b 1) << 0);
  case(rvx_signal_019)
    `RVX_GDEF_380:
      rvx_signal_010 = ((1'b 1) << 0);
    `RVX_GDEF_476,
    `RVX_GDEF_392:
      rvx_signal_010 = ((1'b 1) << 1);
    `RVX_GDEF_413:
      rvx_signal_010 = ((1'b 1) << 3);
    `RVX_GDEF_107:
      if(INCLUDE_DIVIDER)
        rvx_signal_010 = ((1'b 1) << 1);
      else
        rvx_signal_010 = ((1'b 1) << 3);
  endcase
end

assign rvx_signal_054 = (rvx_signal_097==`RVX_GDEF_567) & rvx_signal_093;
assign rvx_signal_092 = rvx_signal_048 & (rvx_signal_091==rvx_signal_010);

always@(*)
begin
  rvx_signal_085 = ((1'b 1) << 0);
  case(rvx_signal_045)
    `RVX_GDEF_362:
      rvx_signal_085 = ((1'b 1) << 1);
  endcase
end

assign rvx_signal_096 = rvx_signal_054 & (rvx_signal_091==rvx_signal_085);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_109 <= 0;
  else if(rvx_signal_104)
    rvx_signal_109 <= rvx_signal_034;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_108 <= 0;
  else if(rvx_signal_044)
    rvx_signal_108 <= rvx_signal_034;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_068 <= 0;
  else if(rvx_signal_007)
    case(rvx_signal_069)
      `RVX_GDEF_177:
        rvx_signal_068 <= rvx_signal_034[32-1];
      default:
        rvx_signal_068 <= 0;
    endcase
end
assign rvx_signal_007 = rvx_signal_104 | rvx_signal_044;

assign rvx_signal_098 = rvx_signal_068;
assign rvx_signal_082 = rvx_signal_098? ((~rvx_signal_109)+1'b 1) : rvx_signal_109;
assign rvx_signal_066 = {rvx_signal_108,rvx_signal_109};
assign rvx_signal_051 = {rvx_signal_108,rvx_signal_109};

RVX_MODULE_124
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_08
(
	.rvx_port_6(clk),
	.rvx_port_1(rstnn),
	.rvx_port_2(1'b 1),

	.rvx_port_3(rvx_signal_012 & (rvx_signal_097==`RVX_GDEF_129)),
	.rvx_port_4(rvx_signal_034),
  .rvx_port_0(),
	.rvx_port_5(rvx_signal_099)	
);

assign rvx_signal_112 = rvx_signal_101;

assign {rvx_signal_050, rvx_signal_040, rvx_signal_074, rvx_signal_006, rvx_signal_081, rvx_signal_009} = rvx_signal_112;

RVX_MODULE_102
#(
  .RVX_GPARA_0(RVX_LPARA_12),
  .RVX_GPARA_1(24)
)
i_rvx_instance_10
(
	.rvx_port_0({rvx_signal_006,rvx_signal_081}),
	.rvx_port_1(rvx_signal_042)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_018 <= 0;
  else if(rvx_signal_053)
    rvx_signal_018 <= rvx_signal_112;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_020 <= 0;
  else if(rvx_signal_067)
    rvx_signal_020 <= rvx_signal_112;
end

always@(*)
begin
  rvx_signal_104 = 0;
  rvx_signal_044 = 0;
  rvx_signal_053 = 0;
  rvx_signal_067 = 0;
  if(rvx_signal_048)
    case(rvx_signal_019)
      `RVX_GDEF_380:
      begin
        rvx_signal_104 = rvx_signal_091[0];
        rvx_signal_044 = rvx_signal_091[1];
      end
      `RVX_GDEF_476,
      `RVX_GDEF_392:
      begin
        rvx_signal_053 = rvx_signal_091[0];
        rvx_signal_067 = rvx_signal_091[1];
      end
      `RVX_GDEF_413,
      `RVX_GDEF_107:
      begin
        rvx_signal_053 = rvx_signal_091[0];
        rvx_signal_067 = rvx_signal_091[1];
        rvx_signal_104 = rvx_signal_091[2];
        rvx_signal_044 = rvx_signal_091[3];
      end
    endcase
end

always@(*)
begin
  rvx_signal_071 = rvx_signal_002;
  rvx_signal_029 = rvx_signal_114;
  rvx_signal_037 = rvx_signal_046;
   case(rvx_signal_019)
      `RVX_GDEF_476,
      `RVX_GDEF_392:
      begin
        rvx_signal_071 = rvx_signal_002;
        rvx_signal_029 = rvx_signal_114;
        rvx_signal_037 = rvx_signal_046;
      end
      `RVX_GDEF_413,
      `RVX_GDEF_107:
      begin
        rvx_signal_071 = rvx_signal_055;
        rvx_signal_029 = rvx_signal_070;
        rvx_signal_037 = rvx_signal_088;
      end
   endcase
end

assign rvx_signal_013 = rvx_signal_071 + rvx_signal_029 + rvx_signal_037;

RVX_MODULE_117
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03)
)
i_rvx_instance_06
(
	.rvx_port_5(rvx_signal_035),
  .rvx_port_6(rvx_signal_030),
  .rvx_port_2(rvx_signal_073),

  .rvx_port_4(rvx_signal_023),
  .rvx_port_0(rvx_signal_041),
  .rvx_port_3(rvx_signal_105),
	.rvx_port_1(rvx_signal_033)
);

assign rvx_signal_035 = rvx_signal_018;
assign rvx_signal_030 = rvx_signal_020;
assign rvx_signal_073 = rvx_signal_019[`RVX_GDEF_309];

RVX_MODULE_029
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03),
  .RVX_GPARA_0(RVX_LPARA_11)
)
i_rvx_instance_05
(
  .rvx_port_05(rvx_signal_023),
  .rvx_port_01(rvx_signal_041),
  .rvx_port_00(rvx_signal_105),
	.rvx_port_07(rvx_signal_033),
  
  .rvx_port_08(rvx_signal_002),
  .rvx_port_09(rvx_signal_114),
  .rvx_port_02(rvx_signal_046),
  .rvx_port_06(rvx_signal_115),

  .rvx_port_04(rvx_signal_032),
  .rvx_port_03(rvx_signal_027)
);

assign rvx_signal_115 = rvx_signal_013;

RVX_MODULE_133
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03),
  .RVX_GPARA_0(RVX_LPARA_11),
  .RVX_GPARA_4(RVX_LPARA_01),
  .RVX_GPARA_2(RVX_LPARA_04),
  .RVX_GPARA_3(RVX_LPARA_13),
  .RVX_GPARA_1(0)
)
i_rvx_instance_04
(
	.rvx_port_04(rvx_signal_014),
  .rvx_port_10(rvx_signal_028),
  .rvx_port_12(rvx_signal_022),

  .rvx_port_13(rvx_signal_084),
  .rvx_port_05(rvx_signal_058),
  .rvx_port_09(rvx_signal_000),

  .rvx_port_03(rvx_signal_080),
  .rvx_port_02(rvx_signal_062),
  .rvx_port_08(rvx_signal_090),

  .rvx_port_01(rvx_signal_055),
  .rvx_port_11(rvx_signal_070),
  .rvx_port_00(rvx_signal_088),
  .rvx_port_07(rvx_signal_087),

	.rvx_port_06(rvx_signal_011)
);

assign rvx_signal_014 = rvx_signal_018;
assign rvx_signal_028 = rvx_signal_020;
assign rvx_signal_022 = rvx_signal_019[`RVX_GDEF_338];
assign rvx_signal_087 = rvx_signal_013;
assign rvx_signal_000 = rvx_signal_066;
assign rvx_signal_090 = (INCLUDE_DIVIDER==1)? rvx_signal_061 : rvx_signal_051;

RVX_MODULE_083
#(
  .RVX_GPARA_1(RVX_LPARA_08),
  .RVX_GPARA_0(RVX_LPARA_13)
)
i_rvx_instance_11
(
  .rvx_port_00(clk),
  .rvx_port_09(rstnn),
  .rvx_port_03((INCLUDE_DIVIDER==1)),

  .rvx_port_06(rvx_signal_076),
  .rvx_port_10(rvx_signal_064),
	.rvx_port_04(rvx_signal_089),
	.rvx_port_07(rvx_signal_043),
  .rvx_port_01(rvx_signal_025),
  .rvx_port_08(rvx_signal_016),
	.rvx_port_05(rvx_signal_061),
  .rvx_port_02()
);

assign rvx_signal_076 = (rvx_signal_097==`RVX_GDEF_591) & (rvx_signal_019==`RVX_GDEF_107);
assign rvx_signal_089 = rvx_signal_080;
assign rvx_signal_043 = rvx_signal_062;
assign rvx_signal_016 = 1;

assign rvx_signal_113 = `FPIR_TYPE_NORMAL;
assign rvx_signal_086 = rvx_signal_098;
assign rvx_signal_063 = RVX_LPARA_02-1;
assign rvx_signal_036 = 0;

RVX_MODULE_102
#(
  .RVX_GPARA_0(RVX_LPARA_02),
  .RVX_GPARA_1(RVX_LPARA_12)
)
i_rvx_instance_02
(
	.rvx_port_0(rvx_signal_082),
	.rvx_port_1({rvx_signal_047,rvx_signal_077})
);

assign rvx_signal_102 = {rvx_signal_113, rvx_signal_086, rvx_signal_063, rvx_signal_047, rvx_signal_077, rvx_signal_036};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_065 <= 0;
  else if(rvx_signal_060)
    rvx_signal_065 <= rvx_signal_095;
end

always@(*)
begin
  rvx_signal_095 = 0;
  case(rvx_signal_019)
    `RVX_GDEF_380:
      rvx_signal_095 = rvx_signal_102;
    `RVX_GDEF_476,
    `RVX_GDEF_392:
      rvx_signal_095 = rvx_signal_032;
    `RVX_GDEF_413,
    `RVX_GDEF_107:
      rvx_signal_095 = rvx_signal_011;
  endcase
end

RVX_MODULE_045
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03)
)
i_rvx_instance_07
(
  .rvx_port_0(rvx_signal_017),
  .rvx_port_1(rvx_signal_101)
);

assign rvx_signal_017 = (rvx_signal_097==`RVX_GDEF_129)? rvx_signal_099 : rvx_signal_065;

assign rvx_signal_106 = rvx_signal_101;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_031 <= 0;
  else if(rvx_signal_097==`RVX_GDEF_137)
    rvx_signal_031 <= rvx_signal_106;
end

RVX_MODULE_013
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_01
(
	.rvx_port_5(clk),
	.rvx_port_1(rstnn),
	.rvx_port_0(1'b 1),

	.rvx_port_2(1'b 1),
	.rvx_port_3(rvx_signal_031),
	.rvx_port_6(),
	.rvx_port_4(rvx_signal_078)
);

RVX_MODULE_013
#(
  .BW_EXPONENT(RVX_LPARA_09),
  .BW_SIGNIFICAND(RVX_LPARA_08),
  .BW_GUARD(RVX_LPARA_10),
  .BW_OVERFLOW(RVX_LPARA_03),
  .BW_IEEE_EXPONENT(BW_IEEEDP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEEDP_MANTISSA)
)
i_rvx_instance_03
(
	.rvx_port_5(clk),
	.rvx_port_1(rstnn),
	.rvx_port_0(1'b 1),

	.rvx_port_2(1'b 1),
	.rvx_port_3(rvx_signal_031),
	.rvx_port_6(),
	.rvx_port_4(rvx_signal_003)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_079 <= 0;
  else if(rvx_signal_097==`RVX_GDEF_584)
    case(rvx_signal_045)
      `RVX_GDEF_047:
        rvx_signal_079 <= rvx_signal_078;
      `RVX_GDEF_362:
        rvx_signal_079 <= rvx_signal_003;
    endcase
end

endmodule
