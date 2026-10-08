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
`include "rvx_include_15.vh"




module RVX_MODULE_089
(
	rvx_port_06,
	rvx_port_04,

	rvx_port_11,
	rvx_port_09,
	rvx_port_00,
	rvx_port_13,
	rvx_port_03,
	rvx_port_08,
	rvx_port_01,
	rvx_port_05,

	rvx_port_10,
	rvx_port_02,
	rvx_port_14,
	rvx_port_12,
	rvx_port_07
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_06, rvx_port_04;
input wire rvx_port_11;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_00;
input wire rvx_port_13;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire [RVX_GPARA_2-1:0] rvx_port_08;
output reg rvx_port_01;
output reg rvx_port_05;

input wire rvx_port_10;

output wire [8-1:0] rvx_port_02;

output wire [(32)*(8)-1:0] rvx_port_14;

output wire [(32)*(8)-1:0] rvx_port_12;

output wire [(32)*(8)-1:0] rvx_port_07;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_081;
reg [RVX_GPARA_2-1:0] rvx_signal_010;
wire rvx_signal_031;
wire rvx_signal_001;
wire rvx_signal_123;

wire [`RVX_GDEF_234-1:0] paddr_offset = rvx_port_00;
wire [`RVX_GDEF_234-1:0] rvx_signal_045;
wire [RVX_GPARA_0-1:0] rvx_signal_043;
wire [`RVX_GDEF_230-1:0] rvx_signal_029;
wire [`RVX_GDEF_230-1:0] addr_unused = 0;
reg rvx_signal_080;
wire [8-1:0] rvx_signal_060;
reg rvx_signal_023;
wire [8-1:0] rvx_signal_144;
wire rvx_signal_036;
reg [8-1:0] rvx_signal_039;
reg rvx_signal_154;
wire [32-1:0] rvx_signal_159;
reg rvx_signal_157;
wire [32-1:0] rvx_signal_134;
wire rvx_signal_046;
reg [32-1:0] rvx_signal_148;
reg rvx_signal_016;
wire [32-1:0] rvx_signal_003;
reg rvx_signal_092;
wire [32-1:0] rvx_signal_041;
wire rvx_signal_054;
reg [32-1:0] rvx_signal_088;
reg rvx_signal_009;
wire [32-1:0] rvx_signal_114;
reg rvx_signal_063;
wire [32-1:0] rvx_signal_011;
wire rvx_signal_146;
reg [32-1:0] rvx_signal_140;
reg rvx_signal_156;
wire [32-1:0] rvx_signal_105;
reg rvx_signal_000;
wire [32-1:0] rvx_signal_068;
wire rvx_signal_129;
reg [32-1:0] rvx_signal_150;
reg rvx_signal_109;
wire [32-1:0] rvx_signal_014;
reg rvx_signal_106;
wire [32-1:0] rvx_signal_067;
wire rvx_signal_052;
reg [32-1:0] rvx_signal_025;
reg rvx_signal_158;
wire [32-1:0] rvx_signal_124;
reg rvx_signal_117;
wire [32-1:0] rvx_signal_028;
wire rvx_signal_058;
reg [32-1:0] rvx_signal_033;
reg rvx_signal_027;
wire [32-1:0] rvx_signal_051;
reg rvx_signal_076;
wire [32-1:0] rvx_signal_138;
wire rvx_signal_094;
reg [32-1:0] rvx_signal_020;
reg rvx_signal_024;
wire [32-1:0] rvx_signal_135;
reg rvx_signal_147;
wire [32-1:0] rvx_signal_149;
wire rvx_signal_133;
reg [32-1:0] rvx_signal_153;
reg rvx_signal_095;
wire [32-1:0] rvx_signal_143;
reg rvx_signal_019;
wire [32-1:0] rvx_signal_119;
wire rvx_signal_128;
reg [32-1:0] rvx_signal_120;
reg rvx_signal_151;
wire [32-1:0] rvx_signal_091;
reg rvx_signal_062;
wire [32-1:0] rvx_signal_086;
wire rvx_signal_066;
reg [32-1:0] rvx_signal_121;
reg rvx_signal_104;
wire [32-1:0] rvx_signal_035;
reg rvx_signal_083;
wire [32-1:0] rvx_signal_002;
wire rvx_signal_087;
reg [32-1:0] rvx_signal_030;
reg rvx_signal_085;
wire [32-1:0] rvx_signal_073;
reg rvx_signal_132;
wire [32-1:0] rvx_signal_038;
wire rvx_signal_141;
reg [32-1:0] rvx_signal_048;
reg rvx_signal_098;
wire [32-1:0] rvx_signal_103;
reg rvx_signal_102;
wire [32-1:0] rvx_signal_101;
wire rvx_signal_137;
reg [32-1:0] rvx_signal_021;
reg rvx_signal_047;
wire [32-1:0] rvx_signal_097;
reg rvx_signal_145;
wire [32-1:0] rvx_signal_070;
wire rvx_signal_099;
reg [32-1:0] rvx_signal_069;
reg rvx_signal_012;
wire [32-1:0] rvx_signal_074;
reg rvx_signal_005;
wire [32-1:0] rvx_signal_071;
wire rvx_signal_136;
reg [32-1:0] rvx_signal_049;
reg rvx_signal_004;
wire [32-1:0] rvx_signal_115;
reg rvx_signal_022;
wire [32-1:0] rvx_signal_112;
wire rvx_signal_006;
reg [32-1:0] rvx_signal_130;
reg rvx_signal_078;
wire [32-1:0] rvx_signal_107;
reg rvx_signal_077;
wire [32-1:0] rvx_signal_065;
wire rvx_signal_127;
reg [32-1:0] rvx_signal_100;
reg rvx_signal_007;
wire [32-1:0] rvx_signal_155;
reg rvx_signal_111;
wire [32-1:0] rvx_signal_139;
wire rvx_signal_064;
reg [32-1:0] rvx_signal_122;
reg rvx_signal_015;
wire [32-1:0] rvx_signal_055;
reg rvx_signal_125;
wire [32-1:0] rvx_signal_018;
wire rvx_signal_040;
reg [32-1:0] rvx_signal_037;
reg rvx_signal_008;
wire [32-1:0] rvx_signal_082;
reg rvx_signal_053;
wire [32-1:0] rvx_signal_057;
wire rvx_signal_034;
reg [32-1:0] rvx_signal_113;
reg rvx_signal_044;
wire [32-1:0] rvx_signal_026;
reg rvx_signal_108;
wire [32-1:0] rvx_signal_118;
wire rvx_signal_050;
reg [32-1:0] rvx_signal_072;
reg rvx_signal_084;
wire [32-1:0] rvx_signal_013;
reg rvx_signal_142;
wire [32-1:0] rvx_signal_075;
wire rvx_signal_090;
reg [32-1:0] rvx_signal_096;
reg rvx_signal_042;
wire [32-1:0] rvx_signal_061;
reg rvx_signal_116;
wire [32-1:0] rvx_signal_152;
wire rvx_signal_126;
reg [32-1:0] rvx_signal_093;
reg rvx_signal_059;
wire [32-1:0] rvx_signal_079;
reg rvx_signal_017;
wire [32-1:0] rvx_signal_131;
wire rvx_signal_110;
reg [32-1:0] rvx_signal_056;

assign rvx_signal_081 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_03);
assign rvx_port_08 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_010);
assign {rvx_signal_043,rvx_signal_029} = paddr_offset;
assign rvx_signal_045 = {rvx_signal_043,addr_unused};
assign rvx_signal_123 = (rvx_signal_029==0);
assign rvx_signal_031 = rvx_port_11 & rvx_port_09 & rvx_signal_123 & (~rvx_port_13);
assign rvx_signal_001 = rvx_port_11 & rvx_port_09 & rvx_signal_123 & rvx_port_13;

assign rvx_signal_144 = $unsigned(rvx_port_03);
assign rvx_signal_134 = $unsigned(rvx_port_03);
assign rvx_signal_041 = $unsigned(rvx_port_03);
assign rvx_signal_011 = $unsigned(rvx_port_03);
assign rvx_signal_068 = $unsigned(rvx_port_03);
assign rvx_signal_067 = $unsigned(rvx_port_03);
assign rvx_signal_028 = $unsigned(rvx_port_03);
assign rvx_signal_138 = $unsigned(rvx_port_03);
assign rvx_signal_149 = $unsigned(rvx_port_03);
assign rvx_signal_119 = $unsigned(rvx_port_03);
assign rvx_signal_086 = $unsigned(rvx_port_03);
assign rvx_signal_002 = $unsigned(rvx_port_03);
assign rvx_signal_038 = $unsigned(rvx_port_03);
assign rvx_signal_101 = $unsigned(rvx_port_03);
assign rvx_signal_070 = $unsigned(rvx_port_03);
assign rvx_signal_071 = $unsigned(rvx_port_03);
assign rvx_signal_112 = $unsigned(rvx_port_03);
assign rvx_signal_065 = $unsigned(rvx_port_03);
assign rvx_signal_139 = $unsigned(rvx_port_03);
assign rvx_signal_018 = $unsigned(rvx_port_03);
assign rvx_signal_057 = $unsigned(rvx_port_03);
assign rvx_signal_118 = $unsigned(rvx_port_03);
assign rvx_signal_075 = $unsigned(rvx_port_03);
assign rvx_signal_152 = $unsigned(rvx_port_03);
assign rvx_signal_131 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_05 = 0;
	rvx_signal_010 = 0;
	rvx_port_01 = 1;

	rvx_signal_080 = 0;
	rvx_signal_023 = 0;

	rvx_signal_154 = 0;
	rvx_signal_157 = 0;

	rvx_signal_016 = 0;
	rvx_signal_092 = 0;

	rvx_signal_009 = 0;
	rvx_signal_063 = 0;

	rvx_signal_156 = 0;
	rvx_signal_000 = 0;

	rvx_signal_109 = 0;
	rvx_signal_106 = 0;

	rvx_signal_158 = 0;
	rvx_signal_117 = 0;

	rvx_signal_027 = 0;
	rvx_signal_076 = 0;

	rvx_signal_024 = 0;
	rvx_signal_147 = 0;

	rvx_signal_095 = 0;
	rvx_signal_019 = 0;

	rvx_signal_151 = 0;
	rvx_signal_062 = 0;

	rvx_signal_104 = 0;
	rvx_signal_083 = 0;

	rvx_signal_085 = 0;
	rvx_signal_132 = 0;

	rvx_signal_098 = 0;
	rvx_signal_102 = 0;

	rvx_signal_047 = 0;
	rvx_signal_145 = 0;

	rvx_signal_012 = 0;
	rvx_signal_005 = 0;

	rvx_signal_004 = 0;
	rvx_signal_022 = 0;

	rvx_signal_078 = 0;
	rvx_signal_077 = 0;

	rvx_signal_007 = 0;
	rvx_signal_111 = 0;

	rvx_signal_015 = 0;
	rvx_signal_125 = 0;

	rvx_signal_008 = 0;
	rvx_signal_053 = 0;

	rvx_signal_044 = 0;
	rvx_signal_108 = 0;

	rvx_signal_084 = 0;
	rvx_signal_142 = 0;

	rvx_signal_042 = 0;
	rvx_signal_116 = 0;

	rvx_signal_059 = 0;
	rvx_signal_017 = 0;

	if(rvx_port_11==1'b 1)
	begin
		case(rvx_signal_045)
			`RVX_GDEF_333:
			begin
				rvx_signal_080 = rvx_signal_031;
				rvx_signal_023 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_060);
				rvx_port_01 = rvx_signal_036;
			end
			`RVX_GDEF_238:
			begin
				rvx_signal_154 = rvx_signal_031;
				rvx_signal_157 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_159);
				rvx_port_01 = rvx_signal_046;
			end
			`RVX_GDEF_557:
			begin
				rvx_signal_016 = rvx_signal_031;
				rvx_signal_092 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_003);
				rvx_port_01 = rvx_signal_054;
			end
			`RVX_GDEF_265:
			begin
				rvx_signal_009 = rvx_signal_031;
				rvx_signal_063 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_114);
				rvx_port_01 = rvx_signal_146;
			end
			`RVX_GDEF_449:
			begin
				rvx_signal_156 = rvx_signal_031;
				rvx_signal_000 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_105);
				rvx_port_01 = rvx_signal_129;
			end
			`RVX_GDEF_459:
			begin
				rvx_signal_109 = rvx_signal_031;
				rvx_signal_106 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_014);
				rvx_port_01 = rvx_signal_052;
			end
			`RVX_GDEF_485:
			begin
				rvx_signal_158 = rvx_signal_031;
				rvx_signal_117 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_124);
				rvx_port_01 = rvx_signal_058;
			end
			`RVX_GDEF_605:
			begin
				rvx_signal_027 = rvx_signal_031;
				rvx_signal_076 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_051);
				rvx_port_01 = rvx_signal_094;
			end
			`RVX_GDEF_670:
			begin
				rvx_signal_024 = rvx_signal_031;
				rvx_signal_147 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_135);
				rvx_port_01 = rvx_signal_133;
			end
			`RVX_GDEF_519:
			begin
				rvx_signal_095 = rvx_signal_031;
				rvx_signal_019 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_143);
				rvx_port_01 = rvx_signal_128;
			end
			`RVX_GDEF_489:
			begin
				rvx_signal_151 = rvx_signal_031;
				rvx_signal_062 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_091);
				rvx_port_01 = rvx_signal_066;
			end
			`RVX_GDEF_018:
			begin
				rvx_signal_104 = rvx_signal_031;
				rvx_signal_083 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_035);
				rvx_port_01 = rvx_signal_087;
			end
			`RVX_GDEF_490:
			begin
				rvx_signal_085 = rvx_signal_031;
				rvx_signal_132 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_073);
				rvx_port_01 = rvx_signal_141;
			end
			`RVX_GDEF_181:
			begin
				rvx_signal_098 = rvx_signal_031;
				rvx_signal_102 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_103);
				rvx_port_01 = rvx_signal_137;
			end
			`RVX_GDEF_630:
			begin
				rvx_signal_047 = rvx_signal_031;
				rvx_signal_145 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_097);
				rvx_port_01 = rvx_signal_099;
			end
			`RVX_GDEF_000:
			begin
				rvx_signal_012 = rvx_signal_031;
				rvx_signal_005 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_074);
				rvx_port_01 = rvx_signal_136;
			end
			`RVX_GDEF_129:
			begin
				rvx_signal_004 = rvx_signal_031;
				rvx_signal_022 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_115);
				rvx_port_01 = rvx_signal_006;
			end
			`RVX_GDEF_321:
			begin
				rvx_signal_078 = rvx_signal_031;
				rvx_signal_077 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_107);
				rvx_port_01 = rvx_signal_127;
			end
			`RVX_GDEF_680:
			begin
				rvx_signal_007 = rvx_signal_031;
				rvx_signal_111 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_155);
				rvx_port_01 = rvx_signal_064;
			end
			`RVX_GDEF_543:
			begin
				rvx_signal_015 = rvx_signal_031;
				rvx_signal_125 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_055);
				rvx_port_01 = rvx_signal_040;
			end
			`RVX_GDEF_284:
			begin
				rvx_signal_008 = rvx_signal_031;
				rvx_signal_053 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_082);
				rvx_port_01 = rvx_signal_034;
			end
			`RVX_GDEF_380:
			begin
				rvx_signal_044 = rvx_signal_031;
				rvx_signal_108 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_026);
				rvx_port_01 = rvx_signal_050;
			end
			`RVX_GDEF_182:
			begin
				rvx_signal_084 = rvx_signal_031;
				rvx_signal_142 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_013);
				rvx_port_01 = rvx_signal_090;
			end
			`RVX_GDEF_218:
			begin
				rvx_signal_042 = rvx_signal_031;
				rvx_signal_116 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_061);
				rvx_port_01 = rvx_signal_126;
			end
			`RVX_GDEF_346:
			begin
				rvx_signal_059 = rvx_signal_031;
				rvx_signal_017 = rvx_signal_001;
				rvx_signal_010 = $unsigned(rvx_signal_079);
				rvx_port_01 = rvx_signal_110;
			end
			default:
				rvx_port_05 = 1;
		endcase
	end
end

always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_039 <= `RVX_GDEF_185;
	else if (rvx_signal_023==1'b 1)
		rvx_signal_039 <= rvx_signal_144;
end
assign rvx_signal_060 = rvx_signal_039;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_148 <= `RVX_GDEF_432;
	else if (rvx_signal_157==1'b 1)
		rvx_signal_148 <= rvx_signal_134;
end
assign rvx_signal_159 = rvx_signal_148;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_088 <= `RVX_GDEF_432;
	else if (rvx_signal_092==1'b 1)
		rvx_signal_088 <= rvx_signal_041;
end
assign rvx_signal_003 = rvx_signal_088;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_140 <= `RVX_GDEF_432;
	else if (rvx_signal_063==1'b 1)
		rvx_signal_140 <= rvx_signal_011;
end
assign rvx_signal_114 = rvx_signal_140;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_150 <= `RVX_GDEF_432;
	else if (rvx_signal_000==1'b 1)
		rvx_signal_150 <= rvx_signal_068;
end
assign rvx_signal_105 = rvx_signal_150;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_025 <= `RVX_GDEF_432;
	else if (rvx_signal_106==1'b 1)
		rvx_signal_025 <= rvx_signal_067;
end
assign rvx_signal_014 = rvx_signal_025;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_033 <= `RVX_GDEF_432;
	else if (rvx_signal_117==1'b 1)
		rvx_signal_033 <= rvx_signal_028;
end
assign rvx_signal_124 = rvx_signal_033;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_020 <= `RVX_GDEF_432;
	else if (rvx_signal_076==1'b 1)
		rvx_signal_020 <= rvx_signal_138;
end
assign rvx_signal_051 = rvx_signal_020;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_153 <= `RVX_GDEF_432;
	else if (rvx_signal_147==1'b 1)
		rvx_signal_153 <= rvx_signal_149;
end
assign rvx_signal_135 = rvx_signal_153;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_120 <= `RVX_GDEF_132;
	else if (rvx_signal_019==1'b 1)
		rvx_signal_120 <= rvx_signal_119;
end
assign rvx_signal_143 = rvx_signal_120;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_121 <= `RVX_GDEF_132;
	else if (rvx_signal_062==1'b 1)
		rvx_signal_121 <= rvx_signal_086;
end
assign rvx_signal_091 = rvx_signal_121;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_030 <= `RVX_GDEF_132;
	else if (rvx_signal_083==1'b 1)
		rvx_signal_030 <= rvx_signal_002;
end
assign rvx_signal_035 = rvx_signal_030;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_048 <= `RVX_GDEF_132;
	else if (rvx_signal_132==1'b 1)
		rvx_signal_048 <= rvx_signal_038;
end
assign rvx_signal_073 = rvx_signal_048;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_021 <= `RVX_GDEF_132;
	else if (rvx_signal_102==1'b 1)
		rvx_signal_021 <= rvx_signal_101;
end
assign rvx_signal_103 = rvx_signal_021;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_069 <= `RVX_GDEF_132;
	else if (rvx_signal_145==1'b 1)
		rvx_signal_069 <= rvx_signal_070;
end
assign rvx_signal_097 = rvx_signal_069;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_049 <= `RVX_GDEF_132;
	else if (rvx_signal_005==1'b 1)
		rvx_signal_049 <= rvx_signal_071;
end
assign rvx_signal_074 = rvx_signal_049;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_130 <= `RVX_GDEF_132;
	else if (rvx_signal_022==1'b 1)
		rvx_signal_130 <= rvx_signal_112;
end
assign rvx_signal_115 = rvx_signal_130;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_100 <= `RVX_GDEF_385;
	else if (rvx_signal_077==1'b 1)
		rvx_signal_100 <= rvx_signal_065;
end
assign rvx_signal_107 = rvx_signal_100;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_122 <= `RVX_GDEF_385;
	else if (rvx_signal_111==1'b 1)
		rvx_signal_122 <= rvx_signal_139;
end
assign rvx_signal_155 = rvx_signal_122;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_037 <= `RVX_GDEF_385;
	else if (rvx_signal_125==1'b 1)
		rvx_signal_037 <= rvx_signal_018;
end
assign rvx_signal_055 = rvx_signal_037;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_113 <= `RVX_GDEF_385;
	else if (rvx_signal_053==1'b 1)
		rvx_signal_113 <= rvx_signal_057;
end
assign rvx_signal_082 = rvx_signal_113;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_072 <= `RVX_GDEF_385;
	else if (rvx_signal_108==1'b 1)
		rvx_signal_072 <= rvx_signal_118;
end
assign rvx_signal_026 = rvx_signal_072;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_096 <= `RVX_GDEF_385;
	else if (rvx_signal_142==1'b 1)
		rvx_signal_096 <= rvx_signal_075;
end
assign rvx_signal_013 = rvx_signal_096;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_093 <= `RVX_GDEF_385;
	else if (rvx_signal_116==1'b 1)
		rvx_signal_093 <= rvx_signal_152;
end
assign rvx_signal_061 = rvx_signal_093;
always@(posedge rvx_port_06, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_056 <= `RVX_GDEF_385;
	else if (rvx_signal_017==1'b 1)
		rvx_signal_056 <= rvx_signal_131;
end
assign rvx_signal_079 = rvx_signal_056;

assign rvx_port_02 = rvx_signal_039;
assign rvx_signal_036 = 1;

assign rvx_port_14[(32)*((00)+1)-1-:32] = rvx_signal_148;

assign rvx_port_14[(32)*((01)+1)-1-:32] = rvx_signal_088;

assign rvx_port_14[(32)*((02)+1)-1-:32] = rvx_signal_140;

assign rvx_port_14[(32)*((03)+1)-1-:32] = rvx_signal_150;

assign rvx_port_14[(32)*((04)+1)-1-:32] = rvx_signal_025;

assign rvx_port_14[(32)*((05)+1)-1-:32] = rvx_signal_033;

assign rvx_port_14[(32)*((06)+1)-1-:32] = rvx_signal_020;

assign rvx_port_14[(32)*((07)+1)-1-:32] = rvx_signal_153;

assign rvx_signal_046 = 1;

assign rvx_signal_054 = 1;

assign rvx_signal_146 = 1;

assign rvx_signal_129 = 1;

assign rvx_signal_052 = 1;

assign rvx_signal_058 = 1;

assign rvx_signal_094 = 1;

assign rvx_signal_133 = 1;

assign rvx_port_12[(32)*((00)+1)-1-:32] = rvx_signal_120;

assign rvx_port_12[(32)*((01)+1)-1-:32] = rvx_signal_121;

assign rvx_port_12[(32)*((02)+1)-1-:32] = rvx_signal_030;

assign rvx_port_12[(32)*((03)+1)-1-:32] = rvx_signal_048;

assign rvx_port_12[(32)*((04)+1)-1-:32] = rvx_signal_021;

assign rvx_port_12[(32)*((05)+1)-1-:32] = rvx_signal_069;

assign rvx_port_12[(32)*((06)+1)-1-:32] = rvx_signal_049;

assign rvx_port_12[(32)*((07)+1)-1-:32] = rvx_signal_130;

assign rvx_signal_128 = 1;

assign rvx_signal_066 = 1;

assign rvx_signal_087 = 1;

assign rvx_signal_141 = 1;

assign rvx_signal_137 = 1;

assign rvx_signal_099 = 1;

assign rvx_signal_136 = 1;

assign rvx_signal_006 = 1;

assign rvx_port_07[(32)*((00)+1)-1-:32] = rvx_signal_100;

assign rvx_port_07[(32)*((01)+1)-1-:32] = rvx_signal_122;

assign rvx_port_07[(32)*((02)+1)-1-:32] = rvx_signal_037;

assign rvx_port_07[(32)*((03)+1)-1-:32] = rvx_signal_113;

assign rvx_port_07[(32)*((04)+1)-1-:32] = rvx_signal_072;

assign rvx_port_07[(32)*((05)+1)-1-:32] = rvx_signal_096;

assign rvx_port_07[(32)*((06)+1)-1-:32] = rvx_signal_093;

assign rvx_port_07[(32)*((07)+1)-1-:32] = rvx_signal_056;

assign rvx_signal_127 = 1;

assign rvx_signal_064 = 1;

assign rvx_signal_040 = 1;

assign rvx_signal_034 = 1;

assign rvx_signal_050 = 1;

assign rvx_signal_090 = 1;

assign rvx_signal_126 = 1;

assign rvx_signal_110 = 1;

endmodule
