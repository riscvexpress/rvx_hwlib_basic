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
`include "ervp_platform_controller_memorymap_offset.vh"




module RVX_MODULE_093
(
	rvx_port_23,
	rvx_port_16,

	rvx_port_14,
	rvx_port_22,
	rvx_port_08,
	rvx_port_27,
	rvx_port_20,
	rvx_port_21,
	rvx_port_36,
	rvx_port_07,

	rvx_port_25,
	rvx_port_02,
	rvx_port_34,
	rvx_port_11,
	rvx_port_06,
	rvx_port_15,
	rvx_port_29,
	rvx_port_37,
	rvx_port_35,
	rvx_port_32,
	rvx_port_33,
	rvx_port_13,
	rvx_port_30,
	rvx_port_10,
	rvx_port_17,
	rvx_port_19,
	rvx_port_26,
	rvx_port_31,
	rvx_port_18,
	rvx_port_12,
	rvx_port_09,
	rvx_port_00,
	rvx_port_24,
	rvx_port_01,
	rvx_port_03,
	rvx_port_04,
	rvx_port_28,
	rvx_port_05
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_23, rvx_port_16;
input wire rvx_port_14;
input wire rvx_port_22;
input wire [RVX_GPARA_1-1:0] rvx_port_08;
input wire rvx_port_27;
input wire [RVX_GPARA_0-1:0] rvx_port_20;
output wire [RVX_GPARA_0-1:0] rvx_port_21;
output reg rvx_port_36;
output reg rvx_port_07;

input wire rvx_port_25;

output wire rvx_port_02;
input wire [4-1:0] rvx_port_34;

output wire rvx_port_11;
input wire [1-1:0] rvx_port_06;

output wire rvx_port_15;
input wire [1-1:0] rvx_port_29;
output wire rvx_port_37;
output wire [1-1:0] rvx_port_35;

output wire rvx_port_32;
input wire [1-1:0] rvx_port_33;

output wire rvx_port_13;
input wire [32-1:0] rvx_port_30;
output wire rvx_port_10;
output wire [32-1:0] rvx_port_17;

output wire [32-1:0] rvx_port_19;

output wire rvx_port_26;
input wire [32-1:0] rvx_port_31;

output wire rvx_port_18;
input wire [32-1:0] rvx_port_12;

output wire rvx_port_09;
input wire [32-1:0] rvx_port_00;

output wire rvx_port_24;
input wire [32-1:0] rvx_port_01;

output wire [4-1:0] rvx_port_03;
input wire [(32)*(4)-1:0] rvx_port_04;

output wire [4-1:0] rvx_port_28;
input wire [(32)*(4)-1:0] rvx_port_05;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_016;
reg [RVX_GPARA_0-1:0] rvx_signal_078;
wire rvx_signal_042;
wire rvx_signal_100;
wire rvx_signal_022;

wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] paddr_offset = rvx_port_08;
wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_076;
wire [RVX_GPARA_1-1:0] rvx_signal_017;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_024;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] addr_unused = 0;
reg rvx_signal_050;
wire [4-1:0] rvx_signal_045;
reg rvx_signal_099;
wire [4-1:0] rvx_signal_038;
wire rvx_signal_058;
reg rvx_signal_033;
wire [1-1:0] rvx_signal_009;
reg rvx_signal_093;
wire [1-1:0] rvx_signal_067;
wire rvx_signal_003;
reg rvx_signal_037;
wire [1-1:0] rvx_signal_070;
reg rvx_signal_079;
wire [1-1:0] rvx_signal_001;
wire rvx_signal_098;
reg rvx_signal_026;
wire [1-1:0] rvx_signal_088;
reg rvx_signal_069;
wire [1-1:0] rvx_signal_087;
wire rvx_signal_047;
reg rvx_signal_040;
wire [32-1:0] rvx_signal_012;
reg rvx_signal_032;
wire [32-1:0] rvx_signal_014;
wire rvx_signal_054;
reg rvx_signal_049;
wire [32-1:0] rvx_signal_066;
reg rvx_signal_008;
wire [32-1:0] rvx_signal_060;
wire rvx_signal_010;
reg [32-1:0] rvx_signal_092;
reg rvx_signal_072;
wire [32-1:0] rvx_signal_081;
reg rvx_signal_090;
wire [32-1:0] rvx_signal_089;
wire rvx_signal_028;
reg rvx_signal_015;
wire [32-1:0] rvx_signal_055;
reg rvx_signal_018;
wire [32-1:0] rvx_signal_020;
wire rvx_signal_083;
reg rvx_signal_080;
wire [32-1:0] rvx_signal_068;
reg rvx_signal_000;
wire [32-1:0] rvx_signal_051;
wire rvx_signal_023;
reg rvx_signal_056;
wire [32-1:0] rvx_signal_039;
reg rvx_signal_073;
wire [32-1:0] rvx_signal_041;
wire rvx_signal_048;
reg rvx_signal_013;
wire [32-1:0] rvx_signal_035;
reg rvx_signal_062;
wire [32-1:0] rvx_signal_085;
wire rvx_signal_075;
reg rvx_signal_007;
wire [32-1:0] rvx_signal_064;
reg rvx_signal_074;
wire [32-1:0] rvx_signal_031;
wire rvx_signal_036;
reg rvx_signal_030;
wire [32-1:0] rvx_signal_006;
reg rvx_signal_097;
wire [32-1:0] rvx_signal_057;
wire rvx_signal_094;
reg rvx_signal_063;
wire [32-1:0] rvx_signal_027;
reg rvx_signal_046;
wire [32-1:0] rvx_signal_029;
wire rvx_signal_077;
reg rvx_signal_011;
wire [32-1:0] rvx_signal_096;
reg rvx_signal_086;
wire [32-1:0] rvx_signal_043;
wire rvx_signal_082;
reg rvx_signal_005;
wire [32-1:0] rvx_signal_052;
reg rvx_signal_004;
wire [32-1:0] rvx_signal_095;
wire rvx_signal_065;
reg rvx_signal_091;
wire [32-1:0] rvx_signal_059;
reg rvx_signal_053;
wire [32-1:0] rvx_signal_019;
wire rvx_signal_084;
reg rvx_signal_021;
wire [32-1:0] rvx_signal_044;
reg rvx_signal_034;
wire [32-1:0] rvx_signal_071;
wire rvx_signal_025;

assign rvx_signal_016 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_20);
assign rvx_port_21 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_078);
assign {rvx_signal_017,rvx_signal_024} = paddr_offset;
assign rvx_signal_076 = {rvx_signal_017,addr_unused};
assign rvx_signal_022 = (rvx_signal_024==0);
assign rvx_signal_042 = rvx_port_14 & rvx_port_22 & rvx_signal_022 & (~rvx_port_27);
assign rvx_signal_100 = rvx_port_14 & rvx_port_22 & rvx_signal_022 & rvx_port_27;

assign rvx_signal_038 = $unsigned(rvx_port_20);
assign rvx_signal_067 = $unsigned(rvx_port_20);
assign rvx_signal_001 = $unsigned(rvx_port_20);
assign rvx_signal_087 = $unsigned(rvx_port_20);
assign rvx_signal_014 = $unsigned(rvx_port_20);
assign rvx_signal_060 = $unsigned(rvx_port_20);
assign rvx_signal_089 = $unsigned(rvx_port_20);
assign rvx_signal_020 = $unsigned(rvx_port_20);
assign rvx_signal_051 = $unsigned(rvx_port_20);
assign rvx_signal_041 = $unsigned(rvx_port_20);
assign rvx_signal_085 = $unsigned(rvx_port_20);
assign rvx_signal_031 = $unsigned(rvx_port_20);
assign rvx_signal_057 = $unsigned(rvx_port_20);
assign rvx_signal_029 = $unsigned(rvx_port_20);
assign rvx_signal_043 = $unsigned(rvx_port_20);
assign rvx_signal_095 = $unsigned(rvx_port_20);
assign rvx_signal_019 = $unsigned(rvx_port_20);
assign rvx_signal_071 = $unsigned(rvx_port_20);

always@(*)
begin
	rvx_port_07 = 0;
	rvx_signal_078 = 0;
	rvx_port_36 = 1;

	rvx_signal_050 = 0;
	rvx_signal_099 = 0;

	rvx_signal_033 = 0;
	rvx_signal_093 = 0;

	rvx_signal_037 = 0;
	rvx_signal_079 = 0;

	rvx_signal_026 = 0;
	rvx_signal_069 = 0;

	rvx_signal_040 = 0;
	rvx_signal_032 = 0;

	rvx_signal_049 = 0;
	rvx_signal_008 = 0;

	rvx_signal_072 = 0;
	rvx_signal_090 = 0;

	rvx_signal_015 = 0;
	rvx_signal_018 = 0;

	rvx_signal_080 = 0;
	rvx_signal_000 = 0;

	rvx_signal_056 = 0;
	rvx_signal_073 = 0;

	rvx_signal_013 = 0;
	rvx_signal_062 = 0;

	rvx_signal_007 = 0;
	rvx_signal_074 = 0;

	rvx_signal_030 = 0;
	rvx_signal_097 = 0;

	rvx_signal_063 = 0;
	rvx_signal_046 = 0;

	rvx_signal_011 = 0;
	rvx_signal_086 = 0;

	rvx_signal_005 = 0;
	rvx_signal_004 = 0;

	rvx_signal_091 = 0;
	rvx_signal_053 = 0;

	rvx_signal_021 = 0;
	rvx_signal_034 = 0;

	if(rvx_port_14==1'b 1)
	begin
		case(rvx_signal_076)
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_MODE:
			begin
				rvx_signal_050 = rvx_signal_042;
				rvx_signal_099 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_045);
				rvx_port_36 = rvx_signal_058;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_INITIALIZED:
			begin
				rvx_signal_033 = rvx_signal_042;
				rvx_signal_093 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_009);
				rvx_port_36 = rvx_signal_003;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_SIM_ENV:
			begin
				rvx_signal_037 = rvx_signal_042;
				rvx_signal_079 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_070);
				rvx_port_36 = rvx_signal_098;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_JTAG_SELECT:
			begin
				rvx_signal_026 = rvx_signal_042;
				rvx_signal_069 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_088);
				rvx_port_36 = rvx_signal_047;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_STATUS:
			begin
				rvx_signal_040 = rvx_signal_042;
				rvx_signal_032 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_012);
				rvx_port_36 = rvx_signal_054;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_APP_ADDR:
			begin
				rvx_signal_049 = rvx_signal_042;
				rvx_signal_008 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_066);
				rvx_port_36 = rvx_signal_010;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_AUTO_ID:
			begin
				rvx_signal_072 = rvx_signal_042;
				rvx_signal_090 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_081);
				rvx_port_36 = rvx_signal_028;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_STATUS:
			begin
				rvx_signal_015 = rvx_signal_042;
				rvx_signal_018 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_055);
				rvx_port_36 = rvx_signal_083;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC00:
			begin
				rvx_signal_080 = rvx_signal_042;
				rvx_signal_000 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_068);
				rvx_port_36 = rvx_signal_023;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC01:
			begin
				rvx_signal_056 = rvx_signal_042;
				rvx_signal_073 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_039);
				rvx_port_36 = rvx_signal_048;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC02:
			begin
				rvx_signal_013 = rvx_signal_042;
				rvx_signal_062 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_035);
				rvx_port_36 = rvx_signal_075;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC03:
			begin
				rvx_signal_007 = rvx_signal_042;
				rvx_signal_074 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_064);
				rvx_port_36 = rvx_signal_036;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST00:
			begin
				rvx_signal_030 = rvx_signal_042;
				rvx_signal_097 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_006);
				rvx_port_36 = rvx_signal_094;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST01:
			begin
				rvx_signal_063 = rvx_signal_042;
				rvx_signal_046 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_027);
				rvx_port_36 = rvx_signal_077;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST02:
			begin
				rvx_signal_011 = rvx_signal_042;
				rvx_signal_086 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_096);
				rvx_port_36 = rvx_signal_082;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST03:
			begin
				rvx_signal_005 = rvx_signal_042;
				rvx_signal_004 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_052);
				rvx_port_36 = rvx_signal_065;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_IMP_TYPE:
			begin
				rvx_signal_091 = rvx_signal_042;
				rvx_signal_053 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_059);
				rvx_port_36 = rvx_signal_084;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_BASE_ADDR:
			begin
				rvx_signal_021 = rvx_signal_042;
				rvx_signal_034 = rvx_signal_100;
				rvx_signal_078 = $unsigned(rvx_signal_044);
				rvx_port_36 = rvx_signal_025;
			end
			default:
				rvx_port_07 = 1;
		endcase
	end
end

always@(posedge rvx_port_23, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_092 <= `PLATFORM_REGISTER_APP_ADDR_DEFAULT_VALUE;
	else if (rvx_signal_008==1'b 1)
		rvx_signal_092 <= rvx_signal_060;
end
assign rvx_signal_066 = rvx_signal_092;
assign rvx_port_02 = rvx_signal_050;
assign rvx_signal_045 = rvx_port_34;
assign rvx_signal_058 = 1;
assign rvx_port_11 = rvx_signal_033;
assign rvx_signal_009 = rvx_port_06;
assign rvx_signal_003 = 1;
assign rvx_port_15 = rvx_signal_037;
assign rvx_signal_070 = rvx_port_29;
assign rvx_port_37 = rvx_signal_079;
assign rvx_port_35 = rvx_signal_001;
assign rvx_signal_098 = 1;
assign rvx_port_32 = rvx_signal_026;
assign rvx_signal_088 = rvx_port_33;
assign rvx_signal_047 = 1;
assign rvx_port_13 = rvx_signal_040;
assign rvx_signal_012 = rvx_port_30;
assign rvx_port_10 = rvx_signal_032;
assign rvx_port_17 = rvx_signal_014;
assign rvx_signal_054 = 1;
assign rvx_port_19 = rvx_signal_092;
assign rvx_signal_010 = 1;
assign rvx_port_26 = rvx_signal_072;
assign rvx_signal_081 = rvx_port_31;
assign rvx_signal_028 = 1;
assign rvx_port_18 = rvx_signal_015;
assign rvx_signal_055 = rvx_port_12;
assign rvx_signal_083 = 1;
assign rvx_port_09 = rvx_signal_091;
assign rvx_signal_059 = rvx_port_00;
assign rvx_signal_084 = 1;
assign rvx_port_24 = rvx_signal_021;
assign rvx_signal_044 = rvx_port_01;
assign rvx_signal_025 = 1;

assign rvx_port_03[00] = rvx_signal_080;
assign rvx_signal_068 = rvx_port_04[(32)*((00)+1)-1-:32];

assign rvx_port_03[01] = rvx_signal_056;
assign rvx_signal_039 = rvx_port_04[(32)*((01)+1)-1-:32];

assign rvx_port_03[02] = rvx_signal_013;
assign rvx_signal_035 = rvx_port_04[(32)*((02)+1)-1-:32];

assign rvx_port_03[03] = rvx_signal_007;
assign rvx_signal_064 = rvx_port_04[(32)*((03)+1)-1-:32];

assign rvx_signal_023 = 1;

assign rvx_signal_048 = 1;

assign rvx_signal_075 = 1;

assign rvx_signal_036 = 1;

assign rvx_port_28[00] = rvx_signal_030;
assign rvx_signal_006 = rvx_port_05[(32)*((00)+1)-1-:32];

assign rvx_port_28[01] = rvx_signal_063;
assign rvx_signal_027 = rvx_port_05[(32)*((01)+1)-1-:32];

assign rvx_port_28[02] = rvx_signal_011;
assign rvx_signal_096 = rvx_port_05[(32)*((02)+1)-1-:32];

assign rvx_port_28[03] = rvx_signal_005;
assign rvx_signal_052 = rvx_port_05[(32)*((03)+1)-1-:32];

assign rvx_signal_094 = 1;

assign rvx_signal_077 = 1;

assign rvx_signal_082 = 1;

assign rvx_signal_065 = 1;

endmodule
