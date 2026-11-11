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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_03.vh"
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



`include "rvx_include_02.vh"
`include "rvx_include_16.vh"

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

localparam  RVX_LPARA_12 = (SUPPORT_DOUBLE? BW_IEEEDP_EXPONENT : BW_IEEESP_EXPONENT) + 1;
localparam  RVX_LPARA_05 = (SUPPORT_DOUBLE? BW_IEEEDP_SIGNIFICAND : BW_IEEESP_SIGNIFICAND);
localparam  RVX_LPARA_13 = `MAX((48-RVX_LPARA_05),3);
localparam  RVX_LPARA_08 = 2;

localparam  RVX_LPARA_11 = `BW_FPIR_TYPE + 1 + RVX_LPARA_12 + RVX_LPARA_05 + RVX_LPARA_13 + RVX_LPARA_08;

localparam  RVX_LPARA_06 = RVX_LPARA_05 + RVX_LPARA_13;
localparam  RVX_LPARA_04 = RVX_LPARA_12 + RVX_LPARA_08;

wire rvx_signal_060;
wire rvx_signal_056;
wire rvx_signal_047;
wire [BW_DATA-1:0] rvx_signal_072;
wire rvx_signal_002;
wire rvx_signal_036;
wire [BW_DATA-1:0] rvx_signal_080;
reg  rvx_signal_004;
wire [32-1:0] rvx_signal_000;
wire rvx_signal_021;

wire rvx_signal_015;
wire rvx_signal_092;
wire rvx_signal_032;
wire [BW_DATA-1:0] rvx_signal_066;
wire rvx_signal_039;
wire rvx_signal_113;
wire [BW_DATA-1:0] rvx_signal_037;
reg  rvx_signal_045;
reg  [32-1:0] rvx_signal_076;
wire rvx_signal_035;

reg [`RVX_GDEF_099-1:0] rvx_signal_099;
reg [`RVX_GDEF_101-1:0] rvx_signal_030;
reg [`RVX_GDEF_603-1:0] rvx_signal_075;
reg [`RVX_GDEF_603-1:0] rvx_signal_034;
wire [`RVX_GDEF_101-1:0] rvx_signal_116;
reg rvx_signal_017;
reg rvx_signal_083;
reg rvx_signal_044;
wire rvx_signal_115;
wire rvx_signal_077;
wire rvx_signal_126;
wire rvx_signal_071;
reg  rvx_signal_049;
wire rvx_signal_053;
wire rvx_signal_109;

localparam  RVX_LPARA_03 = 4;

wire rvx_signal_005;
wire rvx_signal_081;
wire [RVX_LPARA_03-1:0] rvx_signal_128;
reg [RVX_LPARA_03-1:0] rvx_signal_025;
reg [RVX_LPARA_03-1:0] rvx_signal_120;

reg rvx_signal_117;
reg [32-1:0] rvx_signal_033;
reg [RVX_LPARA_03-1:0] rvx_signal_122;
reg [1:0] rvx_signal_095;
reg [1:0] rvx_signal_110;
reg [RVX_LPARA_11-1:0] rvx_signal_055;
reg rvx_signal_108;

reg [32-1:0] rvx_signal_026;
reg rvx_signal_121;
reg [32-1:0] rvx_signal_086;
reg rvx_signal_100;
reg rvx_signal_127;
wire rvx_signal_079;

localparam  RVX_LPARA_07 = 32;

wire rvx_signal_073;
wire [RVX_LPARA_07-1:0] rvx_signal_046;

wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_042;
wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_084;

wire [RVX_LPARA_11-1:0] rvx_signal_016;
wire [RVX_LPARA_11-1:0] rvx_signal_027;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_078;
wire rvx_signal_068;
wire [RVX_LPARA_12-1:0] rvx_signal_048;
wire [RVX_LPARA_05-1:0] rvx_signal_041;
wire [RVX_LPARA_13-1:0] rvx_signal_065;
wire [RVX_LPARA_08-1:0] rvx_signal_014;

wire [24-1:0] rvx_signal_011;

reg [RVX_LPARA_11-1:0] rvx_signal_106;
reg rvx_signal_028;

reg [RVX_LPARA_11-1:0] rvx_signal_054;
reg rvx_signal_124;

localparam  RVX_LPARA_01 = RVX_LPARA_06 + 1;

reg [RVX_LPARA_01-1:0] rvx_signal_070;
reg [RVX_LPARA_01-1:0] rvx_signal_114;
reg rvx_signal_089;
wire [RVX_LPARA_01-1:0] rvx_signal_111;

wire [RVX_LPARA_11-1:0] rvx_signal_024;
wire [RVX_LPARA_11-1:0] rvx_signal_052;
wire rvx_signal_088;
wire [RVX_LPARA_11-1:0] rvx_signal_062;
wire [RVX_LPARA_11-1:0] rvx_signal_091;
wire rvx_signal_129;
wire [RVX_LPARA_11-1:0] rvx_signal_019;
reg  [RVX_LPARA_11-1:0] rvx_signal_069;
reg  [RVX_LPARA_11-1:0] rvx_signal_057;
reg  rvx_signal_043;
reg  [RVX_LPARA_11-1:0] rvx_signal_007;
wire [RVX_LPARA_01-1:0] rvx_signal_085;
wire [RVX_LPARA_01-1:0] rvx_signal_101;
wire rvx_signal_008;
wire [RVX_LPARA_01-1:0] rvx_signal_090;
wire [RVX_LPARA_11-1:0] rvx_signal_020;
wire rvx_signal_023;

localparam  RVX_LPARA_02 = RVX_LPARA_05;
localparam  RVX_LPARA_00 = RVX_LPARA_05;
localparam  RVX_LPARA_09 = 2*RVX_LPARA_05;

wire [RVX_LPARA_11-1:0] rvx_signal_087;
wire [RVX_LPARA_11-1:0] rvx_signal_097;
wire rvx_signal_010;
wire [RVX_LPARA_02-1:0] rvx_signal_059;
wire [RVX_LPARA_02-1:0] rvx_signal_107;
wire [2*RVX_LPARA_02-1:0] rvx_signal_012;
wire [RVX_LPARA_00-1:0] rvx_signal_130;
wire [RVX_LPARA_00-1:0] rvx_signal_096;
wire [RVX_LPARA_09-1:0] rvx_signal_001;
wire [RVX_LPARA_01-1:0] rvx_signal_003;
wire [RVX_LPARA_01-1:0] rvx_signal_123;
wire rvx_signal_050;
wire [RVX_LPARA_01-1:0] rvx_signal_064;
wire [RVX_LPARA_11-1:0] rvx_signal_063;

wire rvx_signal_093;
wire rvx_signal_104;
wire [RVX_LPARA_05-1:0] rvx_signal_022;
wire [RVX_LPARA_05-1:0] rvx_signal_118;
wire rvx_signal_051;
wire rvx_signal_009;
wire [RVX_LPARA_09-1:0] rvx_signal_006;

wire [RVX_LPARA_11-1:0] rvx_signal_098;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_058;
wire rvx_signal_067;
wire [RVX_LPARA_12-1:0] rvx_signal_029;
wire [RVX_LPARA_05-1:0] rvx_signal_061;
wire [RVX_LPARA_13-1:0] rvx_signal_013;
wire [RVX_LPARA_08-1:0] rvx_signal_074;

wire [RVX_LPARA_11-1:0] rvx_signal_094;
wire [RVX_LPARA_11-1:0] rvx_signal_038;

wire [RVX_LPARA_11-1:0] rvx_signal_119;
wire [RVX_LPARA_11-1:0] rvx_signal_031;

reg [RVX_LPARA_11-1:0] rvx_signal_040;
reg [RVX_LPARA_11-1:0] rvx_signal_018;
reg [RVX_LPARA_11-1:0] rvx_signal_125;
wire [BW_IEEESP_VALUE-1:0] rvx_signal_105;
wire [BW_IEEEDP_VALUE-1:0] rvx_signal_112;

localparam  RVX_LPARA_10 = RVX_LPARA_03;

reg [RVX_LPARA_10*BW_DATA-1:0] rvx_signal_103;

wire [32-1:0] rvx_signal_102;
reg  [32-1:0] rvx_signal_082;

RVX_MODULE_057
#(
  .RVX_GPARA_2(BW_ADDR),
  .RVX_GPARA_1(BW_DATA),
  .RVX_GPARA_0(ENDIAN_TYPE)
)
i_rvx_instance_12
(
	.rvx_port_16(clk),
	.rvx_port_21(rstnn),

	.rvx_port_08(rpsel),
	.rvx_port_30(rpenable),
	.rvx_port_12(rpaddr),
	.rvx_port_17(rpwrite),
	.rvx_port_27(rpwdata),
	.rvx_port_01(rprdata),
	.rvx_port_03(rpready),
	.rvx_port_26(rpslverr),

	.rvx_port_11(1'b 0),
  .rvx_port_20(rvx_signal_060),
	.rvx_port_25(rvx_signal_002),
	.rvx_port_06(rvx_signal_036),
	.rvx_port_15(rvx_signal_080),
	.rvx_port_29(rvx_signal_004),
	.rvx_port_00(rvx_signal_000),
	.rvx_port_19(rvx_signal_056),
	.rvx_port_05(rvx_signal_047),
	.rvx_port_24(rvx_signal_072),
	.rvx_port_07(rvx_signal_021),
	.rvx_port_18(rvx_signal_015),
	.rvx_port_04(rvx_signal_092),
	.rvx_port_23(rvx_signal_032),
	.rvx_port_13(rvx_signal_066),
	.rvx_port_09(rvx_signal_039),
	.rvx_port_22(rvx_signal_113),
	.rvx_port_10(rvx_signal_037),
	.rvx_port_02(rvx_signal_045),
	.rvx_port_14(rvx_signal_076),
	.rvx_port_28(rvx_signal_035)
);

assign rvx_signal_060 = 0;
assign rvx_signal_021 = ~rvx_signal_047;
assign rvx_signal_015 = 0;
assign rvx_signal_035 = ~rvx_signal_032;

always@(*)
begin
  rvx_signal_004 = 0;
  case(rvx_signal_099)
    `RVX_GDEF_462:
      rvx_signal_004 = 1;
    `RVX_GDEF_443:
      rvx_signal_004 = 1;
  endcase
end

always@(*)
begin
  rvx_signal_045 = 0;
  if(rvx_signal_117)
    case(rvx_signal_030)
      `RVX_GDEF_584:
        rvx_signal_045 = rvx_signal_028 | rvx_signal_124;
      `RVX_GDEF_348:
        if(INCLUDE_DIVIDER==0)
          rvx_signal_045 = rvx_signal_028 | rvx_signal_124;
    endcase
  else if(rvx_signal_099==`RVX_GDEF_453)
    rvx_signal_045 = 1;
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_10)
)
i_rvx_instance_09
(
	.data_input_list(rvx_signal_103),
	.select(rvx_signal_128[RVX_LPARA_10-1:0]),
	.data_output(rvx_signal_102)
);

always@(*)
begin
  rvx_signal_082 = $unsigned(rvx_signal_011);
  case(rvx_signal_030)
    `RVX_GDEF_584,
    `RVX_GDEF_348:
      rvx_signal_082 = $unsigned(rvx_signal_011);
  endcase
end

always@(*)
begin
  rvx_signal_076 = rvx_signal_102;
  if(rvx_signal_117)
    rvx_signal_076 = rvx_signal_082;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_099 <= `RVX_GDEF_462;
  else
    case(rvx_signal_099)
      `RVX_GDEF_462:
        if(rvx_signal_077)
          rvx_signal_099 <= `RVX_GDEF_443;
      `RVX_GDEF_443:
        if(rvx_signal_071)
          rvx_signal_099 <= `RVX_GDEF_255;
      `RVX_GDEF_255:
        if(rvx_signal_049)
          rvx_signal_099 <= `RVX_GDEF_510;
      `RVX_GDEF_510:
        rvx_signal_099 <= `RVX_GDEF_356;
      `RVX_GDEF_356:
        if(rvx_signal_110==2)
          rvx_signal_099 <= `RVX_GDEF_453;
      `RVX_GDEF_453:
        if(rvx_signal_109)
          rvx_signal_099 <= `RVX_GDEF_462;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_095 <= 0;
  else if(rvx_signal_099!=`RVX_GDEF_255)
    rvx_signal_095 <= 0;
  else if(rvx_signal_095!=3)
    rvx_signal_095 <= rvx_signal_095 + 1'b 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_110 <= 0;
  else if(rvx_signal_099!=`RVX_GDEF_356)
    rvx_signal_110 <= 0;
  else if(rvx_signal_110!=2)
    rvx_signal_110 <= rvx_signal_110 + 1'b 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  {rvx_signal_030,rvx_signal_075,rvx_signal_034} <= 0;
  else if(rvx_signal_077)
    {rvx_signal_030,rvx_signal_075,rvx_signal_034} <= rvx_signal_000;
end

assign rvx_signal_116 = rvx_signal_000[`RVX_GDEF_101+2*`RVX_GDEF_603-1-:`RVX_GDEF_101];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_017 <= 0;
    rvx_signal_083 <= 0;
    rvx_signal_044 <= 0;
  end
  else if(rvx_signal_077)
  begin
    rvx_signal_017 <= (rvx_signal_116==`RVX_GDEF_146);
    rvx_signal_083 <= (rvx_signal_116==`RVX_GDEF_507) | (rvx_signal_116==`RVX_GDEF_345);
    rvx_signal_044 <= (rvx_signal_116==`RVX_GDEF_584) | (rvx_signal_116==`RVX_GDEF_348);
  end
end

assign rvx_signal_115 = rvx_signal_002 & rvx_signal_004;
assign rvx_signal_077 = (rvx_signal_099==`RVX_GDEF_462) & rvx_signal_115;
assign rvx_signal_126 = (rvx_signal_099==`RVX_GDEF_443) & rvx_signal_115;

always@(*)
begin
  rvx_signal_049 = 0;
  case(rvx_signal_099)
    `RVX_GDEF_255:
      case(rvx_signal_030)
        `RVX_GDEF_507,
        `RVX_GDEF_345:
          rvx_signal_049 = (rvx_signal_095==3);
        `RVX_GDEF_348:
          if(INCLUDE_DIVIDER)
            rvx_signal_049 = rvx_signal_108;
          else
            rvx_signal_049 = (rvx_signal_095==2);
        default:
          rvx_signal_049 = (rvx_signal_095==2);
      endcase
  endcase
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_03)
)
i_rvx_instance_05
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(1'b 1),
	.init(rvx_signal_005),
  .count(rvx_signal_081),
	.value(rvx_signal_128),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_005 = rvx_signal_071 | rvx_signal_109;
assign rvx_signal_081 = rvx_signal_126 | rvx_signal_053;

always@(*)
begin
  rvx_signal_025 = ((1'b 1) << 0);
  case(rvx_signal_030)
    `RVX_GDEF_146:
      rvx_signal_025 = ((1'b 1) << 0);
    `RVX_GDEF_507,
    `RVX_GDEF_345:
      rvx_signal_025 = ((1'b 1) << 1);
    `RVX_GDEF_584:
      rvx_signal_025 = ((1'b 1) << 3);
    `RVX_GDEF_348:
      if(INCLUDE_DIVIDER)
        rvx_signal_025 = ((1'b 1) << 1);
      else
        rvx_signal_025 = ((1'b 1) << 3);
  endcase
end

assign rvx_signal_053 = (rvx_signal_099==`RVX_GDEF_453) & rvx_signal_045;
assign rvx_signal_071 = rvx_signal_126 & (rvx_signal_128==rvx_signal_025);

always@(*)
begin
  rvx_signal_120 = ((1'b 1) << 0);
  case(rvx_signal_034)
    `RVX_GDEF_368:
      rvx_signal_120 = ((1'b 1) << 1);
  endcase
end

assign rvx_signal_109 = rvx_signal_053 & (rvx_signal_128==rvx_signal_120);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_117 <= 0;
    rvx_signal_033 <= 0;
    rvx_signal_122 <= 0;
  end
  else
  begin
    rvx_signal_117 <= rvx_signal_126;
    if(rvx_signal_126)
    begin
      rvx_signal_033 <= rvx_signal_000;
      rvx_signal_122 <= rvx_signal_128;
    end
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_026 <= 0;
  else if(rvx_signal_121)
    rvx_signal_026 <= rvx_signal_033;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_086 <= 0;
  else if(rvx_signal_100)
    rvx_signal_086 <= rvx_signal_033;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_127 <= 0;
  else if(rvx_signal_079)
    case(rvx_signal_075)
      `RVX_GDEF_299:
        rvx_signal_127 <= rvx_signal_033[32-1];
      default:
        rvx_signal_127 <= 0;
    endcase
end
assign rvx_signal_079 = rvx_signal_121 | rvx_signal_100;

assign rvx_signal_073 = rvx_signal_127;
assign rvx_signal_046 = rvx_signal_073? ((~rvx_signal_026)+1'b 1) : rvx_signal_026;
assign rvx_signal_042 = {rvx_signal_086,rvx_signal_026};
assign rvx_signal_084 = {rvx_signal_086,rvx_signal_026};

RVX_MODULE_046
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_11
(
	.rvx_port_6(clk),
	.rvx_port_4(rstnn),
	.rvx_port_2(1'b 1),

	.rvx_port_5(rvx_signal_117),
	.rvx_port_3(rvx_signal_033),
  .rvx_port_1(),
	.rvx_port_0(rvx_signal_016)	
);

assign rvx_signal_027 = rvx_signal_038;

assign {rvx_signal_078, rvx_signal_068, rvx_signal_048, rvx_signal_041, rvx_signal_065, rvx_signal_014} = rvx_signal_027;

RVX_MODULE_081
#(
  .RVX_GPARA_1(RVX_LPARA_06),
  .RVX_GPARA_0(24)
)
i_rvx_instance_07
(
	.rvx_port_1({rvx_signal_041,rvx_signal_065}),
	.rvx_port_0(rvx_signal_011)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_106 <= 0;
  else if(rvx_signal_028)
    rvx_signal_106 <= rvx_signal_027;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_054 <= 0;
  else if(rvx_signal_124)
    rvx_signal_054 <= rvx_signal_027;
end

always@(*)
begin
  rvx_signal_121 = 0;
  rvx_signal_100 = 0;
  rvx_signal_028 = 0;
  rvx_signal_124 = 0;
  if(rvx_signal_117)
    case(rvx_signal_030)
      `RVX_GDEF_146:
      begin
        rvx_signal_121 = rvx_signal_122[0];
        rvx_signal_100 = rvx_signal_122[1];
      end
      `RVX_GDEF_507,
      `RVX_GDEF_345:
      begin
        rvx_signal_028 = rvx_signal_122[0];
        rvx_signal_124 = rvx_signal_122[1];
      end
      `RVX_GDEF_584,
      `RVX_GDEF_348:
      begin
        rvx_signal_028 = rvx_signal_122[0];
        rvx_signal_124 = rvx_signal_122[1];
        rvx_signal_121 = rvx_signal_122[2];
        rvx_signal_100 = rvx_signal_122[3];
      end
    endcase
end

always@(*)
begin
  rvx_signal_070 = rvx_signal_085;
  rvx_signal_114 = rvx_signal_101;
  rvx_signal_089 = rvx_signal_008;
  if(rvx_signal_044)
  begin
    rvx_signal_070 = rvx_signal_003;
    rvx_signal_114 = rvx_signal_123;
    rvx_signal_089 = rvx_signal_050;
  end
end

assign rvx_signal_111 = rvx_signal_070 + rvx_signal_114 + rvx_signal_089;

RVX_MODULE_093
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08),
  .RVX_GPARA_0(1)
)
i_rvx_instance_01
(
	.rvx_port_00(clk),
	.rvx_port_01(rstnn),
	.rvx_port_04(1'b 1),

	.rvx_port_09(rvx_signal_024),
  .rvx_port_02(rvx_signal_052),
  .rvx_port_03(rvx_signal_088),

  .rvx_port_08(rvx_signal_062),
  .rvx_port_07(rvx_signal_091),
  .rvx_port_05(rvx_signal_129),
	.rvx_port_06(rvx_signal_019)
);

assign rvx_signal_024 = rvx_signal_106;
assign rvx_signal_052 = rvx_signal_054;
assign rvx_signal_088 = rvx_signal_030[`RVX_GDEF_230];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_069 <= 0;
    rvx_signal_057 <= 0;
    rvx_signal_043 <= 0;
    rvx_signal_007 <= 0;
  end
  else if((rvx_signal_099==`RVX_GDEF_255) && (rvx_signal_095==2))
  begin
    rvx_signal_069 <= rvx_signal_062;
    rvx_signal_057 <= rvx_signal_091;
    rvx_signal_043 <= rvx_signal_129;
    rvx_signal_007 <= rvx_signal_019;
  end
end

RVX_MODULE_131
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08),
  .RVX_GPARA_0(RVX_LPARA_01)
)
i_rvx_instance_10
(
  .rvx_port_06(rvx_signal_069),
  .rvx_port_03(rvx_signal_057),
  .rvx_port_04(rvx_signal_043),
	.rvx_port_05(rvx_signal_007),
  
  .rvx_port_02(rvx_signal_085),
  .rvx_port_08(rvx_signal_101),
  .rvx_port_07(rvx_signal_008),
  .rvx_port_00(rvx_signal_090),

  .rvx_port_01(rvx_signal_020),
  .rvx_port_09(rvx_signal_023)
);

assign rvx_signal_090 = rvx_signal_111;

RVX_MODULE_011
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08),
  .RVX_GPARA_1(RVX_LPARA_01),
  .RVX_GPARA_2(RVX_LPARA_02),
  .RVX_GPARA_4(RVX_LPARA_00),
  .RVX_GPARA_3(RVX_LPARA_09),
  .RVX_GPARA_0(0)
)
i_rvx_instance_06
(
	.rvx_port_04(rvx_signal_087),
  .rvx_port_02(rvx_signal_097),
  .rvx_port_07(rvx_signal_010),

  .rvx_port_08(rvx_signal_059),
  .rvx_port_11(rvx_signal_107),
  .rvx_port_05(rvx_signal_012),

  .rvx_port_01(rvx_signal_130),
  .rvx_port_10(rvx_signal_096),
  .rvx_port_00(rvx_signal_001),

  .rvx_port_12(rvx_signal_003),
  .rvx_port_09(rvx_signal_123),
  .rvx_port_06(rvx_signal_050),
  .rvx_port_03(rvx_signal_064),

	.rvx_port_13(rvx_signal_063)
);

assign rvx_signal_087 = rvx_signal_106;
assign rvx_signal_097 = rvx_signal_054;
assign rvx_signal_010 = rvx_signal_030[`RVX_GDEF_502];
assign rvx_signal_064 = rvx_signal_111;
assign rvx_signal_012 = rvx_signal_042;
assign rvx_signal_001 = (INCLUDE_DIVIDER==1)? rvx_signal_006 : rvx_signal_084;

RVX_MODULE_065
#(
  .RVX_GPARA_0(RVX_LPARA_05),
  .RVX_GPARA_1(RVX_LPARA_09)
)
i_rvx_instance_03
(
  .rvx_port_06(clk),
  .rvx_port_00(rstnn),
  .rvx_port_05((INCLUDE_DIVIDER==1)),

  .rvx_port_07(rvx_signal_093),
  .rvx_port_01(rvx_signal_104),
	.rvx_port_03(rvx_signal_022),
	.rvx_port_10(rvx_signal_118),
  .rvx_port_09(rvx_signal_051),
  .rvx_port_02(rvx_signal_009),
	.rvx_port_08(rvx_signal_006),
  .rvx_port_04()
);

assign rvx_signal_093 = (rvx_signal_099==`RVX_GDEF_255) & (rvx_signal_095==2) & (rvx_signal_030==`RVX_GDEF_348);
assign rvx_signal_022 = rvx_signal_130;
assign rvx_signal_118 = rvx_signal_096;
assign rvx_signal_009 = 1;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_108 <= 0;
  else
    rvx_signal_108 <= rvx_signal_051;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_055 <= 0;
  else if(rvx_signal_099==`RVX_GDEF_255)
    rvx_signal_055 <= rvx_signal_063;
end

assign rvx_signal_058 = `FPIR_TYPE_NORMAL;
assign rvx_signal_067 = rvx_signal_073;
assign rvx_signal_029 = RVX_LPARA_07-1;
assign rvx_signal_074 = 0;

RVX_MODULE_081
#(
  .RVX_GPARA_1(RVX_LPARA_07),
  .RVX_GPARA_0(RVX_LPARA_06)
)
i_rvx_instance_00
(
	.rvx_port_1(rvx_signal_046),
	.rvx_port_0({rvx_signal_061,rvx_signal_013})
);

assign rvx_signal_098 = {rvx_signal_058, rvx_signal_067, rvx_signal_029, rvx_signal_061, rvx_signal_013, rvx_signal_074};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_018 <= 0;
  else if(rvx_signal_049)
    rvx_signal_018 <= rvx_signal_040;
end

always@(*)
begin
  rvx_signal_040 = 0;
  if(rvx_signal_017)
    rvx_signal_040 = rvx_signal_098;
  else if(rvx_signal_083)
    rvx_signal_040 = rvx_signal_020;
  else if(rvx_signal_044)
    rvx_signal_040 = rvx_signal_055;
end

RVX_MODULE_048
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08)
)
i_rvx_instance_04
(
  .rvx_port_1(rvx_signal_094),
  .rvx_port_0(rvx_signal_038)
);

assign rvx_signal_094 = rvx_signal_117? rvx_signal_016 : rvx_signal_018;

assign rvx_signal_031 = rvx_signal_038;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_125 <= 0;
  else if(rvx_signal_099==`RVX_GDEF_510)
    rvx_signal_125 <= rvx_signal_031;
end

RVX_MODULE_016
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA),
  .RVX_GPARA_0(2)
)
i_rvx_instance_02
(
	.rvx_port_6(clk),
	.rvx_port_2(rstnn),
	.rvx_port_1(1'b 1),

	.rvx_port_0(1'b 1),
	.rvx_port_4(rvx_signal_125),
	.rvx_port_5(),
	.rvx_port_3(rvx_signal_105)
);

RVX_MODULE_016
#(
  .BW_EXPONENT(RVX_LPARA_12),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_13),
  .BW_OVERFLOW(RVX_LPARA_08),
  .BW_IEEE_EXPONENT(BW_IEEEDP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEEDP_MANTISSA),
  .RVX_GPARA_0(2)
)
i_rvx_instance_08
(
	.rvx_port_6(clk),
	.rvx_port_2(rstnn),
	.rvx_port_1(1'b 1),

	.rvx_port_0(1'b 1),
	.rvx_port_4(rvx_signal_125),
	.rvx_port_5(),
	.rvx_port_3(rvx_signal_112)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_103 <= 0;
  else if((rvx_signal_099==`RVX_GDEF_356) && (rvx_signal_110==2))
    case(rvx_signal_034)
      `RVX_GDEF_304:
        rvx_signal_103 <= rvx_signal_105;
      `RVX_GDEF_368:
        rvx_signal_103 <= rvx_signal_112;
    endcase
end

endmodule
