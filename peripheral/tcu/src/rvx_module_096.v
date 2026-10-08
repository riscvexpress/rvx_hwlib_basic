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
`include "rvx_include_11.vh"




module RVX_MODULE_096
(
	rvx_port_00,
	rvx_port_08,

	rvx_port_13,
	rvx_port_01,
	rvx_port_04,
	rvx_port_14,
	rvx_port_02,
	rvx_port_11,
	rvx_port_12,
	rvx_port_09,

	rvx_port_10,
	rvx_port_06,
	rvx_port_05,
	rvx_port_03,
	rvx_port_07
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_00, rvx_port_08;
input wire rvx_port_13;
input wire rvx_port_01;
input wire [RVX_GPARA_2-1:0] rvx_port_04;
input wire rvx_port_14;
input wire [RVX_GPARA_1-1:0] rvx_port_02;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
output reg rvx_port_12;
output reg rvx_port_09;

input wire rvx_port_10;

output wire [8-1:0] rvx_port_06;

output wire [(32)*(8)-1:0] rvx_port_05;

output wire [(32)*(8)-1:0] rvx_port_03;

output wire [(32)*(8)-1:0] rvx_port_07;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_019;
reg [RVX_GPARA_1-1:0] rvx_signal_132;
wire rvx_signal_086;
wire rvx_signal_100;
wire rvx_signal_121;

wire [`RVX_GDEF_204-1:0] paddr_offset = rvx_port_04;
wire [`RVX_GDEF_204-1:0] rvx_signal_158;
wire [RVX_GPARA_2-1:0] rvx_signal_044;
wire [`RVX_GDEF_531-1:0] rvx_signal_025;
wire [`RVX_GDEF_531-1:0] addr_unused = 0;
reg rvx_signal_154;
wire [8-1:0] rvx_signal_051;
reg rvx_signal_052;
wire [8-1:0] rvx_signal_055;
wire rvx_signal_049;
reg [8-1:0] rvx_signal_031;
reg rvx_signal_016;
wire [32-1:0] rvx_signal_053;
reg rvx_signal_017;
wire [32-1:0] rvx_signal_027;
wire rvx_signal_139;
reg [32-1:0] rvx_signal_000;
reg rvx_signal_125;
wire [32-1:0] rvx_signal_059;
reg rvx_signal_005;
wire [32-1:0] rvx_signal_062;
wire rvx_signal_105;
reg [32-1:0] rvx_signal_157;
reg rvx_signal_009;
wire [32-1:0] rvx_signal_092;
reg rvx_signal_152;
wire [32-1:0] rvx_signal_039;
wire rvx_signal_109;
reg [32-1:0] rvx_signal_020;
reg rvx_signal_041;
wire [32-1:0] rvx_signal_119;
reg rvx_signal_045;
wire [32-1:0] rvx_signal_023;
wire rvx_signal_007;
reg [32-1:0] rvx_signal_087;
reg rvx_signal_011;
wire [32-1:0] rvx_signal_088;
reg rvx_signal_073;
wire [32-1:0] rvx_signal_106;
wire rvx_signal_056;
reg [32-1:0] rvx_signal_118;
reg rvx_signal_117;
wire [32-1:0] rvx_signal_093;
reg rvx_signal_128;
wire [32-1:0] rvx_signal_089;
wire rvx_signal_024;
reg [32-1:0] rvx_signal_057;
reg rvx_signal_037;
wire [32-1:0] rvx_signal_112;
reg rvx_signal_015;
wire [32-1:0] rvx_signal_029;
wire rvx_signal_079;
reg [32-1:0] rvx_signal_083;
reg rvx_signal_034;
wire [32-1:0] rvx_signal_137;
reg rvx_signal_032;
wire [32-1:0] rvx_signal_060;
wire rvx_signal_153;
reg [32-1:0] rvx_signal_006;
reg rvx_signal_081;
wire [32-1:0] rvx_signal_095;
reg rvx_signal_142;
wire [32-1:0] rvx_signal_108;
wire rvx_signal_075;
reg [32-1:0] rvx_signal_022;
reg rvx_signal_004;
wire [32-1:0] rvx_signal_050;
reg rvx_signal_082;
wire [32-1:0] rvx_signal_103;
wire rvx_signal_134;
reg [32-1:0] rvx_signal_065;
reg rvx_signal_159;
wire [32-1:0] rvx_signal_054;
reg rvx_signal_033;
wire [32-1:0] rvx_signal_101;
wire rvx_signal_151;
reg [32-1:0] rvx_signal_061;
reg rvx_signal_123;
wire [32-1:0] rvx_signal_028;
reg rvx_signal_147;
wire [32-1:0] rvx_signal_047;
wire rvx_signal_046;
reg [32-1:0] rvx_signal_155;
reg rvx_signal_063;
wire [32-1:0] rvx_signal_133;
reg rvx_signal_135;
wire [32-1:0] rvx_signal_010;
wire rvx_signal_085;
reg [32-1:0] rvx_signal_002;
reg rvx_signal_111;
wire [32-1:0] rvx_signal_068;
reg rvx_signal_066;
wire [32-1:0] rvx_signal_102;
wire rvx_signal_036;
reg [32-1:0] rvx_signal_114;
reg rvx_signal_096;
wire [32-1:0] rvx_signal_129;
reg rvx_signal_030;
wire [32-1:0] rvx_signal_110;
wire rvx_signal_107;
reg [32-1:0] rvx_signal_070;
reg rvx_signal_146;
wire [32-1:0] rvx_signal_091;
reg rvx_signal_126;
wire [32-1:0] rvx_signal_076;
wire rvx_signal_048;
reg [32-1:0] rvx_signal_115;
reg rvx_signal_013;
wire [32-1:0] rvx_signal_131;
reg rvx_signal_077;
wire [32-1:0] rvx_signal_069;
wire rvx_signal_097;
reg [32-1:0] rvx_signal_141;
reg rvx_signal_127;
wire [32-1:0] rvx_signal_104;
reg rvx_signal_122;
wire [32-1:0] rvx_signal_116;
wire rvx_signal_067;
reg [32-1:0] rvx_signal_080;
reg rvx_signal_035;
wire [32-1:0] rvx_signal_058;
reg rvx_signal_040;
wire [32-1:0] rvx_signal_043;
wire rvx_signal_071;
reg [32-1:0] rvx_signal_156;
reg rvx_signal_084;
wire [32-1:0] rvx_signal_124;
reg rvx_signal_136;
wire [32-1:0] rvx_signal_144;
wire rvx_signal_008;
reg [32-1:0] rvx_signal_014;
reg rvx_signal_148;
wire [32-1:0] rvx_signal_145;
reg rvx_signal_120;
wire [32-1:0] rvx_signal_150;
wire rvx_signal_001;
reg [32-1:0] rvx_signal_078;
reg rvx_signal_026;
wire [32-1:0] rvx_signal_130;
reg rvx_signal_140;
wire [32-1:0] rvx_signal_099;
wire rvx_signal_143;
reg [32-1:0] rvx_signal_003;
reg rvx_signal_064;
wire [32-1:0] rvx_signal_042;
reg rvx_signal_149;
wire [32-1:0] rvx_signal_018;
wire rvx_signal_021;
reg [32-1:0] rvx_signal_090;
reg rvx_signal_038;
wire [32-1:0] rvx_signal_098;
reg rvx_signal_012;
wire [32-1:0] rvx_signal_113;
wire rvx_signal_074;
reg [32-1:0] rvx_signal_094;

assign rvx_signal_019 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_02);
assign rvx_port_11 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_132);
assign {rvx_signal_044,rvx_signal_025} = paddr_offset;
assign rvx_signal_158 = {rvx_signal_044,addr_unused};
assign rvx_signal_121 = (rvx_signal_025==0);
assign rvx_signal_086 = rvx_port_13 & rvx_port_01 & rvx_signal_121 & (~rvx_port_14);
assign rvx_signal_100 = rvx_port_13 & rvx_port_01 & rvx_signal_121 & rvx_port_14;

assign rvx_signal_055 = $unsigned(rvx_port_02);
assign rvx_signal_027 = $unsigned(rvx_port_02);
assign rvx_signal_062 = $unsigned(rvx_port_02);
assign rvx_signal_039 = $unsigned(rvx_port_02);
assign rvx_signal_023 = $unsigned(rvx_port_02);
assign rvx_signal_106 = $unsigned(rvx_port_02);
assign rvx_signal_089 = $unsigned(rvx_port_02);
assign rvx_signal_029 = $unsigned(rvx_port_02);
assign rvx_signal_060 = $unsigned(rvx_port_02);
assign rvx_signal_108 = $unsigned(rvx_port_02);
assign rvx_signal_103 = $unsigned(rvx_port_02);
assign rvx_signal_101 = $unsigned(rvx_port_02);
assign rvx_signal_047 = $unsigned(rvx_port_02);
assign rvx_signal_010 = $unsigned(rvx_port_02);
assign rvx_signal_102 = $unsigned(rvx_port_02);
assign rvx_signal_110 = $unsigned(rvx_port_02);
assign rvx_signal_076 = $unsigned(rvx_port_02);
assign rvx_signal_069 = $unsigned(rvx_port_02);
assign rvx_signal_116 = $unsigned(rvx_port_02);
assign rvx_signal_043 = $unsigned(rvx_port_02);
assign rvx_signal_144 = $unsigned(rvx_port_02);
assign rvx_signal_150 = $unsigned(rvx_port_02);
assign rvx_signal_099 = $unsigned(rvx_port_02);
assign rvx_signal_018 = $unsigned(rvx_port_02);
assign rvx_signal_113 = $unsigned(rvx_port_02);

always@(*)
begin
	rvx_port_09 = 0;
	rvx_signal_132 = 0;
	rvx_port_12 = 1;

	rvx_signal_154 = 0;
	rvx_signal_052 = 0;

	rvx_signal_016 = 0;
	rvx_signal_017 = 0;

	rvx_signal_125 = 0;
	rvx_signal_005 = 0;

	rvx_signal_009 = 0;
	rvx_signal_152 = 0;

	rvx_signal_041 = 0;
	rvx_signal_045 = 0;

	rvx_signal_011 = 0;
	rvx_signal_073 = 0;

	rvx_signal_117 = 0;
	rvx_signal_128 = 0;

	rvx_signal_037 = 0;
	rvx_signal_015 = 0;

	rvx_signal_034 = 0;
	rvx_signal_032 = 0;

	rvx_signal_081 = 0;
	rvx_signal_142 = 0;

	rvx_signal_004 = 0;
	rvx_signal_082 = 0;

	rvx_signal_159 = 0;
	rvx_signal_033 = 0;

	rvx_signal_123 = 0;
	rvx_signal_147 = 0;

	rvx_signal_063 = 0;
	rvx_signal_135 = 0;

	rvx_signal_111 = 0;
	rvx_signal_066 = 0;

	rvx_signal_096 = 0;
	rvx_signal_030 = 0;

	rvx_signal_146 = 0;
	rvx_signal_126 = 0;

	rvx_signal_013 = 0;
	rvx_signal_077 = 0;

	rvx_signal_127 = 0;
	rvx_signal_122 = 0;

	rvx_signal_035 = 0;
	rvx_signal_040 = 0;

	rvx_signal_084 = 0;
	rvx_signal_136 = 0;

	rvx_signal_148 = 0;
	rvx_signal_120 = 0;

	rvx_signal_026 = 0;
	rvx_signal_140 = 0;

	rvx_signal_064 = 0;
	rvx_signal_149 = 0;

	rvx_signal_038 = 0;
	rvx_signal_012 = 0;

	if(rvx_port_13==1'b 1)
	begin
		case(rvx_signal_158)
			`RVX_GDEF_289:
			begin
				rvx_signal_154 = rvx_signal_086;
				rvx_signal_052 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_051);
				rvx_port_12 = rvx_signal_049;
			end
			`RVX_GDEF_179:
			begin
				rvx_signal_016 = rvx_signal_086;
				rvx_signal_017 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_053);
				rvx_port_12 = rvx_signal_139;
			end
			`RVX_GDEF_382:
			begin
				rvx_signal_125 = rvx_signal_086;
				rvx_signal_005 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_059);
				rvx_port_12 = rvx_signal_105;
			end
			`RVX_GDEF_033:
			begin
				rvx_signal_009 = rvx_signal_086;
				rvx_signal_152 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_092);
				rvx_port_12 = rvx_signal_109;
			end
			`RVX_GDEF_610:
			begin
				rvx_signal_041 = rvx_signal_086;
				rvx_signal_045 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_119);
				rvx_port_12 = rvx_signal_007;
			end
			`RVX_GDEF_063:
			begin
				rvx_signal_011 = rvx_signal_086;
				rvx_signal_073 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_088);
				rvx_port_12 = rvx_signal_056;
			end
			`RVX_GDEF_218:
			begin
				rvx_signal_117 = rvx_signal_086;
				rvx_signal_128 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_093);
				rvx_port_12 = rvx_signal_024;
			end
			`RVX_GDEF_022:
			begin
				rvx_signal_037 = rvx_signal_086;
				rvx_signal_015 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_112);
				rvx_port_12 = rvx_signal_079;
			end
			`RVX_GDEF_646:
			begin
				rvx_signal_034 = rvx_signal_086;
				rvx_signal_032 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_137);
				rvx_port_12 = rvx_signal_153;
			end
			`RVX_GDEF_244:
			begin
				rvx_signal_081 = rvx_signal_086;
				rvx_signal_142 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_095);
				rvx_port_12 = rvx_signal_075;
			end
			`RVX_GDEF_178:
			begin
				rvx_signal_004 = rvx_signal_086;
				rvx_signal_082 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_050);
				rvx_port_12 = rvx_signal_134;
			end
			`RVX_GDEF_226:
			begin
				rvx_signal_159 = rvx_signal_086;
				rvx_signal_033 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_054);
				rvx_port_12 = rvx_signal_151;
			end
			`RVX_GDEF_557:
			begin
				rvx_signal_123 = rvx_signal_086;
				rvx_signal_147 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_028);
				rvx_port_12 = rvx_signal_046;
			end
			`RVX_GDEF_273:
			begin
				rvx_signal_063 = rvx_signal_086;
				rvx_signal_135 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_133);
				rvx_port_12 = rvx_signal_085;
			end
			`RVX_GDEF_506:
			begin
				rvx_signal_111 = rvx_signal_086;
				rvx_signal_066 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_068);
				rvx_port_12 = rvx_signal_036;
			end
			`RVX_GDEF_388:
			begin
				rvx_signal_096 = rvx_signal_086;
				rvx_signal_030 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_129);
				rvx_port_12 = rvx_signal_107;
			end
			`RVX_GDEF_232:
			begin
				rvx_signal_146 = rvx_signal_086;
				rvx_signal_126 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_091);
				rvx_port_12 = rvx_signal_048;
			end
			`RVX_GDEF_482:
			begin
				rvx_signal_013 = rvx_signal_086;
				rvx_signal_077 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_131);
				rvx_port_12 = rvx_signal_097;
			end
			`RVX_GDEF_158:
			begin
				rvx_signal_127 = rvx_signal_086;
				rvx_signal_122 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_104);
				rvx_port_12 = rvx_signal_067;
			end
			`RVX_GDEF_229:
			begin
				rvx_signal_035 = rvx_signal_086;
				rvx_signal_040 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_058);
				rvx_port_12 = rvx_signal_071;
			end
			`RVX_GDEF_192:
			begin
				rvx_signal_084 = rvx_signal_086;
				rvx_signal_136 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_124);
				rvx_port_12 = rvx_signal_008;
			end
			`RVX_GDEF_456:
			begin
				rvx_signal_148 = rvx_signal_086;
				rvx_signal_120 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_145);
				rvx_port_12 = rvx_signal_001;
			end
			`RVX_GDEF_052:
			begin
				rvx_signal_026 = rvx_signal_086;
				rvx_signal_140 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_130);
				rvx_port_12 = rvx_signal_143;
			end
			`RVX_GDEF_354:
			begin
				rvx_signal_064 = rvx_signal_086;
				rvx_signal_149 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_042);
				rvx_port_12 = rvx_signal_021;
			end
			`RVX_GDEF_275:
			begin
				rvx_signal_038 = rvx_signal_086;
				rvx_signal_012 = rvx_signal_100;
				rvx_signal_132 = $unsigned(rvx_signal_098);
				rvx_port_12 = rvx_signal_074;
			end
			default:
				rvx_port_09 = 1;
		endcase
	end
end

always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_031 <= `RVX_GDEF_489;
	else if (rvx_signal_052==1'b 1)
		rvx_signal_031 <= rvx_signal_055;
end
assign rvx_signal_051 = rvx_signal_031;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_000 <= `RVX_GDEF_240;
	else if (rvx_signal_017==1'b 1)
		rvx_signal_000 <= rvx_signal_027;
end
assign rvx_signal_053 = rvx_signal_000;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_157 <= `RVX_GDEF_240;
	else if (rvx_signal_005==1'b 1)
		rvx_signal_157 <= rvx_signal_062;
end
assign rvx_signal_059 = rvx_signal_157;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_020 <= `RVX_GDEF_240;
	else if (rvx_signal_152==1'b 1)
		rvx_signal_020 <= rvx_signal_039;
end
assign rvx_signal_092 = rvx_signal_020;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_087 <= `RVX_GDEF_240;
	else if (rvx_signal_045==1'b 1)
		rvx_signal_087 <= rvx_signal_023;
end
assign rvx_signal_119 = rvx_signal_087;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_118 <= `RVX_GDEF_240;
	else if (rvx_signal_073==1'b 1)
		rvx_signal_118 <= rvx_signal_106;
end
assign rvx_signal_088 = rvx_signal_118;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_057 <= `RVX_GDEF_240;
	else if (rvx_signal_128==1'b 1)
		rvx_signal_057 <= rvx_signal_089;
end
assign rvx_signal_093 = rvx_signal_057;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_083 <= `RVX_GDEF_240;
	else if (rvx_signal_015==1'b 1)
		rvx_signal_083 <= rvx_signal_029;
end
assign rvx_signal_112 = rvx_signal_083;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_006 <= `RVX_GDEF_240;
	else if (rvx_signal_032==1'b 1)
		rvx_signal_006 <= rvx_signal_060;
end
assign rvx_signal_137 = rvx_signal_006;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_022 <= `RVX_GDEF_686;
	else if (rvx_signal_142==1'b 1)
		rvx_signal_022 <= rvx_signal_108;
end
assign rvx_signal_095 = rvx_signal_022;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_065 <= `RVX_GDEF_686;
	else if (rvx_signal_082==1'b 1)
		rvx_signal_065 <= rvx_signal_103;
end
assign rvx_signal_050 = rvx_signal_065;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_061 <= `RVX_GDEF_686;
	else if (rvx_signal_033==1'b 1)
		rvx_signal_061 <= rvx_signal_101;
end
assign rvx_signal_054 = rvx_signal_061;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_155 <= `RVX_GDEF_686;
	else if (rvx_signal_147==1'b 1)
		rvx_signal_155 <= rvx_signal_047;
end
assign rvx_signal_028 = rvx_signal_155;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_002 <= `RVX_GDEF_686;
	else if (rvx_signal_135==1'b 1)
		rvx_signal_002 <= rvx_signal_010;
end
assign rvx_signal_133 = rvx_signal_002;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_114 <= `RVX_GDEF_686;
	else if (rvx_signal_066==1'b 1)
		rvx_signal_114 <= rvx_signal_102;
end
assign rvx_signal_068 = rvx_signal_114;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_070 <= `RVX_GDEF_686;
	else if (rvx_signal_030==1'b 1)
		rvx_signal_070 <= rvx_signal_110;
end
assign rvx_signal_129 = rvx_signal_070;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_115 <= `RVX_GDEF_686;
	else if (rvx_signal_126==1'b 1)
		rvx_signal_115 <= rvx_signal_076;
end
assign rvx_signal_091 = rvx_signal_115;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_141 <= `RVX_GDEF_181;
	else if (rvx_signal_077==1'b 1)
		rvx_signal_141 <= rvx_signal_069;
end
assign rvx_signal_131 = rvx_signal_141;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_080 <= `RVX_GDEF_181;
	else if (rvx_signal_122==1'b 1)
		rvx_signal_080 <= rvx_signal_116;
end
assign rvx_signal_104 = rvx_signal_080;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_156 <= `RVX_GDEF_181;
	else if (rvx_signal_040==1'b 1)
		rvx_signal_156 <= rvx_signal_043;
end
assign rvx_signal_058 = rvx_signal_156;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_014 <= `RVX_GDEF_181;
	else if (rvx_signal_136==1'b 1)
		rvx_signal_014 <= rvx_signal_144;
end
assign rvx_signal_124 = rvx_signal_014;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_078 <= `RVX_GDEF_181;
	else if (rvx_signal_120==1'b 1)
		rvx_signal_078 <= rvx_signal_150;
end
assign rvx_signal_145 = rvx_signal_078;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_003 <= `RVX_GDEF_181;
	else if (rvx_signal_140==1'b 1)
		rvx_signal_003 <= rvx_signal_099;
end
assign rvx_signal_130 = rvx_signal_003;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_090 <= `RVX_GDEF_181;
	else if (rvx_signal_149==1'b 1)
		rvx_signal_090 <= rvx_signal_018;
end
assign rvx_signal_042 = rvx_signal_090;
always@(posedge rvx_port_00, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_094 <= `RVX_GDEF_181;
	else if (rvx_signal_012==1'b 1)
		rvx_signal_094 <= rvx_signal_113;
end
assign rvx_signal_098 = rvx_signal_094;

assign rvx_port_06 = rvx_signal_031;
assign rvx_signal_049 = 1;

assign rvx_port_05[(32)*((00)+1)-1-:32] = rvx_signal_000;

assign rvx_port_05[(32)*((01)+1)-1-:32] = rvx_signal_157;

assign rvx_port_05[(32)*((02)+1)-1-:32] = rvx_signal_020;

assign rvx_port_05[(32)*((03)+1)-1-:32] = rvx_signal_087;

assign rvx_port_05[(32)*((04)+1)-1-:32] = rvx_signal_118;

assign rvx_port_05[(32)*((05)+1)-1-:32] = rvx_signal_057;

assign rvx_port_05[(32)*((06)+1)-1-:32] = rvx_signal_083;

assign rvx_port_05[(32)*((07)+1)-1-:32] = rvx_signal_006;

assign rvx_signal_139 = 1;

assign rvx_signal_105 = 1;

assign rvx_signal_109 = 1;

assign rvx_signal_007 = 1;

assign rvx_signal_056 = 1;

assign rvx_signal_024 = 1;

assign rvx_signal_079 = 1;

assign rvx_signal_153 = 1;

assign rvx_port_03[(32)*((00)+1)-1-:32] = rvx_signal_022;

assign rvx_port_03[(32)*((01)+1)-1-:32] = rvx_signal_065;

assign rvx_port_03[(32)*((02)+1)-1-:32] = rvx_signal_061;

assign rvx_port_03[(32)*((03)+1)-1-:32] = rvx_signal_155;

assign rvx_port_03[(32)*((04)+1)-1-:32] = rvx_signal_002;

assign rvx_port_03[(32)*((05)+1)-1-:32] = rvx_signal_114;

assign rvx_port_03[(32)*((06)+1)-1-:32] = rvx_signal_070;

assign rvx_port_03[(32)*((07)+1)-1-:32] = rvx_signal_115;

assign rvx_signal_075 = 1;

assign rvx_signal_134 = 1;

assign rvx_signal_151 = 1;

assign rvx_signal_046 = 1;

assign rvx_signal_085 = 1;

assign rvx_signal_036 = 1;

assign rvx_signal_107 = 1;

assign rvx_signal_048 = 1;

assign rvx_port_07[(32)*((00)+1)-1-:32] = rvx_signal_141;

assign rvx_port_07[(32)*((01)+1)-1-:32] = rvx_signal_080;

assign rvx_port_07[(32)*((02)+1)-1-:32] = rvx_signal_156;

assign rvx_port_07[(32)*((03)+1)-1-:32] = rvx_signal_014;

assign rvx_port_07[(32)*((04)+1)-1-:32] = rvx_signal_078;

assign rvx_port_07[(32)*((05)+1)-1-:32] = rvx_signal_003;

assign rvx_port_07[(32)*((06)+1)-1-:32] = rvx_signal_090;

assign rvx_port_07[(32)*((07)+1)-1-:32] = rvx_signal_094;

assign rvx_signal_097 = 1;

assign rvx_signal_067 = 1;

assign rvx_signal_071 = 1;

assign rvx_signal_008 = 1;

assign rvx_signal_001 = 1;

assign rvx_signal_143 = 1;

assign rvx_signal_021 = 1;

assign rvx_signal_074 = 1;

endmodule
