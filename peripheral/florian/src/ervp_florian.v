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
`include "ervp_endian.vh"
`include "rvx_include_10.vh"
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



`include "rvx_include_19.vh"
`include "rvx_include_07.vh"

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

localparam  RVX_LPARA_03 = (SUPPORT_DOUBLE? BW_IEEEDP_EXPONENT : BW_IEEESP_EXPONENT) + 1;
localparam  RVX_LPARA_00 = (SUPPORT_DOUBLE? BW_IEEEDP_SIGNIFICAND : BW_IEEESP_SIGNIFICAND);
localparam  RVX_LPARA_11 = `MAX((48-RVX_LPARA_00),3);
localparam  RVX_LPARA_12 = 2;

localparam  RVX_LPARA_05 = `BW_FPIR_TYPE + 1 + RVX_LPARA_03 + RVX_LPARA_00 + RVX_LPARA_11 + RVX_LPARA_12;

localparam  RVX_LPARA_04 = RVX_LPARA_00 + RVX_LPARA_11;
localparam  RVX_LPARA_01 = RVX_LPARA_03 + RVX_LPARA_12;

wire rvx_signal_040;
wire rvx_signal_076;
wire rvx_signal_050;
wire [BW_DATA-1:0] rvx_signal_090;
wire rvx_signal_059;
wire rvx_signal_007;
wire [BW_DATA-1:0] rvx_signal_044;
reg  rvx_signal_099;
wire [32-1:0] rvx_signal_082;
wire rvx_signal_103;

wire rvx_signal_084;
wire rvx_signal_052;
wire rvx_signal_041;
wire [BW_DATA-1:0] rvx_signal_031;
wire rvx_signal_049;
wire rvx_signal_073;
wire [BW_DATA-1:0] rvx_signal_012;
reg  rvx_signal_022;
reg  [32-1:0] rvx_signal_110;
wire rvx_signal_112;

reg [`RVX_GDEF_370-1:0] rvx_signal_013;
reg [`RVX_GDEF_141-1:0] rvx_signal_075;
reg [`RVX_GDEF_101-1:0] rvx_signal_067;
reg [`RVX_GDEF_101-1:0] rvx_signal_054;
wire rvx_signal_062;
wire rvx_signal_020;
wire rvx_signal_047;
wire rvx_signal_051;
reg  rvx_signal_113;
wire rvx_signal_093;
wire rvx_signal_039;

localparam  RVX_LPARA_02 = 4;

wire rvx_signal_004;
wire rvx_signal_104;
wire [RVX_LPARA_02-1:0] rvx_signal_046;
reg [RVX_LPARA_02-1:0] rvx_signal_016;
reg [RVX_LPARA_02-1:0] rvx_signal_000;

reg [32-1:0] rvx_signal_001;
reg rvx_signal_032;
reg [32-1:0] rvx_signal_079;
reg rvx_signal_053;
reg rvx_signal_019;
wire rvx_signal_101;

localparam  RVX_LPARA_10 = 32;

wire rvx_signal_029;
wire [RVX_LPARA_10-1:0] rvx_signal_094;

wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_089;
wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_102;

wire [RVX_LPARA_05-1:0] rvx_signal_074;
wire [RVX_LPARA_05-1:0] rvx_signal_065;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_021;
wire rvx_signal_042;
wire [RVX_LPARA_03-1:0] rvx_signal_058;
wire [RVX_LPARA_00-1:0] rvx_signal_095;
wire [RVX_LPARA_11-1:0] rvx_signal_063;
wire [RVX_LPARA_12-1:0] rvx_signal_028;

wire [24-1:0] rvx_signal_025;

reg [RVX_LPARA_05-1:0] rvx_signal_015;
reg rvx_signal_035;

reg [RVX_LPARA_05-1:0] rvx_signal_005;
reg rvx_signal_043;

localparam  RVX_LPARA_08 = RVX_LPARA_04 + 1;

reg [RVX_LPARA_08-1:0] rvx_signal_111;
reg [RVX_LPARA_08-1:0] rvx_signal_033;
reg rvx_signal_024;
wire [RVX_LPARA_08-1:0] rvx_signal_036;

wire [RVX_LPARA_05-1:0] rvx_signal_071;
wire [RVX_LPARA_05-1:0] rvx_signal_098;
wire rvx_signal_105;
wire [RVX_LPARA_05-1:0] rvx_signal_027;
wire [RVX_LPARA_05-1:0] rvx_signal_010;
wire rvx_signal_106;
wire [RVX_LPARA_05-1:0] rvx_signal_069;
wire [RVX_LPARA_08-1:0] rvx_signal_114;
wire [RVX_LPARA_08-1:0] rvx_signal_086;
wire rvx_signal_034;
wire [RVX_LPARA_08-1:0] rvx_signal_018;
wire [RVX_LPARA_05-1:0] rvx_signal_070;
wire rvx_signal_060;

localparam  RVX_LPARA_13 = RVX_LPARA_00;
localparam  RVX_LPARA_06 = RVX_LPARA_00;
localparam  RVX_LPARA_09 = 2*RVX_LPARA_00;

wire [RVX_LPARA_05-1:0] rvx_signal_002;
wire [RVX_LPARA_05-1:0] rvx_signal_107;
wire rvx_signal_066;
wire [RVX_LPARA_13-1:0] rvx_signal_087;
wire [RVX_LPARA_13-1:0] rvx_signal_097;
wire [2*RVX_LPARA_13-1:0] rvx_signal_023;
wire [RVX_LPARA_06-1:0] rvx_signal_038;
wire [RVX_LPARA_06-1:0] rvx_signal_030;
wire [RVX_LPARA_09-1:0] rvx_signal_092;
wire [RVX_LPARA_08-1:0] rvx_signal_037;
wire [RVX_LPARA_08-1:0] rvx_signal_045;
wire rvx_signal_072;
wire [RVX_LPARA_08-1:0] rvx_signal_109;
wire [RVX_LPARA_05-1:0] rvx_signal_017;

wire rvx_signal_003;
wire rvx_signal_056;
wire [RVX_LPARA_00-1:0] rvx_signal_068;
wire [RVX_LPARA_00-1:0] rvx_signal_011;
wire rvx_signal_100;
wire rvx_signal_078;
wire [RVX_LPARA_09-1:0] rvx_signal_077;

wire [RVX_LPARA_05-1:0] rvx_signal_096;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_091;
wire rvx_signal_108;
wire [RVX_LPARA_03-1:0] rvx_signal_085;
wire [RVX_LPARA_00-1:0] rvx_signal_008;
wire [RVX_LPARA_11-1:0] rvx_signal_055;
wire [RVX_LPARA_12-1:0] rvx_signal_006;

wire [RVX_LPARA_05-1:0] rvx_signal_064;
wire [RVX_LPARA_05-1:0] rvx_signal_057;

wire [RVX_LPARA_05-1:0] rvx_signal_014;
wire [RVX_LPARA_05-1:0] rvx_signal_080;

reg [RVX_LPARA_05-1:0] rvx_signal_048;
reg [RVX_LPARA_05-1:0] rvx_signal_088;
reg [RVX_LPARA_05-1:0] rvx_signal_115;
wire [BW_IEEESP_VALUE-1:0] rvx_signal_026;
wire [BW_IEEEDP_VALUE-1:0] rvx_signal_061;

localparam  RVX_LPARA_07 = RVX_LPARA_02;

reg [RVX_LPARA_07*BW_DATA-1:0] rvx_signal_083;

wire [32-1:0] rvx_signal_081;
reg  [32-1:0] rvx_signal_009;

RVX_MODULE_035
#(
  .RVX_GPARA_0(BW_ADDR),
  .RVX_GPARA_2(BW_DATA),
  .RVX_GPARA_1(ENDIAN_TYPE)
)
i_rvx_instance_00
(
	.rvx_port_18(clk),
	.rvx_port_25(rstnn),

	.rvx_port_02(rpsel),
	.rvx_port_03(rpenable),
	.rvx_port_14(rpaddr),
	.rvx_port_01(rpwrite),
	.rvx_port_20(rpwdata),
	.rvx_port_11(rprdata),
	.rvx_port_13(rpready),
	.rvx_port_12(rpslverr),

	.rvx_port_30(1'b 0),
  .rvx_port_26(rvx_signal_040),
	.rvx_port_07(rvx_signal_059),
	.rvx_port_21(rvx_signal_007),
	.rvx_port_04(rvx_signal_044),
	.rvx_port_15(rvx_signal_099),
	.rvx_port_17(rvx_signal_082),
	.rvx_port_29(rvx_signal_076),
	.rvx_port_27(rvx_signal_050),
	.rvx_port_00(rvx_signal_090),
	.rvx_port_09(rvx_signal_103),
	.rvx_port_23(rvx_signal_084),
	.rvx_port_10(rvx_signal_052),
	.rvx_port_24(rvx_signal_041),
	.rvx_port_16(rvx_signal_031),
	.rvx_port_28(rvx_signal_049),
	.rvx_port_08(rvx_signal_073),
	.rvx_port_06(rvx_signal_012),
	.rvx_port_05(rvx_signal_022),
	.rvx_port_22(rvx_signal_110),
	.rvx_port_19(rvx_signal_112)
);

assign rvx_signal_040 = 0;
assign rvx_signal_103 = ~rvx_signal_050;
assign rvx_signal_084 = 0;
assign rvx_signal_112 = ~rvx_signal_041;

always@(*)
begin
  rvx_signal_099 = 0;
  case(rvx_signal_013)
    `RVX_GDEF_518:
      rvx_signal_099 = 1;
    `RVX_GDEF_575:
      rvx_signal_099 = 1;
  endcase
end

always@(*)
begin
  rvx_signal_022 = 0;
  case(rvx_signal_013)
    `RVX_GDEF_575:
      case(rvx_signal_075)
        `RVX_GDEF_269:
          rvx_signal_022 = rvx_signal_035 | rvx_signal_043;
        `RVX_GDEF_344:
          if(INCLUDE_DIVIDER==0)
            rvx_signal_022 = rvx_signal_035 | rvx_signal_043;
      endcase
    `RVX_GDEF_461:
      rvx_signal_022 = 1;
  endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_07)
)
i_rvx_instance_03
(
	.data_input_list(rvx_signal_083),
	.select(rvx_signal_046[RVX_LPARA_07-1:0]),
	.data_output(rvx_signal_081)
);

always@(*)
begin
  rvx_signal_009 = $unsigned(rvx_signal_025);
  case(rvx_signal_075)
    `RVX_GDEF_269,
    `RVX_GDEF_344:
      rvx_signal_009 = $unsigned(rvx_signal_025);
  endcase
end

always@(*)
begin
  rvx_signal_110 = rvx_signal_081;
  case(rvx_signal_013)
    `RVX_GDEF_575:
      rvx_signal_110 = rvx_signal_009;
    `RVX_GDEF_461:
      rvx_signal_110 = rvx_signal_081;
  endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_013 <= `RVX_GDEF_518;
  else
    case(rvx_signal_013)
      `RVX_GDEF_518:
        if(rvx_signal_020)
          rvx_signal_013 <= `RVX_GDEF_575;
      `RVX_GDEF_575:
        if(rvx_signal_051)
          rvx_signal_013 <= `RVX_GDEF_265;
      `RVX_GDEF_265:
        if(rvx_signal_113)
          rvx_signal_013 <= `RVX_GDEF_035;
      `RVX_GDEF_035:
        rvx_signal_013 <= `RVX_GDEF_142;
      `RVX_GDEF_142:
        rvx_signal_013 <= `RVX_GDEF_461;
      `RVX_GDEF_461:
        if(rvx_signal_039)
          rvx_signal_013 <= `RVX_GDEF_518;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  {rvx_signal_075,rvx_signal_067,rvx_signal_054} <= 0;
  else if(rvx_signal_020)
    {rvx_signal_075,rvx_signal_067,rvx_signal_054} <= rvx_signal_082;
end

assign rvx_signal_062 = rvx_signal_059 & rvx_signal_099;
assign rvx_signal_020 = (rvx_signal_013==`RVX_GDEF_518) & rvx_signal_062;
assign rvx_signal_047 = (rvx_signal_013==`RVX_GDEF_575) & rvx_signal_062;

always@(*)
begin
  rvx_signal_113 = 0;
  case(rvx_signal_013)
    `RVX_GDEF_265:
      if(rvx_signal_075==`RVX_GDEF_344)
      begin
        if(INCLUDE_DIVIDER)
          rvx_signal_113 = rvx_signal_100;
        else
          rvx_signal_113 = 1;
      end
      else
        rvx_signal_113 = 1;
  endcase
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_02)
)
i_rvx_instance_10
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(1'b 1),
	.init(rvx_signal_004),
  .count(rvx_signal_104),
	.value(rvx_signal_046),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_004 = rvx_signal_051 | rvx_signal_039;
assign rvx_signal_104 = rvx_signal_047 | rvx_signal_093;

always@(*)
begin
  rvx_signal_016 = ((1'b 1) << 0);
  case(rvx_signal_075)
    `RVX_GDEF_614:
      rvx_signal_016 = ((1'b 1) << 0);
    `RVX_GDEF_078,
    `RVX_GDEF_087:
      rvx_signal_016 = ((1'b 1) << 1);
    `RVX_GDEF_269:
      rvx_signal_016 = ((1'b 1) << 3);
    `RVX_GDEF_344:
      if(INCLUDE_DIVIDER)
        rvx_signal_016 = ((1'b 1) << 1);
      else
        rvx_signal_016 = ((1'b 1) << 3);
  endcase
end

assign rvx_signal_093 = (rvx_signal_013==`RVX_GDEF_461) & rvx_signal_022;
assign rvx_signal_051 = rvx_signal_047 & (rvx_signal_046==rvx_signal_016);

always@(*)
begin
  rvx_signal_000 = ((1'b 1) << 0);
  case(rvx_signal_054)
    `RVX_GDEF_420:
      rvx_signal_000 = ((1'b 1) << 1);
  endcase
end

assign rvx_signal_039 = rvx_signal_093 & (rvx_signal_046==rvx_signal_000);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_001 <= 0;
  else if(rvx_signal_032)
    rvx_signal_001 <= rvx_signal_082;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_079 <= 0;
  else if(rvx_signal_053)
    rvx_signal_079 <= rvx_signal_082;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_019 <= 0;
  else if(rvx_signal_101)
    case(rvx_signal_067)
      `RVX_GDEF_133:
        rvx_signal_019 <= rvx_signal_082[32-1];
      default:
        rvx_signal_019 <= 0;
    endcase
end
assign rvx_signal_101 = rvx_signal_032 | rvx_signal_053;

assign rvx_signal_029 = rvx_signal_019;
assign rvx_signal_094 = rvx_signal_029? ((~rvx_signal_001)+1'b 1) : rvx_signal_001;
assign rvx_signal_089 = {rvx_signal_079,rvx_signal_001};
assign rvx_signal_102 = {rvx_signal_079,rvx_signal_001};

RVX_MODULE_066
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_11
(
	.rvx_port_6(clk),
	.rvx_port_2(rstnn),
	.rvx_port_3(1'b 1),

	.rvx_port_5(rvx_signal_059 & (rvx_signal_013==`RVX_GDEF_575)),
	.rvx_port_4(rvx_signal_082),
  .rvx_port_1(),
	.rvx_port_0(rvx_signal_074)	
);

assign rvx_signal_065 = rvx_signal_057;

assign {rvx_signal_021, rvx_signal_042, rvx_signal_058, rvx_signal_095, rvx_signal_063, rvx_signal_028} = rvx_signal_065;

RVX_MODULE_137
#(
  .RVX_GPARA_1(RVX_LPARA_04),
  .RVX_GPARA_0(24)
)
i_rvx_instance_08
(
	.rvx_port_1({rvx_signal_095,rvx_signal_063}),
	.rvx_port_0(rvx_signal_025)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_015 <= 0;
  else if(rvx_signal_035)
    rvx_signal_015 <= rvx_signal_065;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_005 <= 0;
  else if(rvx_signal_043)
    rvx_signal_005 <= rvx_signal_065;
end

always@(*)
begin
  rvx_signal_032 = 0;
  rvx_signal_053 = 0;
  rvx_signal_035 = 0;
  rvx_signal_043 = 0;
  if(rvx_signal_047)
    case(rvx_signal_075)
      `RVX_GDEF_614:
      begin
        rvx_signal_032 = rvx_signal_046[0];
        rvx_signal_053 = rvx_signal_046[1];
      end
      `RVX_GDEF_078,
      `RVX_GDEF_087:
      begin
        rvx_signal_035 = rvx_signal_046[0];
        rvx_signal_043 = rvx_signal_046[1];
      end
      `RVX_GDEF_269,
      `RVX_GDEF_344:
      begin
        rvx_signal_035 = rvx_signal_046[0];
        rvx_signal_043 = rvx_signal_046[1];
        rvx_signal_032 = rvx_signal_046[2];
        rvx_signal_053 = rvx_signal_046[3];
      end
    endcase
end

always@(*)
begin
  rvx_signal_111 = rvx_signal_114;
  rvx_signal_033 = rvx_signal_086;
  rvx_signal_024 = rvx_signal_034;
   case(rvx_signal_075)
      `RVX_GDEF_078,
      `RVX_GDEF_087:
      begin
        rvx_signal_111 = rvx_signal_114;
        rvx_signal_033 = rvx_signal_086;
        rvx_signal_024 = rvx_signal_034;
      end
      `RVX_GDEF_269,
      `RVX_GDEF_344:
      begin
        rvx_signal_111 = rvx_signal_037;
        rvx_signal_033 = rvx_signal_045;
        rvx_signal_024 = rvx_signal_072;
      end
   endcase
end

assign rvx_signal_036 = rvx_signal_111 + rvx_signal_033 + rvx_signal_024;

RVX_MODULE_114
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12)
)
i_rvx_instance_01
(
	.rvx_port_3(rvx_signal_071),
  .rvx_port_1(rvx_signal_098),
  .rvx_port_0(rvx_signal_105),

  .rvx_port_6(rvx_signal_027),
  .rvx_port_2(rvx_signal_010),
  .rvx_port_4(rvx_signal_106),
	.rvx_port_5(rvx_signal_069)
);

assign rvx_signal_071 = rvx_signal_015;
assign rvx_signal_098 = rvx_signal_005;
assign rvx_signal_105 = rvx_signal_075[`RVX_GDEF_295];

RVX_MODULE_056
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12),
  .RVX_GPARA_0(RVX_LPARA_08)
)
i_rvx_instance_06
(
  .rvx_port_09(rvx_signal_027),
  .rvx_port_02(rvx_signal_010),
  .rvx_port_00(rvx_signal_106),
	.rvx_port_04(rvx_signal_069),
  
  .rvx_port_01(rvx_signal_114),
  .rvx_port_08(rvx_signal_086),
  .rvx_port_05(rvx_signal_034),
  .rvx_port_03(rvx_signal_018),

  .rvx_port_06(rvx_signal_070),
  .rvx_port_07(rvx_signal_060)
);

assign rvx_signal_018 = rvx_signal_036;

RVX_MODULE_073
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12),
  .RVX_GPARA_2(RVX_LPARA_08),
  .RVX_GPARA_3(RVX_LPARA_13),
  .RVX_GPARA_0(RVX_LPARA_06),
  .RVX_GPARA_4(RVX_LPARA_09),
  .RVX_GPARA_1(0)
)
i_rvx_instance_07
(
	.rvx_port_00(rvx_signal_002),
  .rvx_port_06(rvx_signal_107),
  .rvx_port_03(rvx_signal_066),

  .rvx_port_13(rvx_signal_087),
  .rvx_port_10(rvx_signal_097),
  .rvx_port_07(rvx_signal_023),

  .rvx_port_01(rvx_signal_038),
  .rvx_port_08(rvx_signal_030),
  .rvx_port_11(rvx_signal_092),

  .rvx_port_12(rvx_signal_037),
  .rvx_port_02(rvx_signal_045),
  .rvx_port_09(rvx_signal_072),
  .rvx_port_04(rvx_signal_109),

	.rvx_port_05(rvx_signal_017)
);

assign rvx_signal_002 = rvx_signal_015;
assign rvx_signal_107 = rvx_signal_005;
assign rvx_signal_066 = rvx_signal_075[`RVX_GDEF_136];
assign rvx_signal_109 = rvx_signal_036;
assign rvx_signal_023 = rvx_signal_089;
assign rvx_signal_092 = (INCLUDE_DIVIDER==1)? rvx_signal_077 : rvx_signal_102;

RVX_MODULE_092
#(
  .RVX_GPARA_1(RVX_LPARA_00),
  .RVX_GPARA_0(RVX_LPARA_09)
)
i_rvx_instance_09
(
  .rvx_port_02(clk),
  .rvx_port_00(rstnn),
  .rvx_port_09((INCLUDE_DIVIDER==1)),

  .rvx_port_04(rvx_signal_003),
  .rvx_port_07(rvx_signal_056),
	.rvx_port_03(rvx_signal_068),
	.rvx_port_06(rvx_signal_011),
  .rvx_port_01(rvx_signal_100),
  .rvx_port_10(rvx_signal_078),
	.rvx_port_05(rvx_signal_077),
  .rvx_port_08()
);

assign rvx_signal_003 = (rvx_signal_013==`RVX_GDEF_265) & (rvx_signal_075==`RVX_GDEF_344);
assign rvx_signal_068 = rvx_signal_038;
assign rvx_signal_011 = rvx_signal_030;
assign rvx_signal_078 = 1;

assign rvx_signal_091 = `FPIR_TYPE_NORMAL;
assign rvx_signal_108 = rvx_signal_029;
assign rvx_signal_085 = RVX_LPARA_10-1;
assign rvx_signal_006 = 0;

RVX_MODULE_137
#(
  .RVX_GPARA_1(RVX_LPARA_10),
  .RVX_GPARA_0(RVX_LPARA_04)
)
i_rvx_instance_12
(
	.rvx_port_1(rvx_signal_094),
	.rvx_port_0({rvx_signal_008,rvx_signal_055})
);

assign rvx_signal_096 = {rvx_signal_091, rvx_signal_108, rvx_signal_085, rvx_signal_008, rvx_signal_055, rvx_signal_006};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_088 <= 0;
  else if(rvx_signal_113)
    rvx_signal_088 <= rvx_signal_048;
end

always@(*)
begin
  rvx_signal_048 = 0;
  case(rvx_signal_075)
    `RVX_GDEF_614:
      rvx_signal_048 = rvx_signal_096;
    `RVX_GDEF_078,
    `RVX_GDEF_087:
      rvx_signal_048 = rvx_signal_070;
    `RVX_GDEF_269,
    `RVX_GDEF_344:
      rvx_signal_048 = rvx_signal_017;
  endcase
end

RVX_MODULE_119
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12)
)
i_rvx_instance_02
(
  .rvx_port_1(rvx_signal_064),
  .rvx_port_0(rvx_signal_057)
);

assign rvx_signal_064 = (rvx_signal_013==`RVX_GDEF_575)? rvx_signal_074 : rvx_signal_088;

assign rvx_signal_080 = rvx_signal_057;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_115 <= 0;
  else if(rvx_signal_013==`RVX_GDEF_035)
    rvx_signal_115 <= rvx_signal_080;
end

RVX_MODULE_115
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_04
(
	.rvx_port_2(clk),
	.rvx_port_4(rstnn),
	.rvx_port_5(1'b 1),

	.rvx_port_0(1'b 1),
	.rvx_port_6(rvx_signal_115),
	.rvx_port_1(),
	.rvx_port_3(rvx_signal_026)
);

RVX_MODULE_115
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_11),
  .BW_OVERFLOW(RVX_LPARA_12),
  .BW_IEEE_EXPONENT(BW_IEEEDP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEEDP_MANTISSA)
)
i_rvx_instance_05
(
	.rvx_port_2(clk),
	.rvx_port_4(rstnn),
	.rvx_port_5(1'b 1),

	.rvx_port_0(1'b 1),
	.rvx_port_6(rvx_signal_115),
	.rvx_port_1(),
	.rvx_port_3(rvx_signal_061)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_083 <= 0;
  else if(rvx_signal_013==`RVX_GDEF_142)
    case(rvx_signal_054)
      `RVX_GDEF_621:
        rvx_signal_083 <= rvx_signal_026;
      `RVX_GDEF_420:
        rvx_signal_083 <= rvx_signal_061;
    endcase
end

endmodule
