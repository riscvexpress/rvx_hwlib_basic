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
`include "ervp_endian.vh"
`include "rvx_include_14.vh"
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



`include "rvx_include_18.vh"
`include "rvx_include_02.vh"

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

localparam  RVX_LPARA_01 = (SUPPORT_DOUBLE? BW_IEEEDP_EXPONENT : BW_IEEESP_EXPONENT) + 1;
localparam  RVX_LPARA_05 = (SUPPORT_DOUBLE? BW_IEEEDP_SIGNIFICAND : BW_IEEESP_SIGNIFICAND);
localparam  RVX_LPARA_03 = `MAX((48-RVX_LPARA_05),3);
localparam  RVX_LPARA_06 = 2;

localparam  RVX_LPARA_09 = `BW_FPIR_TYPE + 1 + RVX_LPARA_01 + RVX_LPARA_05 + RVX_LPARA_03 + RVX_LPARA_06;

localparam  RVX_LPARA_12 = RVX_LPARA_05 + RVX_LPARA_03;
localparam  RVX_LPARA_07 = RVX_LPARA_01 + RVX_LPARA_06;

wire rvx_signal_003;
wire rvx_signal_072;
wire rvx_signal_075;
wire [BW_DATA-1:0] rvx_signal_031;
wire rvx_signal_009;
wire rvx_signal_049;
wire [BW_DATA-1:0] rvx_signal_095;
reg  rvx_signal_004;
wire [32-1:0] rvx_signal_014;
wire rvx_signal_060;

wire rvx_signal_035;
wire rvx_signal_120;
wire rvx_signal_091;
wire [BW_DATA-1:0] rvx_signal_067;
wire rvx_signal_118;
wire rvx_signal_125;
wire [BW_DATA-1:0] rvx_signal_083;
reg  rvx_signal_113;
reg  [32-1:0] rvx_signal_069;
wire rvx_signal_040;

reg [`RVX_GDEF_376-1:0] rvx_signal_038;
reg [`RVX_GDEF_195-1:0] rvx_signal_000;
reg [`RVX_GDEF_103-1:0] rvx_signal_057;
reg [`RVX_GDEF_103-1:0] rvx_signal_128;
wire [`RVX_GDEF_195-1:0] rvx_signal_073;
reg rvx_signal_126;
reg rvx_signal_110;
reg rvx_signal_065;
wire rvx_signal_010;
wire rvx_signal_050;
wire rvx_signal_070;
wire rvx_signal_068;
reg  rvx_signal_082;
wire rvx_signal_042;
wire rvx_signal_087;

localparam  RVX_LPARA_00 = 4;

wire rvx_signal_044;
wire rvx_signal_085;
wire [RVX_LPARA_00-1:0] rvx_signal_043;
reg [RVX_LPARA_00-1:0] rvx_signal_056;
reg [RVX_LPARA_00-1:0] rvx_signal_022;

reg rvx_signal_105;
reg [32-1:0] rvx_signal_058;
reg [RVX_LPARA_00-1:0] rvx_signal_089;
reg [1:0] rvx_signal_012;
reg [1:0] rvx_signal_045;
reg [RVX_LPARA_09-1:0] rvx_signal_093;
reg rvx_signal_026;

reg [32-1:0] rvx_signal_094;
reg rvx_signal_084;
reg [32-1:0] rvx_signal_127;
reg rvx_signal_112;
reg rvx_signal_129;
wire rvx_signal_090;

localparam  RVX_LPARA_13 = 32;

wire rvx_signal_034;
wire [RVX_LPARA_13-1:0] rvx_signal_037;

wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_077;
wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_124;

wire [RVX_LPARA_09-1:0] rvx_signal_053;
wire [RVX_LPARA_09-1:0] rvx_signal_102;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_104;
wire rvx_signal_107;
wire [RVX_LPARA_01-1:0] rvx_signal_013;
wire [RVX_LPARA_05-1:0] rvx_signal_018;
wire [RVX_LPARA_03-1:0] rvx_signal_032;
wire [RVX_LPARA_06-1:0] rvx_signal_074;

wire [24-1:0] rvx_signal_020;

reg [RVX_LPARA_09-1:0] rvx_signal_071;
reg rvx_signal_108;

reg [RVX_LPARA_09-1:0] rvx_signal_005;
reg rvx_signal_096;

localparam  RVX_LPARA_02 = RVX_LPARA_12 + 1;

reg [RVX_LPARA_02-1:0] rvx_signal_062;
reg [RVX_LPARA_02-1:0] rvx_signal_048;
reg rvx_signal_066;
wire [RVX_LPARA_02-1:0] rvx_signal_122;

wire [RVX_LPARA_09-1:0] rvx_signal_086;
wire [RVX_LPARA_09-1:0] rvx_signal_055;
wire rvx_signal_061;
wire [RVX_LPARA_09-1:0] rvx_signal_008;
wire [RVX_LPARA_09-1:0] rvx_signal_114;
wire rvx_signal_080;
wire [RVX_LPARA_09-1:0] rvx_signal_092;
reg  [RVX_LPARA_09-1:0] rvx_signal_016;
reg  [RVX_LPARA_09-1:0] rvx_signal_015;
reg  rvx_signal_001;
reg  [RVX_LPARA_09-1:0] rvx_signal_059;
wire [RVX_LPARA_02-1:0] rvx_signal_109;
wire [RVX_LPARA_02-1:0] rvx_signal_028;
wire rvx_signal_006;
wire [RVX_LPARA_02-1:0] rvx_signal_123;
wire [RVX_LPARA_09-1:0] rvx_signal_100;
wire rvx_signal_036;

localparam  RVX_LPARA_11 = RVX_LPARA_05;
localparam  RVX_LPARA_08 = RVX_LPARA_05;
localparam  RVX_LPARA_10 = 2*RVX_LPARA_05;

wire [RVX_LPARA_09-1:0] rvx_signal_052;
wire [RVX_LPARA_09-1:0] rvx_signal_103;
wire rvx_signal_076;
wire [RVX_LPARA_11-1:0] rvx_signal_046;
wire [RVX_LPARA_11-1:0] rvx_signal_106;
wire [2*RVX_LPARA_11-1:0] rvx_signal_029;
wire [RVX_LPARA_08-1:0] rvx_signal_111;
wire [RVX_LPARA_08-1:0] rvx_signal_047;
wire [RVX_LPARA_10-1:0] rvx_signal_041;
wire [RVX_LPARA_02-1:0] rvx_signal_099;
wire [RVX_LPARA_02-1:0] rvx_signal_025;
wire rvx_signal_030;
wire [RVX_LPARA_02-1:0] rvx_signal_101;
wire [RVX_LPARA_09-1:0] rvx_signal_051;

wire rvx_signal_021;
wire rvx_signal_078;
wire [RVX_LPARA_05-1:0] rvx_signal_054;
wire [RVX_LPARA_05-1:0] rvx_signal_023;
wire rvx_signal_116;
wire rvx_signal_039;
wire [RVX_LPARA_10-1:0] rvx_signal_063;

wire [RVX_LPARA_09-1:0] rvx_signal_097;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_098;
wire rvx_signal_117;
wire [RVX_LPARA_01-1:0] rvx_signal_033;
wire [RVX_LPARA_05-1:0] rvx_signal_027;
wire [RVX_LPARA_03-1:0] rvx_signal_002;
wire [RVX_LPARA_06-1:0] rvx_signal_007;

wire [RVX_LPARA_09-1:0] rvx_signal_115;
wire [RVX_LPARA_09-1:0] rvx_signal_064;

wire [RVX_LPARA_09-1:0] rvx_signal_081;
wire [RVX_LPARA_09-1:0] rvx_signal_011;

reg [RVX_LPARA_09-1:0] rvx_signal_019;
reg [RVX_LPARA_09-1:0] rvx_signal_119;
reg [RVX_LPARA_09-1:0] rvx_signal_130;
wire [BW_IEEESP_VALUE-1:0] rvx_signal_088;
wire [BW_IEEEDP_VALUE-1:0] rvx_signal_121;

localparam  RVX_LPARA_04 = RVX_LPARA_00;

reg [RVX_LPARA_04*BW_DATA-1:0] rvx_signal_017;

wire [32-1:0] rvx_signal_079;
reg  [32-1:0] rvx_signal_024;

RVX_MODULE_026
#(
  .RVX_GPARA_2(BW_ADDR),
  .RVX_GPARA_0(BW_DATA),
  .RVX_GPARA_1(ENDIAN_TYPE)
)
i_rvx_instance_03
(
	.rvx_port_11(clk),
	.rvx_port_24(rstnn),

	.rvx_port_00(rpsel),
	.rvx_port_14(rpenable),
	.rvx_port_28(rpaddr),
	.rvx_port_16(rpwrite),
	.rvx_port_30(rpwdata),
	.rvx_port_20(rprdata),
	.rvx_port_12(rpready),
	.rvx_port_23(rpslverr),

	.rvx_port_26(1'b 0),
  .rvx_port_05(rvx_signal_003),
	.rvx_port_27(rvx_signal_009),
	.rvx_port_22(rvx_signal_049),
	.rvx_port_09(rvx_signal_095),
	.rvx_port_17(rvx_signal_004),
	.rvx_port_08(rvx_signal_014),
	.rvx_port_07(rvx_signal_072),
	.rvx_port_03(rvx_signal_075),
	.rvx_port_13(rvx_signal_031),
	.rvx_port_15(rvx_signal_060),
	.rvx_port_19(rvx_signal_035),
	.rvx_port_18(rvx_signal_120),
	.rvx_port_01(rvx_signal_091),
	.rvx_port_06(rvx_signal_067),
	.rvx_port_29(rvx_signal_118),
	.rvx_port_10(rvx_signal_125),
	.rvx_port_02(rvx_signal_083),
	.rvx_port_04(rvx_signal_113),
	.rvx_port_25(rvx_signal_069),
	.rvx_port_21(rvx_signal_040)
);

assign rvx_signal_003 = 0;
assign rvx_signal_060 = ~rvx_signal_075;
assign rvx_signal_035 = 0;
assign rvx_signal_040 = ~rvx_signal_091;

always@(*)
begin
  rvx_signal_004 = 0;
  case(rvx_signal_038)
    `RVX_GDEF_607:
      rvx_signal_004 = 1;
    `RVX_GDEF_083:
      rvx_signal_004 = 1;
  endcase
end

always@(*)
begin
  rvx_signal_113 = 0;
  if(rvx_signal_105)
    case(rvx_signal_000)
      `RVX_GDEF_322:
        rvx_signal_113 = rvx_signal_108 | rvx_signal_096;
      `RVX_GDEF_033:
        if(INCLUDE_DIVIDER==0)
          rvx_signal_113 = rvx_signal_108 | rvx_signal_096;
    endcase
  else if(rvx_signal_038==`RVX_GDEF_225)
    rvx_signal_113 = 1;
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_04)
)
i_rvx_instance_02
(
	.data_input_list(rvx_signal_017),
	.select(rvx_signal_043[RVX_LPARA_04-1:0]),
	.data_output(rvx_signal_079)
);

always@(*)
begin
  rvx_signal_024 = $unsigned(rvx_signal_020);
  case(rvx_signal_000)
    `RVX_GDEF_322,
    `RVX_GDEF_033:
      rvx_signal_024 = $unsigned(rvx_signal_020);
  endcase
end

always@(*)
begin
  rvx_signal_069 = rvx_signal_079;
  if(rvx_signal_105)
    rvx_signal_069 = rvx_signal_024;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_038 <= `RVX_GDEF_607;
  else
    case(rvx_signal_038)
      `RVX_GDEF_607:
        if(rvx_signal_050)
          rvx_signal_038 <= `RVX_GDEF_083;
      `RVX_GDEF_083:
        if(rvx_signal_068)
          rvx_signal_038 <= `RVX_GDEF_193;
      `RVX_GDEF_193:
        if(rvx_signal_082)
          rvx_signal_038 <= `RVX_GDEF_378;
      `RVX_GDEF_378:
        rvx_signal_038 <= `RVX_GDEF_570;
      `RVX_GDEF_570:
        if(rvx_signal_045==2)
          rvx_signal_038 <= `RVX_GDEF_225;
      `RVX_GDEF_225:
        if(rvx_signal_087)
          rvx_signal_038 <= `RVX_GDEF_607;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_012 <= 0;
  else if(rvx_signal_038!=`RVX_GDEF_193)
    rvx_signal_012 <= 0;
  else if(rvx_signal_012!=3)
    rvx_signal_012 <= rvx_signal_012 + 1'b 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_045 <= 0;
  else if(rvx_signal_038!=`RVX_GDEF_570)
    rvx_signal_045 <= 0;
  else if(rvx_signal_045!=2)
    rvx_signal_045 <= rvx_signal_045 + 1'b 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  {rvx_signal_000,rvx_signal_057,rvx_signal_128} <= 0;
  else if(rvx_signal_050)
    {rvx_signal_000,rvx_signal_057,rvx_signal_128} <= rvx_signal_014;
end

assign rvx_signal_073 = rvx_signal_014[`RVX_GDEF_195+2*`RVX_GDEF_103-1-:`RVX_GDEF_195];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_126 <= 0;
    rvx_signal_110 <= 0;
    rvx_signal_065 <= 0;
  end
  else if(rvx_signal_050)
  begin
    rvx_signal_126 <= (rvx_signal_073==`RVX_GDEF_540);
    rvx_signal_110 <= (rvx_signal_073==`RVX_GDEF_548) | (rvx_signal_073==`RVX_GDEF_280);
    rvx_signal_065 <= (rvx_signal_073==`RVX_GDEF_322) | (rvx_signal_073==`RVX_GDEF_033);
  end
end

assign rvx_signal_010 = rvx_signal_009 & rvx_signal_004;
assign rvx_signal_050 = (rvx_signal_038==`RVX_GDEF_607) & rvx_signal_010;
assign rvx_signal_070 = (rvx_signal_038==`RVX_GDEF_083) & rvx_signal_010;

always@(*)
begin
  rvx_signal_082 = 0;
  case(rvx_signal_038)
    `RVX_GDEF_193:
      case(rvx_signal_000)
        `RVX_GDEF_548,
        `RVX_GDEF_280:
          rvx_signal_082 = (rvx_signal_012==3);
        `RVX_GDEF_033:
          if(INCLUDE_DIVIDER)
            rvx_signal_082 = rvx_signal_026;
          else
            rvx_signal_082 = (rvx_signal_012==2);
        default:
          rvx_signal_082 = (rvx_signal_012==2);
      endcase
  endcase
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_00)
)
i_rvx_instance_11
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(1'b 1),
	.init(rvx_signal_044),
  .count(rvx_signal_085),
	.value(rvx_signal_043),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_044 = rvx_signal_068 | rvx_signal_087;
assign rvx_signal_085 = rvx_signal_070 | rvx_signal_042;

always@(*)
begin
  rvx_signal_056 = ((1'b 1) << 0);
  case(rvx_signal_000)
    `RVX_GDEF_540:
      rvx_signal_056 = ((1'b 1) << 0);
    `RVX_GDEF_548,
    `RVX_GDEF_280:
      rvx_signal_056 = ((1'b 1) << 1);
    `RVX_GDEF_322:
      rvx_signal_056 = ((1'b 1) << 3);
    `RVX_GDEF_033:
      if(INCLUDE_DIVIDER)
        rvx_signal_056 = ((1'b 1) << 1);
      else
        rvx_signal_056 = ((1'b 1) << 3);
  endcase
end

assign rvx_signal_042 = (rvx_signal_038==`RVX_GDEF_225) & rvx_signal_113;
assign rvx_signal_068 = rvx_signal_070 & (rvx_signal_043==rvx_signal_056);

always@(*)
begin
  rvx_signal_022 = ((1'b 1) << 0);
  case(rvx_signal_128)
    `RVX_GDEF_364:
      rvx_signal_022 = ((1'b 1) << 1);
  endcase
end

assign rvx_signal_087 = rvx_signal_042 & (rvx_signal_043==rvx_signal_022);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_105 <= 0;
    rvx_signal_058 <= 0;
    rvx_signal_089 <= 0;
  end
  else
  begin
    rvx_signal_105 <= rvx_signal_070;
    if(rvx_signal_070)
    begin
      rvx_signal_058 <= rvx_signal_014;
      rvx_signal_089 <= rvx_signal_043;
    end
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_094 <= 0;
  else if(rvx_signal_084)
    rvx_signal_094 <= rvx_signal_058;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_127 <= 0;
  else if(rvx_signal_112)
    rvx_signal_127 <= rvx_signal_058;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_129 <= 0;
  else if(rvx_signal_090)
    case(rvx_signal_057)
      `RVX_GDEF_051:
        rvx_signal_129 <= rvx_signal_058[32-1];
      default:
        rvx_signal_129 <= 0;
    endcase
end
assign rvx_signal_090 = rvx_signal_084 | rvx_signal_112;

assign rvx_signal_034 = rvx_signal_129;
assign rvx_signal_037 = rvx_signal_034? ((~rvx_signal_094)+1'b 1) : rvx_signal_094;
assign rvx_signal_077 = {rvx_signal_127,rvx_signal_094};
assign rvx_signal_124 = {rvx_signal_127,rvx_signal_094};

RVX_MODULE_093
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_08
(
	.rvx_port_3(clk),
	.rvx_port_1(rstnn),
	.rvx_port_0(1'b 1),

	.rvx_port_2(rvx_signal_105),
	.rvx_port_5(rvx_signal_058),
  .rvx_port_4(),
	.rvx_port_6(rvx_signal_053)	
);

assign rvx_signal_102 = rvx_signal_064;

assign {rvx_signal_104, rvx_signal_107, rvx_signal_013, rvx_signal_018, rvx_signal_032, rvx_signal_074} = rvx_signal_102;

RVX_MODULE_018
#(
  .RVX_GPARA_0(RVX_LPARA_12),
  .RVX_GPARA_1(24)
)
i_rvx_instance_09
(
	.rvx_port_0({rvx_signal_018,rvx_signal_032}),
	.rvx_port_1(rvx_signal_020)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_071 <= 0;
  else if(rvx_signal_108)
    rvx_signal_071 <= rvx_signal_102;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_005 <= 0;
  else if(rvx_signal_096)
    rvx_signal_005 <= rvx_signal_102;
end

always@(*)
begin
  rvx_signal_084 = 0;
  rvx_signal_112 = 0;
  rvx_signal_108 = 0;
  rvx_signal_096 = 0;
  if(rvx_signal_105)
    case(rvx_signal_000)
      `RVX_GDEF_540:
      begin
        rvx_signal_084 = rvx_signal_089[0];
        rvx_signal_112 = rvx_signal_089[1];
      end
      `RVX_GDEF_548,
      `RVX_GDEF_280:
      begin
        rvx_signal_108 = rvx_signal_089[0];
        rvx_signal_096 = rvx_signal_089[1];
      end
      `RVX_GDEF_322,
      `RVX_GDEF_033:
      begin
        rvx_signal_108 = rvx_signal_089[0];
        rvx_signal_096 = rvx_signal_089[1];
        rvx_signal_084 = rvx_signal_089[2];
        rvx_signal_112 = rvx_signal_089[3];
      end
    endcase
end

always@(*)
begin
  rvx_signal_062 = rvx_signal_109;
  rvx_signal_048 = rvx_signal_028;
  rvx_signal_066 = rvx_signal_006;
  if(rvx_signal_065)
  begin
    rvx_signal_062 = rvx_signal_099;
    rvx_signal_048 = rvx_signal_025;
    rvx_signal_066 = rvx_signal_030;
  end
end

assign rvx_signal_122 = rvx_signal_062 + rvx_signal_048 + rvx_signal_066;

RVX_MODULE_094
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06),
  .RVX_GPARA_0(1)
)
i_rvx_instance_05
(
	.rvx_port_01(clk),
	.rvx_port_00(rstnn),
	.rvx_port_07(1'b 1),

	.rvx_port_02(rvx_signal_086),
  .rvx_port_04(rvx_signal_055),
  .rvx_port_06(rvx_signal_061),

  .rvx_port_05(rvx_signal_008),
  .rvx_port_08(rvx_signal_114),
  .rvx_port_03(rvx_signal_080),
	.rvx_port_09(rvx_signal_092)
);

assign rvx_signal_086 = rvx_signal_071;
assign rvx_signal_055 = rvx_signal_005;
assign rvx_signal_061 = rvx_signal_000[`RVX_GDEF_215];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_016 <= 0;
    rvx_signal_015 <= 0;
    rvx_signal_001 <= 0;
    rvx_signal_059 <= 0;
  end
  else if((rvx_signal_038==`RVX_GDEF_193) && (rvx_signal_012==2))
  begin
    rvx_signal_016 <= rvx_signal_008;
    rvx_signal_015 <= rvx_signal_114;
    rvx_signal_001 <= rvx_signal_080;
    rvx_signal_059 <= rvx_signal_092;
  end
end

RVX_MODULE_022
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06),
  .RVX_GPARA_0(RVX_LPARA_02)
)
i_rvx_instance_10
(
  .rvx_port_08(rvx_signal_016),
  .rvx_port_06(rvx_signal_015),
  .rvx_port_07(rvx_signal_001),
	.rvx_port_04(rvx_signal_059),
  
  .rvx_port_01(rvx_signal_109),
  .rvx_port_05(rvx_signal_028),
  .rvx_port_02(rvx_signal_006),
  .rvx_port_03(rvx_signal_123),

  .rvx_port_00(rvx_signal_100),
  .rvx_port_09(rvx_signal_036)
);

assign rvx_signal_123 = rvx_signal_122;

RVX_MODULE_069
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06),
  .RVX_GPARA_0(RVX_LPARA_02),
  .RVX_GPARA_4(RVX_LPARA_11),
  .RVX_GPARA_2(RVX_LPARA_08),
  .RVX_GPARA_3(RVX_LPARA_10),
  .RVX_GPARA_1(0)
)
i_rvx_instance_01
(
	.rvx_port_06(rvx_signal_052),
  .rvx_port_02(rvx_signal_103),
  .rvx_port_00(rvx_signal_076),

  .rvx_port_11(rvx_signal_046),
  .rvx_port_04(rvx_signal_106),
  .rvx_port_13(rvx_signal_029),

  .rvx_port_09(rvx_signal_111),
  .rvx_port_10(rvx_signal_047),
  .rvx_port_01(rvx_signal_041),

  .rvx_port_05(rvx_signal_099),
  .rvx_port_08(rvx_signal_025),
  .rvx_port_07(rvx_signal_030),
  .rvx_port_12(rvx_signal_101),

	.rvx_port_03(rvx_signal_051)
);

assign rvx_signal_052 = rvx_signal_071;
assign rvx_signal_103 = rvx_signal_005;
assign rvx_signal_076 = rvx_signal_000[`RVX_GDEF_266];
assign rvx_signal_101 = rvx_signal_122;
assign rvx_signal_029 = rvx_signal_077;
assign rvx_signal_041 = (INCLUDE_DIVIDER==1)? rvx_signal_063 : rvx_signal_124;

RVX_MODULE_118
#(
  .RVX_GPARA_0(RVX_LPARA_05),
  .RVX_GPARA_1(RVX_LPARA_10)
)
i_rvx_instance_06
(
  .rvx_port_00(clk),
  .rvx_port_02(rstnn),
  .rvx_port_05((INCLUDE_DIVIDER==1)),

  .rvx_port_08(rvx_signal_021),
  .rvx_port_10(rvx_signal_078),
	.rvx_port_06(rvx_signal_054),
	.rvx_port_04(rvx_signal_023),
  .rvx_port_01(rvx_signal_116),
  .rvx_port_09(rvx_signal_039),
	.rvx_port_07(rvx_signal_063),
  .rvx_port_03()
);

assign rvx_signal_021 = (rvx_signal_038==`RVX_GDEF_193) & (rvx_signal_012==2) & (rvx_signal_000==`RVX_GDEF_033);
assign rvx_signal_054 = rvx_signal_111;
assign rvx_signal_023 = rvx_signal_047;
assign rvx_signal_039 = 1;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_026 <= 0;
  else
    rvx_signal_026 <= rvx_signal_116;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_093 <= 0;
  else if(rvx_signal_038==`RVX_GDEF_193)
    rvx_signal_093 <= rvx_signal_051;
end

assign rvx_signal_098 = `FPIR_TYPE_NORMAL;
assign rvx_signal_117 = rvx_signal_034;
assign rvx_signal_033 = RVX_LPARA_13-1;
assign rvx_signal_007 = 0;

RVX_MODULE_018
#(
  .RVX_GPARA_0(RVX_LPARA_13),
  .RVX_GPARA_1(RVX_LPARA_12)
)
i_rvx_instance_04
(
	.rvx_port_0(rvx_signal_037),
	.rvx_port_1({rvx_signal_027,rvx_signal_002})
);

assign rvx_signal_097 = {rvx_signal_098, rvx_signal_117, rvx_signal_033, rvx_signal_027, rvx_signal_002, rvx_signal_007};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_119 <= 0;
  else if(rvx_signal_082)
    rvx_signal_119 <= rvx_signal_019;
end

always@(*)
begin
  rvx_signal_019 = 0;
  if(rvx_signal_126)
    rvx_signal_019 = rvx_signal_097;
  else if(rvx_signal_110)
    rvx_signal_019 = rvx_signal_100;
  else if(rvx_signal_065)
    rvx_signal_019 = rvx_signal_093;
end

RVX_MODULE_127
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06)
)
i_rvx_instance_12
(
  .rvx_port_0(rvx_signal_115),
  .rvx_port_1(rvx_signal_064)
);

assign rvx_signal_115 = rvx_signal_105? rvx_signal_053 : rvx_signal_119;

assign rvx_signal_011 = rvx_signal_064;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_130 <= 0;
  else if(rvx_signal_038==`RVX_GDEF_378)
    rvx_signal_130 <= rvx_signal_011;
end

RVX_MODULE_120
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA),
  .RVX_GPARA_0(2)
)
i_rvx_instance_07
(
	.rvx_port_4(clk),
	.rvx_port_6(rstnn),
	.rvx_port_2(1'b 1),

	.rvx_port_5(1'b 1),
	.rvx_port_3(rvx_signal_130),
	.rvx_port_1(),
	.rvx_port_0(rvx_signal_088)
);

RVX_MODULE_120
#(
  .BW_EXPONENT(RVX_LPARA_01),
  .BW_SIGNIFICAND(RVX_LPARA_05),
  .BW_GUARD(RVX_LPARA_03),
  .BW_OVERFLOW(RVX_LPARA_06),
  .BW_IEEE_EXPONENT(BW_IEEEDP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEEDP_MANTISSA),
  .RVX_GPARA_0(2)
)
i_rvx_instance_00
(
	.rvx_port_4(clk),
	.rvx_port_6(rstnn),
	.rvx_port_2(1'b 1),

	.rvx_port_5(1'b 1),
	.rvx_port_3(rvx_signal_130),
	.rvx_port_1(),
	.rvx_port_0(rvx_signal_121)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_017 <= 0;
  else if((rvx_signal_038==`RVX_GDEF_570) && (rvx_signal_045==2))
    case(rvx_signal_128)
      `RVX_GDEF_111:
        rvx_signal_017 <= rvx_signal_088;
      `RVX_GDEF_364:
        rvx_signal_017 <= rvx_signal_121;
    endcase
end

endmodule
