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
`include "rvx_include_01.vh"





module RVX_MODULE_061
(
	rvx_port_24,
	rvx_port_54,

	rvx_port_16,
	rvx_port_04,
	rvx_port_22,
	rvx_port_07,
	rvx_port_27,
	rvx_port_42,
	rvx_port_23,
	rvx_port_31,

	rvx_port_11,
	rvx_port_35,
	rvx_port_52,
	rvx_port_50,
	rvx_port_37,
	rvx_port_19,
	rvx_port_17,
	rvx_port_08,
	rvx_port_09,
	rvx_port_44,
	rvx_port_20,
	rvx_port_18,
	rvx_port_43,
	rvx_port_39,
	rvx_port_40,
	rvx_port_41,
	rvx_port_25,
	rvx_port_48,
	rvx_port_32,
	rvx_port_13,
	rvx_port_02,
	rvx_port_14,
	rvx_port_38,
	rvx_port_28,
	rvx_port_47,
	rvx_port_53,
	rvx_port_12,
	rvx_port_34,
	rvx_port_10,
	rvx_port_46,
	rvx_port_36,
	rvx_port_29,
	rvx_port_05,
	rvx_port_49,
	rvx_port_01,
	rvx_port_45,
	rvx_port_03,
	rvx_port_15,
	rvx_port_00,
	rvx_port_30,
	rvx_port_21,
	rvx_port_26,
	rvx_port_33,
	rvx_port_51,
	rvx_port_06
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_24, rvx_port_54;
input wire rvx_port_16;
input wire rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_22;
input wire rvx_port_07;
input wire [RVX_GPARA_2-1:0] rvx_port_27;
output wire [RVX_GPARA_2-1:0] rvx_port_42;
output reg rvx_port_23;
output reg rvx_port_31;

input wire rvx_port_11;

output wire rvx_port_35;
input wire [3-1:0] rvx_port_52;

output wire rvx_port_50;

output wire [32-1:0] rvx_port_37;

output wire rvx_port_20;
output wire rvx_port_18;
output wire [RVX_GPARA_2-1:0] rvx_port_43;
output wire rvx_port_19;
output wire rvx_port_17;
output wire [RVX_GPARA_2-1:0] rvx_port_08;
input wire rvx_port_09;
output wire [32-1:0] rvx_port_44;

output wire rvx_port_32;
output wire rvx_port_13;
output wire [RVX_GPARA_2-1:0] rvx_port_02;
output wire rvx_port_39;
output wire rvx_port_40;
output wire [RVX_GPARA_2-1:0] rvx_port_41;
input wire rvx_port_25;
output wire [32-1:0] rvx_port_48;

output wire rvx_port_12;
output wire rvx_port_34;
output wire [RVX_GPARA_2-1:0] rvx_port_10;
output wire rvx_port_14;
output wire rvx_port_38;
output wire [RVX_GPARA_2-1:0] rvx_port_28;
input wire rvx_port_47;
output wire [32-1:0] rvx_port_53;

output wire rvx_port_01;
output wire rvx_port_45;
output wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire rvx_port_46;
output wire rvx_port_36;
output wire [RVX_GPARA_2-1:0] rvx_port_29;
input wire rvx_port_05;
output wire [32-1:0] rvx_port_49;

output wire rvx_port_33;
output wire rvx_port_51;
output wire [RVX_GPARA_2-1:0] rvx_port_06;
output wire rvx_port_15;
output wire rvx_port_00;
output wire [RVX_GPARA_2-1:0] rvx_port_30;
input wire rvx_port_21;
output wire [32-1:0] rvx_port_26;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_063;
reg [RVX_GPARA_2-1:0] rvx_signal_009;
wire rvx_signal_012;
wire rvx_signal_071;
wire rvx_signal_017;

wire [`RVX_GDEF_266-1:0] paddr_offset = rvx_port_22;
wire [`RVX_GDEF_266-1:0] rvx_signal_084;
wire [RVX_GPARA_1-1:0] rvx_signal_053;
wire [`RVX_GDEF_632-1:0] rvx_signal_082;
wire [`RVX_GDEF_632-1:0] addr_unused = 0;
reg rvx_signal_092;
wire [3-1:0] rvx_signal_070;
reg rvx_signal_020;
wire [3-1:0] rvx_signal_019;
wire rvx_signal_016;
reg rvx_signal_057;
wire [1-1:0] rvx_signal_072;
reg rvx_signal_006;
wire [1-1:0] rvx_signal_066;
wire rvx_signal_013;
reg rvx_signal_091;
wire [32-1:0] rvx_signal_014;
reg rvx_signal_080;
wire [32-1:0] rvx_signal_021;
wire rvx_signal_056;
reg [32-1:0] rvx_signal_069;
reg rvx_signal_029;
wire [32-1:0] rvx_signal_060;
reg rvx_signal_028;
wire [32-1:0] rvx_signal_096;
wire rvx_signal_099;
wire rvx_signal_064;
wire rvx_signal_055;
wire rvx_signal_089;
wire [32-1:0] rvx_signal_067;
wire [RVX_GPARA_2-1:0] rvx_signal_078;
wire rvx_signal_061;
wire rvx_signal_054;
wire rvx_signal_079;
wire [32-1:0] rvx_signal_043;
wire [RVX_GPARA_2-1:0] rvx_signal_023;
reg rvx_signal_065;
wire [32-1:0] rvx_signal_048;
reg rvx_signal_027;
wire [32-1:0] rvx_signal_052;
wire rvx_signal_011;
wire rvx_signal_032;
wire rvx_signal_005;
wire rvx_signal_002;
wire [32-1:0] rvx_signal_035;
wire [RVX_GPARA_2-1:0] rvx_signal_042;
wire rvx_signal_086;
wire rvx_signal_049;
wire rvx_signal_031;
wire [32-1:0] rvx_signal_003;
wire [RVX_GPARA_2-1:0] rvx_signal_033;
reg rvx_signal_098;
wire [32-1:0] rvx_signal_030;
reg rvx_signal_093;
wire [32-1:0] rvx_signal_026;
wire rvx_signal_058;
wire rvx_signal_001;
wire rvx_signal_007;
wire rvx_signal_083;
wire [32-1:0] rvx_signal_068;
wire [RVX_GPARA_2-1:0] rvx_signal_004;
wire rvx_signal_073;
wire rvx_signal_076;
wire rvx_signal_050;
wire [32-1:0] rvx_signal_097;
wire [RVX_GPARA_2-1:0] rvx_signal_038;
reg rvx_signal_062;
wire [32-1:0] rvx_signal_090;
reg rvx_signal_044;
wire [32-1:0] rvx_signal_015;
wire rvx_signal_075;
wire rvx_signal_051;
wire rvx_signal_081;
wire rvx_signal_077;
wire [32-1:0] rvx_signal_022;
wire [RVX_GPARA_2-1:0] rvx_signal_041;
wire rvx_signal_040;
wire rvx_signal_024;
wire rvx_signal_000;
wire [32-1:0] rvx_signal_039;
wire [RVX_GPARA_2-1:0] rvx_signal_025;
reg rvx_signal_100;
wire [32-1:0] rvx_signal_034;
reg rvx_signal_037;
wire [32-1:0] rvx_signal_045;
wire rvx_signal_087;
wire rvx_signal_018;
wire rvx_signal_036;
wire rvx_signal_010;
wire [32-1:0] rvx_signal_088;
wire [RVX_GPARA_2-1:0] rvx_signal_046;
wire rvx_signal_047;
wire rvx_signal_095;
wire rvx_signal_074;
wire [32-1:0] rvx_signal_085;
wire [RVX_GPARA_2-1:0] rvx_signal_094;

assign rvx_signal_063 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_27);
assign rvx_port_42 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_009);
assign {rvx_signal_053,rvx_signal_082} = paddr_offset;
assign rvx_signal_084 = {rvx_signal_053,addr_unused};
assign rvx_signal_017 = (rvx_signal_082==0);
assign rvx_signal_012 = rvx_port_16 & rvx_port_04 & rvx_signal_017 & (~rvx_port_07);
assign rvx_signal_071 = rvx_port_16 & rvx_port_04 & rvx_signal_017 & rvx_port_07;

assign rvx_signal_019 = $unsigned(rvx_port_27);
assign rvx_signal_066 = $unsigned(rvx_port_27);
assign rvx_signal_021 = $unsigned(rvx_port_27);
assign rvx_signal_096 = $unsigned(rvx_port_27);
assign rvx_signal_052 = $unsigned(rvx_port_27);
assign rvx_signal_026 = $unsigned(rvx_port_27);
assign rvx_signal_015 = $unsigned(rvx_port_27);
assign rvx_signal_045 = $unsigned(rvx_port_27);

always@(*)
begin
	rvx_port_31 = 0;
	rvx_signal_009 = 0;
	rvx_port_23 = 1;

	rvx_signal_092 = 0;
	rvx_signal_020 = 0;

	rvx_signal_057 = 0;
	rvx_signal_006 = 0;

	rvx_signal_091 = 0;
	rvx_signal_080 = 0;

	rvx_signal_029 = 0;
	rvx_signal_028 = 0;

	rvx_signal_065 = 0;
	rvx_signal_027 = 0;

	rvx_signal_098 = 0;
	rvx_signal_093 = 0;

	rvx_signal_062 = 0;
	rvx_signal_044 = 0;

	rvx_signal_100 = 0;
	rvx_signal_037 = 0;

	if(rvx_port_16==1'b 1)
	begin
		case(rvx_signal_084)
			`RVX_GDEF_520:
			begin
				rvx_signal_092 = rvx_signal_012;
				rvx_signal_020 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_070);
				rvx_port_23 = rvx_signal_016;
			end
			`RVX_GDEF_590:
			begin
				rvx_signal_057 = rvx_signal_012;
				rvx_signal_006 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_072);
				rvx_port_23 = rvx_signal_013;
			end
			`RVX_GDEF_260:
			begin
				rvx_signal_091 = rvx_signal_012;
				rvx_signal_080 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_014);
				rvx_port_23 = rvx_signal_056;
			end
			`RVX_GDEF_298:
			begin
				rvx_signal_029 = rvx_signal_012;
				rvx_signal_028 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_060);
				rvx_port_23 = rvx_signal_099;
			end
			`RVX_GDEF_542:
			begin
				rvx_signal_065 = rvx_signal_012;
				rvx_signal_027 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_048);
				rvx_port_23 = rvx_signal_011;
			end
			`RVX_GDEF_655:
			begin
				rvx_signal_098 = rvx_signal_012;
				rvx_signal_093 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_030);
				rvx_port_23 = rvx_signal_058;
			end
			`RVX_GDEF_396:
			begin
				rvx_signal_062 = rvx_signal_012;
				rvx_signal_044 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_090);
				rvx_port_23 = rvx_signal_075;
			end
			`RVX_GDEF_336:
			begin
				rvx_signal_100 = rvx_signal_012;
				rvx_signal_037 = rvx_signal_071;
				rvx_signal_009 = $unsigned(rvx_signal_034);
				rvx_port_23 = rvx_signal_087;
			end
			default:
				rvx_port_31 = 1;
		endcase
	end
end

always@(posedge rvx_port_24, negedge rvx_port_54)
begin
	if(rvx_port_54==0)
		rvx_signal_069 <= `RVX_GDEF_416;
	else if (rvx_signal_080==1'b 1)
		rvx_signal_069 <= rvx_signal_021;
end
assign rvx_signal_014 = rvx_signal_069;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_54),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_064),
	.wfull(rvx_signal_055),
	.wrequest(rvx_signal_089),
	.wdata(rvx_signal_067),
	.wnum(rvx_signal_078),
	.rready(rvx_signal_061),
	.rempty(rvx_signal_054),
	.rrequest(rvx_signal_079),
	.rdata(rvx_signal_043),
	.rnum(rvx_signal_023)
);
assign rvx_port_20 = rvx_signal_064;
assign rvx_port_18 = rvx_signal_055;
assign rvx_port_43 = rvx_signal_078;
assign rvx_port_19 = rvx_signal_061;
assign rvx_port_17 = rvx_signal_054;
assign rvx_port_08 = rvx_signal_023;
assign rvx_signal_089 = rvx_signal_028;
assign rvx_signal_067 = rvx_signal_096;
assign rvx_signal_060 = rvx_signal_078;
assign rvx_signal_079 = rvx_port_09;
assign rvx_port_44 = rvx_signal_043;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_2
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_54),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_032),
	.wfull(rvx_signal_005),
	.wrequest(rvx_signal_002),
	.wdata(rvx_signal_035),
	.wnum(rvx_signal_042),
	.rready(rvx_signal_086),
	.rempty(rvx_signal_049),
	.rrequest(rvx_signal_031),
	.rdata(rvx_signal_003),
	.rnum(rvx_signal_033)
);
assign rvx_port_32 = rvx_signal_032;
assign rvx_port_13 = rvx_signal_005;
assign rvx_port_02 = rvx_signal_042;
assign rvx_port_39 = rvx_signal_086;
assign rvx_port_40 = rvx_signal_049;
assign rvx_port_41 = rvx_signal_033;
assign rvx_signal_002 = rvx_signal_027;
assign rvx_signal_035 = rvx_signal_052;
assign rvx_signal_048 = rvx_signal_042;
assign rvx_signal_031 = rvx_port_25;
assign rvx_port_48 = rvx_signal_003;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_3
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_54),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_001),
	.wfull(rvx_signal_007),
	.wrequest(rvx_signal_083),
	.wdata(rvx_signal_068),
	.wnum(rvx_signal_004),
	.rready(rvx_signal_073),
	.rempty(rvx_signal_076),
	.rrequest(rvx_signal_050),
	.rdata(rvx_signal_097),
	.rnum(rvx_signal_038)
);
assign rvx_port_12 = rvx_signal_001;
assign rvx_port_34 = rvx_signal_007;
assign rvx_port_10 = rvx_signal_004;
assign rvx_port_14 = rvx_signal_073;
assign rvx_port_38 = rvx_signal_076;
assign rvx_port_28 = rvx_signal_038;
assign rvx_signal_083 = rvx_signal_093;
assign rvx_signal_068 = rvx_signal_026;
assign rvx_signal_030 = rvx_signal_004;
assign rvx_signal_050 = rvx_port_47;
assign rvx_port_53 = rvx_signal_097;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_54),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_051),
	.wfull(rvx_signal_081),
	.wrequest(rvx_signal_077),
	.wdata(rvx_signal_022),
	.wnum(rvx_signal_041),
	.rready(rvx_signal_040),
	.rempty(rvx_signal_024),
	.rrequest(rvx_signal_000),
	.rdata(rvx_signal_039),
	.rnum(rvx_signal_025)
);
assign rvx_port_01 = rvx_signal_051;
assign rvx_port_45 = rvx_signal_081;
assign rvx_port_03 = rvx_signal_041;
assign rvx_port_46 = rvx_signal_040;
assign rvx_port_36 = rvx_signal_024;
assign rvx_port_29 = rvx_signal_025;
assign rvx_signal_077 = rvx_signal_044;
assign rvx_signal_022 = rvx_signal_015;
assign rvx_signal_090 = rvx_signal_041;
assign rvx_signal_000 = rvx_port_05;
assign rvx_port_49 = rvx_signal_039;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_4
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_54),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_018),
	.wfull(rvx_signal_036),
	.wrequest(rvx_signal_010),
	.wdata(rvx_signal_088),
	.wnum(rvx_signal_046),
	.rready(rvx_signal_047),
	.rempty(rvx_signal_095),
	.rrequest(rvx_signal_074),
	.rdata(rvx_signal_085),
	.rnum(rvx_signal_094)
);
assign rvx_port_33 = rvx_signal_018;
assign rvx_port_51 = rvx_signal_036;
assign rvx_port_06 = rvx_signal_046;
assign rvx_port_15 = rvx_signal_047;
assign rvx_port_00 = rvx_signal_095;
assign rvx_port_30 = rvx_signal_094;
assign rvx_signal_010 = rvx_signal_037;
assign rvx_signal_088 = rvx_signal_045;
assign rvx_signal_034 = rvx_signal_046;
assign rvx_signal_074 = rvx_port_21;
assign rvx_port_26 = rvx_signal_085;
assign rvx_port_35 = rvx_signal_092;
assign rvx_signal_070 = rvx_port_52;
assign rvx_signal_016 = 1;
assign rvx_port_50 = rvx_signal_006;
assign rvx_signal_072 = 0;
assign rvx_signal_013 = 1;
assign rvx_port_37 = rvx_signal_069;
assign rvx_signal_056 = 1;
assign rvx_signal_099 = 1;
assign rvx_signal_011 = 1;
assign rvx_signal_058 = 1;
assign rvx_signal_075 = 1;
assign rvx_signal_087 = 1;

endmodule
