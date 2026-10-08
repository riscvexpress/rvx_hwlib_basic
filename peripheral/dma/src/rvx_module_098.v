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





module RVX_MODULE_098
(
	rvx_port_26,
	rvx_port_31,

	rvx_port_38,
	rvx_port_52,
	rvx_port_22,
	rvx_port_49,
	rvx_port_09,
	rvx_port_46,
	rvx_port_40,
	rvx_port_10,

	rvx_port_29,
	rvx_port_51,
	rvx_port_50,
	rvx_port_47,
	rvx_port_07,
	rvx_port_21,
	rvx_port_11,
	rvx_port_48,
	rvx_port_39,
	rvx_port_08,
	rvx_port_30,
	rvx_port_37,
	rvx_port_24,
	rvx_port_44,
	rvx_port_25,
	rvx_port_12,
	rvx_port_53,
	rvx_port_16,
	rvx_port_43,
	rvx_port_06,
	rvx_port_18,
	rvx_port_42,
	rvx_port_20,
	rvx_port_02,
	rvx_port_03,
	rvx_port_17,
	rvx_port_32,
	rvx_port_13,
	rvx_port_36,
	rvx_port_19,
	rvx_port_14,
	rvx_port_41,
	rvx_port_15,
	rvx_port_35,
	rvx_port_28,
	rvx_port_04,
	rvx_port_45,
	rvx_port_54,
	rvx_port_27,
	rvx_port_23,
	rvx_port_34,
	rvx_port_00,
	rvx_port_05,
	rvx_port_33,
	rvx_port_01
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_26, rvx_port_31;
input wire rvx_port_38;
input wire rvx_port_52;
input wire [RVX_GPARA_1-1:0] rvx_port_22;
input wire rvx_port_49;
input wire [RVX_GPARA_0-1:0] rvx_port_09;
output wire [RVX_GPARA_0-1:0] rvx_port_46;
output reg rvx_port_40;
output reg rvx_port_10;

input wire rvx_port_29;

output wire rvx_port_51;
input wire [3-1:0] rvx_port_50;

output wire rvx_port_47;

output wire [32-1:0] rvx_port_07;

output wire rvx_port_30;
output wire rvx_port_37;
output wire [RVX_GPARA_0-1:0] rvx_port_24;
output wire rvx_port_21;
output wire rvx_port_11;
output wire [RVX_GPARA_0-1:0] rvx_port_48;
input wire rvx_port_39;
output wire [32-1:0] rvx_port_08;

output wire rvx_port_43;
output wire rvx_port_06;
output wire [RVX_GPARA_0-1:0] rvx_port_18;
output wire rvx_port_44;
output wire rvx_port_25;
output wire [RVX_GPARA_0-1:0] rvx_port_12;
input wire rvx_port_53;
output wire [32-1:0] rvx_port_16;

output wire rvx_port_32;
output wire rvx_port_13;
output wire [RVX_GPARA_0-1:0] rvx_port_36;
output wire rvx_port_42;
output wire rvx_port_20;
output wire [RVX_GPARA_0-1:0] rvx_port_02;
input wire rvx_port_03;
output wire [32-1:0] rvx_port_17;

output wire rvx_port_28;
output wire rvx_port_04;
output wire [RVX_GPARA_0-1:0] rvx_port_45;
output wire rvx_port_19;
output wire rvx_port_14;
output wire [RVX_GPARA_0-1:0] rvx_port_41;
input wire rvx_port_15;
output wire [32-1:0] rvx_port_35;

output wire rvx_port_05;
output wire rvx_port_33;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output wire rvx_port_54;
output wire rvx_port_27;
output wire [RVX_GPARA_0-1:0] rvx_port_23;
input wire rvx_port_34;
output wire [32-1:0] rvx_port_00;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_014;
reg [RVX_GPARA_0-1:0] rvx_signal_091;
wire rvx_signal_003;
wire rvx_signal_015;
wire rvx_signal_018;

wire [`RVX_GDEF_650-1:0] paddr_offset = rvx_port_22;
wire [`RVX_GDEF_650-1:0] rvx_signal_054;
wire [RVX_GPARA_1-1:0] rvx_signal_062;
wire [`RVX_GDEF_124-1:0] rvx_signal_077;
wire [`RVX_GDEF_124-1:0] addr_unused = 0;
reg rvx_signal_049;
wire [3-1:0] rvx_signal_048;
reg rvx_signal_047;
wire [3-1:0] rvx_signal_023;
wire rvx_signal_033;
reg rvx_signal_057;
wire [1-1:0] rvx_signal_017;
reg rvx_signal_040;
wire [1-1:0] rvx_signal_025;
wire rvx_signal_081;
reg rvx_signal_069;
wire [32-1:0] rvx_signal_001;
reg rvx_signal_053;
wire [32-1:0] rvx_signal_020;
wire rvx_signal_075;
reg [32-1:0] rvx_signal_007;
reg rvx_signal_031;
wire [32-1:0] rvx_signal_000;
reg rvx_signal_051;
wire [32-1:0] rvx_signal_043;
wire rvx_signal_068;
wire rvx_signal_022;
wire rvx_signal_085;
wire rvx_signal_046;
wire [32-1:0] rvx_signal_013;
wire [RVX_GPARA_0-1:0] rvx_signal_002;
wire rvx_signal_037;
wire rvx_signal_005;
wire rvx_signal_059;
wire [32-1:0] rvx_signal_086;
wire [RVX_GPARA_0-1:0] rvx_signal_084;
reg rvx_signal_052;
wire [32-1:0] rvx_signal_050;
reg rvx_signal_089;
wire [32-1:0] rvx_signal_061;
wire rvx_signal_006;
wire rvx_signal_012;
wire rvx_signal_016;
wire rvx_signal_009;
wire [32-1:0] rvx_signal_076;
wire [RVX_GPARA_0-1:0] rvx_signal_079;
wire rvx_signal_055;
wire rvx_signal_078;
wire rvx_signal_066;
wire [32-1:0] rvx_signal_083;
wire [RVX_GPARA_0-1:0] rvx_signal_070;
reg rvx_signal_010;
wire [32-1:0] rvx_signal_058;
reg rvx_signal_063;
wire [32-1:0] rvx_signal_071;
wire rvx_signal_088;
wire rvx_signal_036;
wire rvx_signal_092;
wire rvx_signal_090;
wire [32-1:0] rvx_signal_094;
wire [RVX_GPARA_0-1:0] rvx_signal_067;
wire rvx_signal_044;
wire rvx_signal_039;
wire rvx_signal_042;
wire [32-1:0] rvx_signal_060;
wire [RVX_GPARA_0-1:0] rvx_signal_026;
reg rvx_signal_027;
wire [32-1:0] rvx_signal_097;
reg rvx_signal_099;
wire [32-1:0] rvx_signal_095;
wire rvx_signal_096;
wire rvx_signal_080;
wire rvx_signal_100;
wire rvx_signal_021;
wire [32-1:0] rvx_signal_029;
wire [RVX_GPARA_0-1:0] rvx_signal_041;
wire rvx_signal_074;
wire rvx_signal_038;
wire rvx_signal_019;
wire [32-1:0] rvx_signal_056;
wire [RVX_GPARA_0-1:0] rvx_signal_028;
reg rvx_signal_064;
wire [32-1:0] rvx_signal_093;
reg rvx_signal_073;
wire [32-1:0] rvx_signal_011;
wire rvx_signal_035;
wire rvx_signal_072;
wire rvx_signal_082;
wire rvx_signal_032;
wire [32-1:0] rvx_signal_045;
wire [RVX_GPARA_0-1:0] rvx_signal_024;
wire rvx_signal_098;
wire rvx_signal_030;
wire rvx_signal_034;
wire [32-1:0] rvx_signal_087;
wire [RVX_GPARA_0-1:0] rvx_signal_065;

assign rvx_signal_014 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_09);
assign rvx_port_46 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_091);
assign {rvx_signal_062,rvx_signal_077} = paddr_offset;
assign rvx_signal_054 = {rvx_signal_062,addr_unused};
assign rvx_signal_018 = (rvx_signal_077==0);
assign rvx_signal_003 = rvx_port_38 & rvx_port_52 & rvx_signal_018 & (~rvx_port_49);
assign rvx_signal_015 = rvx_port_38 & rvx_port_52 & rvx_signal_018 & rvx_port_49;

assign rvx_signal_023 = $unsigned(rvx_port_09);
assign rvx_signal_025 = $unsigned(rvx_port_09);
assign rvx_signal_020 = $unsigned(rvx_port_09);
assign rvx_signal_043 = $unsigned(rvx_port_09);
assign rvx_signal_061 = $unsigned(rvx_port_09);
assign rvx_signal_071 = $unsigned(rvx_port_09);
assign rvx_signal_095 = $unsigned(rvx_port_09);
assign rvx_signal_011 = $unsigned(rvx_port_09);

always@(*)
begin
	rvx_port_10 = 0;
	rvx_signal_091 = 0;
	rvx_port_40 = 1;

	rvx_signal_049 = 0;
	rvx_signal_047 = 0;

	rvx_signal_057 = 0;
	rvx_signal_040 = 0;

	rvx_signal_069 = 0;
	rvx_signal_053 = 0;

	rvx_signal_031 = 0;
	rvx_signal_051 = 0;

	rvx_signal_052 = 0;
	rvx_signal_089 = 0;

	rvx_signal_010 = 0;
	rvx_signal_063 = 0;

	rvx_signal_027 = 0;
	rvx_signal_099 = 0;

	rvx_signal_064 = 0;
	rvx_signal_073 = 0;

	if(rvx_port_38==1'b 1)
	begin
		case(rvx_signal_054)
			`RVX_GDEF_566:
			begin
				rvx_signal_049 = rvx_signal_003;
				rvx_signal_047 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_048);
				rvx_port_40 = rvx_signal_033;
			end
			`RVX_GDEF_576:
			begin
				rvx_signal_057 = rvx_signal_003;
				rvx_signal_040 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_017);
				rvx_port_40 = rvx_signal_081;
			end
			`RVX_GDEF_237:
			begin
				rvx_signal_069 = rvx_signal_003;
				rvx_signal_053 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_001);
				rvx_port_40 = rvx_signal_075;
			end
			`RVX_GDEF_036:
			begin
				rvx_signal_031 = rvx_signal_003;
				rvx_signal_051 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_000);
				rvx_port_40 = rvx_signal_068;
			end
			`RVX_GDEF_558:
			begin
				rvx_signal_052 = rvx_signal_003;
				rvx_signal_089 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_050);
				rvx_port_40 = rvx_signal_006;
			end
			`RVX_GDEF_414:
			begin
				rvx_signal_010 = rvx_signal_003;
				rvx_signal_063 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_058);
				rvx_port_40 = rvx_signal_088;
			end
			`RVX_GDEF_196:
			begin
				rvx_signal_027 = rvx_signal_003;
				rvx_signal_099 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_097);
				rvx_port_40 = rvx_signal_096;
			end
			`RVX_GDEF_151:
			begin
				rvx_signal_064 = rvx_signal_003;
				rvx_signal_073 = rvx_signal_015;
				rvx_signal_091 = $unsigned(rvx_signal_093);
				rvx_port_40 = rvx_signal_035;
			end
			default:
				rvx_port_10 = 1;
		endcase
	end
end

always@(posedge rvx_port_26, negedge rvx_port_31)
begin
	if(rvx_port_31==0)
		rvx_signal_007 <= `RVX_GDEF_381;
	else if (rvx_signal_053==1'b 1)
		rvx_signal_007 <= rvx_signal_020;
end
assign rvx_signal_001 = rvx_signal_007;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_26),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_022),
	.wfull(rvx_signal_085),
	.wrequest(rvx_signal_046),
	.wdata(rvx_signal_013),
	.wnum(rvx_signal_002),
	.rready(rvx_signal_037),
	.rempty(rvx_signal_005),
	.rrequest(rvx_signal_059),
	.rdata(rvx_signal_086),
	.rnum(rvx_signal_084)
);
assign rvx_port_30 = rvx_signal_022;
assign rvx_port_37 = rvx_signal_085;
assign rvx_port_24 = rvx_signal_002;
assign rvx_port_21 = rvx_signal_037;
assign rvx_port_11 = rvx_signal_005;
assign rvx_port_48 = rvx_signal_084;
assign rvx_signal_046 = rvx_signal_051;
assign rvx_signal_013 = rvx_signal_043;
assign rvx_signal_000 = rvx_signal_002;
assign rvx_signal_059 = rvx_port_39;
assign rvx_port_08 = rvx_signal_086;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_2
(
	.clk(rvx_port_26),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_012),
	.wfull(rvx_signal_016),
	.wrequest(rvx_signal_009),
	.wdata(rvx_signal_076),
	.wnum(rvx_signal_079),
	.rready(rvx_signal_055),
	.rempty(rvx_signal_078),
	.rrequest(rvx_signal_066),
	.rdata(rvx_signal_083),
	.rnum(rvx_signal_070)
);
assign rvx_port_43 = rvx_signal_012;
assign rvx_port_06 = rvx_signal_016;
assign rvx_port_18 = rvx_signal_079;
assign rvx_port_44 = rvx_signal_055;
assign rvx_port_25 = rvx_signal_078;
assign rvx_port_12 = rvx_signal_070;
assign rvx_signal_009 = rvx_signal_089;
assign rvx_signal_076 = rvx_signal_061;
assign rvx_signal_050 = rvx_signal_079;
assign rvx_signal_066 = rvx_port_53;
assign rvx_port_16 = rvx_signal_083;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_26),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_036),
	.wfull(rvx_signal_092),
	.wrequest(rvx_signal_090),
	.wdata(rvx_signal_094),
	.wnum(rvx_signal_067),
	.rready(rvx_signal_044),
	.rempty(rvx_signal_039),
	.rrequest(rvx_signal_042),
	.rdata(rvx_signal_060),
	.rnum(rvx_signal_026)
);
assign rvx_port_32 = rvx_signal_036;
assign rvx_port_13 = rvx_signal_092;
assign rvx_port_36 = rvx_signal_067;
assign rvx_port_42 = rvx_signal_044;
assign rvx_port_20 = rvx_signal_039;
assign rvx_port_02 = rvx_signal_026;
assign rvx_signal_090 = rvx_signal_063;
assign rvx_signal_094 = rvx_signal_071;
assign rvx_signal_058 = rvx_signal_067;
assign rvx_signal_042 = rvx_port_03;
assign rvx_port_17 = rvx_signal_060;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_3
(
	.clk(rvx_port_26),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_080),
	.wfull(rvx_signal_100),
	.wrequest(rvx_signal_021),
	.wdata(rvx_signal_029),
	.wnum(rvx_signal_041),
	.rready(rvx_signal_074),
	.rempty(rvx_signal_038),
	.rrequest(rvx_signal_019),
	.rdata(rvx_signal_056),
	.rnum(rvx_signal_028)
);
assign rvx_port_28 = rvx_signal_080;
assign rvx_port_04 = rvx_signal_100;
assign rvx_port_45 = rvx_signal_041;
assign rvx_port_19 = rvx_signal_074;
assign rvx_port_14 = rvx_signal_038;
assign rvx_port_41 = rvx_signal_028;
assign rvx_signal_021 = rvx_signal_099;
assign rvx_signal_029 = rvx_signal_095;
assign rvx_signal_097 = rvx_signal_041;
assign rvx_signal_019 = rvx_port_15;
assign rvx_port_35 = rvx_signal_056;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_4
(
	.clk(rvx_port_26),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_072),
	.wfull(rvx_signal_082),
	.wrequest(rvx_signal_032),
	.wdata(rvx_signal_045),
	.wnum(rvx_signal_024),
	.rready(rvx_signal_098),
	.rempty(rvx_signal_030),
	.rrequest(rvx_signal_034),
	.rdata(rvx_signal_087),
	.rnum(rvx_signal_065)
);
assign rvx_port_05 = rvx_signal_072;
assign rvx_port_33 = rvx_signal_082;
assign rvx_port_01 = rvx_signal_024;
assign rvx_port_54 = rvx_signal_098;
assign rvx_port_27 = rvx_signal_030;
assign rvx_port_23 = rvx_signal_065;
assign rvx_signal_032 = rvx_signal_073;
assign rvx_signal_045 = rvx_signal_011;
assign rvx_signal_093 = rvx_signal_024;
assign rvx_signal_034 = rvx_port_34;
assign rvx_port_00 = rvx_signal_087;
assign rvx_port_51 = rvx_signal_049;
assign rvx_signal_048 = rvx_port_50;
assign rvx_signal_033 = 1;
assign rvx_port_47 = rvx_signal_040;
assign rvx_signal_017 = 0;
assign rvx_signal_081 = 1;
assign rvx_port_07 = rvx_signal_007;
assign rvx_signal_075 = 1;
assign rvx_signal_068 = 1;
assign rvx_signal_006 = 1;
assign rvx_signal_088 = 1;
assign rvx_signal_096 = 1;
assign rvx_signal_035 = 1;

endmodule
