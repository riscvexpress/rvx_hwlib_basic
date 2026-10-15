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
`include "ervp_platform_controller_memorymap_offset.vh"




module RVX_MODULE_033
(
	rvx_port_25,
	rvx_port_31,

	rvx_port_20,
	rvx_port_12,
	rvx_port_33,
	rvx_port_17,
	rvx_port_16,
	rvx_port_01,
	rvx_port_29,
	rvx_port_06,

	rvx_port_23,
	rvx_port_05,
	rvx_port_34,
	rvx_port_19,
	rvx_port_07,
	rvx_port_03,
	rvx_port_08,
	rvx_port_09,
	rvx_port_24,
	rvx_port_36,
	rvx_port_02,
	rvx_port_26,
	rvx_port_35,
	rvx_port_00,
	rvx_port_27,
	rvx_port_04,
	rvx_port_22,
	rvx_port_28,
	rvx_port_32,
	rvx_port_21,
	rvx_port_11,
	rvx_port_15,
	rvx_port_18,
	rvx_port_10,
	rvx_port_30,
	rvx_port_14,
	rvx_port_37,
	rvx_port_13
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_25, rvx_port_31;
input wire rvx_port_20;
input wire rvx_port_12;
input wire [RVX_GPARA_2-1:0] rvx_port_33;
input wire rvx_port_17;
input wire [RVX_GPARA_0-1:0] rvx_port_16;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output reg rvx_port_29;
output reg rvx_port_06;

input wire rvx_port_23;

output wire rvx_port_05;
input wire [4-1:0] rvx_port_34;

output wire rvx_port_19;
input wire [1-1:0] rvx_port_07;

output wire rvx_port_03;
input wire [1-1:0] rvx_port_08;
output wire rvx_port_09;
output wire [1-1:0] rvx_port_24;

output wire rvx_port_36;
input wire [1-1:0] rvx_port_02;

output wire rvx_port_26;
input wire [32-1:0] rvx_port_35;
output wire rvx_port_00;
output wire [32-1:0] rvx_port_27;

output wire [32-1:0] rvx_port_04;

output wire rvx_port_22;
input wire [32-1:0] rvx_port_28;

output wire rvx_port_32;
input wire [32-1:0] rvx_port_21;

output wire rvx_port_11;
input wire [32-1:0] rvx_port_15;

output wire rvx_port_18;
input wire [32-1:0] rvx_port_10;

output wire [4-1:0] rvx_port_30;
input wire [(32)*(4)-1:0] rvx_port_14;

output wire [4-1:0] rvx_port_37;
input wire [(32)*(4)-1:0] rvx_port_13;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_027;
reg [RVX_GPARA_0-1:0] rvx_signal_040;
wire rvx_signal_083;
wire rvx_signal_035;
wire rvx_signal_066;

wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] paddr_offset = rvx_port_33;
wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_077;
wire [RVX_GPARA_2-1:0] rvx_signal_060;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_005;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] addr_unused = 0;
reg rvx_signal_029;
wire [4-1:0] rvx_signal_094;
reg rvx_signal_090;
wire [4-1:0] rvx_signal_041;
wire rvx_signal_053;
reg rvx_signal_068;
wire [1-1:0] rvx_signal_079;
reg rvx_signal_016;
wire [1-1:0] rvx_signal_038;
wire rvx_signal_043;
reg rvx_signal_092;
wire [1-1:0] rvx_signal_088;
reg rvx_signal_072;
wire [1-1:0] rvx_signal_026;
wire rvx_signal_036;
reg rvx_signal_044;
wire [1-1:0] rvx_signal_097;
reg rvx_signal_039;
wire [1-1:0] rvx_signal_014;
wire rvx_signal_063;
reg rvx_signal_074;
wire [32-1:0] rvx_signal_061;
reg rvx_signal_100;
wire [32-1:0] rvx_signal_089;
wire rvx_signal_059;
reg rvx_signal_012;
wire [32-1:0] rvx_signal_032;
reg rvx_signal_062;
wire [32-1:0] rvx_signal_019;
wire rvx_signal_008;
reg [32-1:0] rvx_signal_082;
reg rvx_signal_080;
wire [32-1:0] rvx_signal_069;
reg rvx_signal_042;
wire [32-1:0] rvx_signal_095;
wire rvx_signal_015;
reg rvx_signal_030;
wire [32-1:0] rvx_signal_064;
reg rvx_signal_085;
wire [32-1:0] rvx_signal_023;
wire rvx_signal_009;
reg rvx_signal_031;
wire [32-1:0] rvx_signal_056;
reg rvx_signal_073;
wire [32-1:0] rvx_signal_084;
wire rvx_signal_022;
reg rvx_signal_000;
wire [32-1:0] rvx_signal_037;
reg rvx_signal_033;
wire [32-1:0] rvx_signal_018;
wire rvx_signal_099;
reg rvx_signal_025;
wire [32-1:0] rvx_signal_078;
reg rvx_signal_028;
wire [32-1:0] rvx_signal_081;
wire rvx_signal_087;
reg rvx_signal_021;
wire [32-1:0] rvx_signal_045;
reg rvx_signal_013;
wire [32-1:0] rvx_signal_002;
wire rvx_signal_048;
reg rvx_signal_054;
wire [32-1:0] rvx_signal_075;
reg rvx_signal_098;
wire [32-1:0] rvx_signal_049;
wire rvx_signal_055;
reg rvx_signal_076;
wire [32-1:0] rvx_signal_046;
reg rvx_signal_071;
wire [32-1:0] rvx_signal_017;
wire rvx_signal_010;
reg rvx_signal_011;
wire [32-1:0] rvx_signal_051;
reg rvx_signal_058;
wire [32-1:0] rvx_signal_057;
wire rvx_signal_067;
reg rvx_signal_091;
wire [32-1:0] rvx_signal_006;
reg rvx_signal_003;
wire [32-1:0] rvx_signal_093;
wire rvx_signal_096;
reg rvx_signal_065;
wire [32-1:0] rvx_signal_047;
reg rvx_signal_001;
wire [32-1:0] rvx_signal_086;
wire rvx_signal_024;
reg rvx_signal_007;
wire [32-1:0] rvx_signal_004;
reg rvx_signal_020;
wire [32-1:0] rvx_signal_034;
wire rvx_signal_070;

assign rvx_signal_027 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_16);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_040);
assign {rvx_signal_060,rvx_signal_005} = paddr_offset;
assign rvx_signal_077 = {rvx_signal_060,addr_unused};
assign rvx_signal_066 = (rvx_signal_005==0);
assign rvx_signal_083 = rvx_port_20 & rvx_port_12 & rvx_signal_066 & (~rvx_port_17);
assign rvx_signal_035 = rvx_port_20 & rvx_port_12 & rvx_signal_066 & rvx_port_17;

assign rvx_signal_041 = $unsigned(rvx_port_16);
assign rvx_signal_038 = $unsigned(rvx_port_16);
assign rvx_signal_026 = $unsigned(rvx_port_16);
assign rvx_signal_014 = $unsigned(rvx_port_16);
assign rvx_signal_089 = $unsigned(rvx_port_16);
assign rvx_signal_019 = $unsigned(rvx_port_16);
assign rvx_signal_095 = $unsigned(rvx_port_16);
assign rvx_signal_023 = $unsigned(rvx_port_16);
assign rvx_signal_084 = $unsigned(rvx_port_16);
assign rvx_signal_018 = $unsigned(rvx_port_16);
assign rvx_signal_081 = $unsigned(rvx_port_16);
assign rvx_signal_002 = $unsigned(rvx_port_16);
assign rvx_signal_049 = $unsigned(rvx_port_16);
assign rvx_signal_017 = $unsigned(rvx_port_16);
assign rvx_signal_057 = $unsigned(rvx_port_16);
assign rvx_signal_093 = $unsigned(rvx_port_16);
assign rvx_signal_086 = $unsigned(rvx_port_16);
assign rvx_signal_034 = $unsigned(rvx_port_16);

always@(*)
begin
	rvx_port_06 = 0;
	rvx_signal_040 = 0;
	rvx_port_29 = 1;

	rvx_signal_029 = 0;
	rvx_signal_090 = 0;

	rvx_signal_068 = 0;
	rvx_signal_016 = 0;

	rvx_signal_092 = 0;
	rvx_signal_072 = 0;

	rvx_signal_044 = 0;
	rvx_signal_039 = 0;

	rvx_signal_074 = 0;
	rvx_signal_100 = 0;

	rvx_signal_012 = 0;
	rvx_signal_062 = 0;

	rvx_signal_080 = 0;
	rvx_signal_042 = 0;

	rvx_signal_030 = 0;
	rvx_signal_085 = 0;

	rvx_signal_031 = 0;
	rvx_signal_073 = 0;

	rvx_signal_000 = 0;
	rvx_signal_033 = 0;

	rvx_signal_025 = 0;
	rvx_signal_028 = 0;

	rvx_signal_021 = 0;
	rvx_signal_013 = 0;

	rvx_signal_054 = 0;
	rvx_signal_098 = 0;

	rvx_signal_076 = 0;
	rvx_signal_071 = 0;

	rvx_signal_011 = 0;
	rvx_signal_058 = 0;

	rvx_signal_091 = 0;
	rvx_signal_003 = 0;

	rvx_signal_065 = 0;
	rvx_signal_001 = 0;

	rvx_signal_007 = 0;
	rvx_signal_020 = 0;

	if(rvx_port_20==1'b 1)
	begin
		case(rvx_signal_077)
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_MODE:
			begin
				rvx_signal_029 = rvx_signal_083;
				rvx_signal_090 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_094);
				rvx_port_29 = rvx_signal_053;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_INITIALIZED:
			begin
				rvx_signal_068 = rvx_signal_083;
				rvx_signal_016 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_079);
				rvx_port_29 = rvx_signal_043;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_SIM_ENV:
			begin
				rvx_signal_092 = rvx_signal_083;
				rvx_signal_072 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_088);
				rvx_port_29 = rvx_signal_036;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_JTAG_SELECT:
			begin
				rvx_signal_044 = rvx_signal_083;
				rvx_signal_039 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_097);
				rvx_port_29 = rvx_signal_063;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_STATUS:
			begin
				rvx_signal_074 = rvx_signal_083;
				rvx_signal_100 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_061);
				rvx_port_29 = rvx_signal_059;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_APP_ADDR:
			begin
				rvx_signal_012 = rvx_signal_083;
				rvx_signal_062 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_032);
				rvx_port_29 = rvx_signal_008;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_AUTO_ID:
			begin
				rvx_signal_080 = rvx_signal_083;
				rvx_signal_042 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_069);
				rvx_port_29 = rvx_signal_015;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_STATUS:
			begin
				rvx_signal_030 = rvx_signal_083;
				rvx_signal_085 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_064);
				rvx_port_29 = rvx_signal_009;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC00:
			begin
				rvx_signal_031 = rvx_signal_083;
				rvx_signal_073 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_056);
				rvx_port_29 = rvx_signal_022;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC01:
			begin
				rvx_signal_000 = rvx_signal_083;
				rvx_signal_033 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_037);
				rvx_port_29 = rvx_signal_099;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC02:
			begin
				rvx_signal_025 = rvx_signal_083;
				rvx_signal_028 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_078);
				rvx_port_29 = rvx_signal_087;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC03:
			begin
				rvx_signal_021 = rvx_signal_083;
				rvx_signal_013 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_045);
				rvx_port_29 = rvx_signal_048;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST00:
			begin
				rvx_signal_054 = rvx_signal_083;
				rvx_signal_098 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_075);
				rvx_port_29 = rvx_signal_055;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST01:
			begin
				rvx_signal_076 = rvx_signal_083;
				rvx_signal_071 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_046);
				rvx_port_29 = rvx_signal_010;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST02:
			begin
				rvx_signal_011 = rvx_signal_083;
				rvx_signal_058 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_051);
				rvx_port_29 = rvx_signal_067;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST03:
			begin
				rvx_signal_091 = rvx_signal_083;
				rvx_signal_003 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_006);
				rvx_port_29 = rvx_signal_096;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_IMP_TYPE:
			begin
				rvx_signal_065 = rvx_signal_083;
				rvx_signal_001 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_047);
				rvx_port_29 = rvx_signal_024;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_BASE_ADDR:
			begin
				rvx_signal_007 = rvx_signal_083;
				rvx_signal_020 = rvx_signal_035;
				rvx_signal_040 = $unsigned(rvx_signal_004);
				rvx_port_29 = rvx_signal_070;
			end
			default:
				rvx_port_06 = 1;
		endcase
	end
end

always@(posedge rvx_port_25, negedge rvx_port_31)
begin
	if(rvx_port_31==0)
		rvx_signal_082 <= `PLATFORM_REGISTER_APP_ADDR_DEFAULT_VALUE;
	else if (rvx_signal_062==1'b 1)
		rvx_signal_082 <= rvx_signal_019;
end
assign rvx_signal_032 = rvx_signal_082;
assign rvx_port_05 = rvx_signal_029;
assign rvx_signal_094 = rvx_port_34;
assign rvx_signal_053 = 1;
assign rvx_port_19 = rvx_signal_068;
assign rvx_signal_079 = rvx_port_07;
assign rvx_signal_043 = 1;
assign rvx_port_03 = rvx_signal_092;
assign rvx_signal_088 = rvx_port_08;
assign rvx_port_09 = rvx_signal_072;
assign rvx_port_24 = rvx_signal_026;
assign rvx_signal_036 = 1;
assign rvx_port_36 = rvx_signal_044;
assign rvx_signal_097 = rvx_port_02;
assign rvx_signal_063 = 1;
assign rvx_port_26 = rvx_signal_074;
assign rvx_signal_061 = rvx_port_35;
assign rvx_port_00 = rvx_signal_100;
assign rvx_port_27 = rvx_signal_089;
assign rvx_signal_059 = 1;
assign rvx_port_04 = rvx_signal_082;
assign rvx_signal_008 = 1;
assign rvx_port_22 = rvx_signal_080;
assign rvx_signal_069 = rvx_port_28;
assign rvx_signal_015 = 1;
assign rvx_port_32 = rvx_signal_030;
assign rvx_signal_064 = rvx_port_21;
assign rvx_signal_009 = 1;
assign rvx_port_11 = rvx_signal_065;
assign rvx_signal_047 = rvx_port_15;
assign rvx_signal_024 = 1;
assign rvx_port_18 = rvx_signal_007;
assign rvx_signal_004 = rvx_port_10;
assign rvx_signal_070 = 1;

assign rvx_port_30[00] = rvx_signal_031;
assign rvx_signal_056 = rvx_port_14[(32)*((00)+1)-1-:32];

assign rvx_port_30[01] = rvx_signal_000;
assign rvx_signal_037 = rvx_port_14[(32)*((01)+1)-1-:32];

assign rvx_port_30[02] = rvx_signal_025;
assign rvx_signal_078 = rvx_port_14[(32)*((02)+1)-1-:32];

assign rvx_port_30[03] = rvx_signal_021;
assign rvx_signal_045 = rvx_port_14[(32)*((03)+1)-1-:32];

assign rvx_signal_022 = 1;

assign rvx_signal_099 = 1;

assign rvx_signal_087 = 1;

assign rvx_signal_048 = 1;

assign rvx_port_37[00] = rvx_signal_054;
assign rvx_signal_075 = rvx_port_13[(32)*((00)+1)-1-:32];

assign rvx_port_37[01] = rvx_signal_076;
assign rvx_signal_046 = rvx_port_13[(32)*((01)+1)-1-:32];

assign rvx_port_37[02] = rvx_signal_011;
assign rvx_signal_051 = rvx_port_13[(32)*((02)+1)-1-:32];

assign rvx_port_37[03] = rvx_signal_091;
assign rvx_signal_006 = rvx_port_13[(32)*((03)+1)-1-:32];

assign rvx_signal_055 = 1;

assign rvx_signal_010 = 1;

assign rvx_signal_067 = 1;

assign rvx_signal_096 = 1;

endmodule
