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




module RVX_MODULE_089
(
	rvx_port_33,
	rvx_port_15,

	rvx_port_21,
	rvx_port_24,
	rvx_port_12,
	rvx_port_27,
	rvx_port_30,
	rvx_port_36,
	rvx_port_11,
	rvx_port_01,

	rvx_port_20,
	rvx_port_16,
	rvx_port_09,
	rvx_port_05,
	rvx_port_00,
	rvx_port_10,
	rvx_port_02,
	rvx_port_08,
	rvx_port_14,
	rvx_port_35,
	rvx_port_13,
	rvx_port_19,
	rvx_port_18,
	rvx_port_28,
	rvx_port_32,
	rvx_port_26,
	rvx_port_06,
	rvx_port_07,
	rvx_port_23,
	rvx_port_25,
	rvx_port_03,
	rvx_port_04,
	rvx_port_31,
	rvx_port_17,
	rvx_port_29,
	rvx_port_37,
	rvx_port_34,
	rvx_port_22
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_33, rvx_port_15;
input wire rvx_port_21;
input wire rvx_port_24;
input wire [RVX_GPARA_2-1:0] rvx_port_12;
input wire rvx_port_27;
input wire [RVX_GPARA_1-1:0] rvx_port_30;
output wire [RVX_GPARA_1-1:0] rvx_port_36;
output reg rvx_port_11;
output reg rvx_port_01;

input wire rvx_port_20;

output wire rvx_port_16;
input wire [4-1:0] rvx_port_09;

output wire rvx_port_05;
input wire [1-1:0] rvx_port_00;

output wire rvx_port_10;
input wire [1-1:0] rvx_port_02;
output wire rvx_port_08;
output wire [1-1:0] rvx_port_14;

output wire rvx_port_35;
input wire [1-1:0] rvx_port_13;

output wire rvx_port_19;
input wire [32-1:0] rvx_port_18;
output wire rvx_port_28;
output wire [32-1:0] rvx_port_32;

output wire [32-1:0] rvx_port_26;

output wire rvx_port_06;
input wire [32-1:0] rvx_port_07;

output wire rvx_port_23;
input wire [32-1:0] rvx_port_25;

output wire rvx_port_03;
input wire [32-1:0] rvx_port_04;

output wire rvx_port_31;
input wire [32-1:0] rvx_port_17;

output wire [4-1:0] rvx_port_29;
input wire [(32)*(4)-1:0] rvx_port_37;

output wire [4-1:0] rvx_port_34;
input wire [(32)*(4)-1:0] rvx_port_22;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_088;
reg [RVX_GPARA_1-1:0] rvx_signal_012;
wire rvx_signal_051;
wire rvx_signal_056;
wire rvx_signal_002;

wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] paddr_offset = rvx_port_12;
wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_083;
wire [RVX_GPARA_2-1:0] rvx_signal_049;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_054;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] addr_unused = 0;
reg rvx_signal_080;
wire [4-1:0] rvx_signal_062;
reg rvx_signal_032;
wire [4-1:0] rvx_signal_073;
wire rvx_signal_009;
reg rvx_signal_081;
wire [1-1:0] rvx_signal_018;
reg rvx_signal_020;
wire [1-1:0] rvx_signal_028;
wire rvx_signal_001;
reg rvx_signal_059;
wire [1-1:0] rvx_signal_031;
reg rvx_signal_064;
wire [1-1:0] rvx_signal_037;
wire rvx_signal_021;
reg rvx_signal_071;
wire [1-1:0] rvx_signal_067;
reg rvx_signal_052;
wire [1-1:0] rvx_signal_100;
wire rvx_signal_082;
reg rvx_signal_040;
wire [32-1:0] rvx_signal_063;
reg rvx_signal_085;
wire [32-1:0] rvx_signal_061;
wire rvx_signal_029;
reg rvx_signal_017;
wire [32-1:0] rvx_signal_079;
reg rvx_signal_014;
wire [32-1:0] rvx_signal_069;
wire rvx_signal_026;
reg [32-1:0] rvx_signal_092;
reg rvx_signal_046;
wire [32-1:0] rvx_signal_099;
reg rvx_signal_047;
wire [32-1:0] rvx_signal_042;
wire rvx_signal_043;
reg rvx_signal_095;
wire [32-1:0] rvx_signal_025;
reg rvx_signal_068;
wire [32-1:0] rvx_signal_097;
wire rvx_signal_030;
reg rvx_signal_076;
wire [32-1:0] rvx_signal_038;
reg rvx_signal_050;
wire [32-1:0] rvx_signal_039;
wire rvx_signal_033;
reg rvx_signal_016;
wire [32-1:0] rvx_signal_048;
reg rvx_signal_011;
wire [32-1:0] rvx_signal_008;
wire rvx_signal_077;
reg rvx_signal_060;
wire [32-1:0] rvx_signal_094;
reg rvx_signal_070;
wire [32-1:0] rvx_signal_053;
wire rvx_signal_023;
reg rvx_signal_004;
wire [32-1:0] rvx_signal_086;
reg rvx_signal_089;
wire [32-1:0] rvx_signal_075;
wire rvx_signal_078;
reg rvx_signal_096;
wire [32-1:0] rvx_signal_066;
reg rvx_signal_000;
wire [32-1:0] rvx_signal_055;
wire rvx_signal_003;
reg rvx_signal_041;
wire [32-1:0] rvx_signal_098;
reg rvx_signal_036;
wire [32-1:0] rvx_signal_013;
wire rvx_signal_045;
reg rvx_signal_058;
wire [32-1:0] rvx_signal_034;
reg rvx_signal_093;
wire [32-1:0] rvx_signal_010;
wire rvx_signal_057;
reg rvx_signal_091;
wire [32-1:0] rvx_signal_074;
reg rvx_signal_035;
wire [32-1:0] rvx_signal_090;
wire rvx_signal_005;
reg rvx_signal_019;
wire [32-1:0] rvx_signal_084;
reg rvx_signal_024;
wire [32-1:0] rvx_signal_065;
wire rvx_signal_006;
reg rvx_signal_072;
wire [32-1:0] rvx_signal_022;
reg rvx_signal_044;
wire [32-1:0] rvx_signal_087;
wire rvx_signal_027;

assign rvx_signal_088 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_30);
assign rvx_port_36 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_012);
assign {rvx_signal_049,rvx_signal_054} = paddr_offset;
assign rvx_signal_083 = {rvx_signal_049,addr_unused};
assign rvx_signal_002 = (rvx_signal_054==0);
assign rvx_signal_051 = rvx_port_21 & rvx_port_24 & rvx_signal_002 & (~rvx_port_27);
assign rvx_signal_056 = rvx_port_21 & rvx_port_24 & rvx_signal_002 & rvx_port_27;

assign rvx_signal_073 = $unsigned(rvx_port_30);
assign rvx_signal_028 = $unsigned(rvx_port_30);
assign rvx_signal_037 = $unsigned(rvx_port_30);
assign rvx_signal_100 = $unsigned(rvx_port_30);
assign rvx_signal_061 = $unsigned(rvx_port_30);
assign rvx_signal_069 = $unsigned(rvx_port_30);
assign rvx_signal_042 = $unsigned(rvx_port_30);
assign rvx_signal_097 = $unsigned(rvx_port_30);
assign rvx_signal_039 = $unsigned(rvx_port_30);
assign rvx_signal_008 = $unsigned(rvx_port_30);
assign rvx_signal_053 = $unsigned(rvx_port_30);
assign rvx_signal_075 = $unsigned(rvx_port_30);
assign rvx_signal_055 = $unsigned(rvx_port_30);
assign rvx_signal_013 = $unsigned(rvx_port_30);
assign rvx_signal_010 = $unsigned(rvx_port_30);
assign rvx_signal_090 = $unsigned(rvx_port_30);
assign rvx_signal_065 = $unsigned(rvx_port_30);
assign rvx_signal_087 = $unsigned(rvx_port_30);

always@(*)
begin
	rvx_port_01 = 0;
	rvx_signal_012 = 0;
	rvx_port_11 = 1;

	rvx_signal_080 = 0;
	rvx_signal_032 = 0;

	rvx_signal_081 = 0;
	rvx_signal_020 = 0;

	rvx_signal_059 = 0;
	rvx_signal_064 = 0;

	rvx_signal_071 = 0;
	rvx_signal_052 = 0;

	rvx_signal_040 = 0;
	rvx_signal_085 = 0;

	rvx_signal_017 = 0;
	rvx_signal_014 = 0;

	rvx_signal_046 = 0;
	rvx_signal_047 = 0;

	rvx_signal_095 = 0;
	rvx_signal_068 = 0;

	rvx_signal_076 = 0;
	rvx_signal_050 = 0;

	rvx_signal_016 = 0;
	rvx_signal_011 = 0;

	rvx_signal_060 = 0;
	rvx_signal_070 = 0;

	rvx_signal_004 = 0;
	rvx_signal_089 = 0;

	rvx_signal_096 = 0;
	rvx_signal_000 = 0;

	rvx_signal_041 = 0;
	rvx_signal_036 = 0;

	rvx_signal_058 = 0;
	rvx_signal_093 = 0;

	rvx_signal_091 = 0;
	rvx_signal_035 = 0;

	rvx_signal_019 = 0;
	rvx_signal_024 = 0;

	rvx_signal_072 = 0;
	rvx_signal_044 = 0;

	if(rvx_port_21==1'b 1)
	begin
		case(rvx_signal_083)
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_MODE:
			begin
				rvx_signal_080 = rvx_signal_051;
				rvx_signal_032 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_062);
				rvx_port_11 = rvx_signal_009;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_INITIALIZED:
			begin
				rvx_signal_081 = rvx_signal_051;
				rvx_signal_020 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_018);
				rvx_port_11 = rvx_signal_001;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_SIM_ENV:
			begin
				rvx_signal_059 = rvx_signal_051;
				rvx_signal_064 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_031);
				rvx_port_11 = rvx_signal_021;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_JTAG_SELECT:
			begin
				rvx_signal_071 = rvx_signal_051;
				rvx_signal_052 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_067);
				rvx_port_11 = rvx_signal_082;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_STATUS:
			begin
				rvx_signal_040 = rvx_signal_051;
				rvx_signal_085 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_063);
				rvx_port_11 = rvx_signal_029;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_APP_ADDR:
			begin
				rvx_signal_017 = rvx_signal_051;
				rvx_signal_014 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_079);
				rvx_port_11 = rvx_signal_026;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_AUTO_ID:
			begin
				rvx_signal_046 = rvx_signal_051;
				rvx_signal_047 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_099);
				rvx_port_11 = rvx_signal_043;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_STATUS:
			begin
				rvx_signal_095 = rvx_signal_051;
				rvx_signal_068 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_025);
				rvx_port_11 = rvx_signal_030;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC00:
			begin
				rvx_signal_076 = rvx_signal_051;
				rvx_signal_050 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_038);
				rvx_port_11 = rvx_signal_033;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC01:
			begin
				rvx_signal_016 = rvx_signal_051;
				rvx_signal_011 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_048);
				rvx_port_11 = rvx_signal_077;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC02:
			begin
				rvx_signal_060 = rvx_signal_051;
				rvx_signal_070 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_094);
				rvx_port_11 = rvx_signal_023;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC03:
			begin
				rvx_signal_004 = rvx_signal_051;
				rvx_signal_089 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_086);
				rvx_port_11 = rvx_signal_078;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST00:
			begin
				rvx_signal_096 = rvx_signal_051;
				rvx_signal_000 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_066);
				rvx_port_11 = rvx_signal_003;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST01:
			begin
				rvx_signal_041 = rvx_signal_051;
				rvx_signal_036 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_098);
				rvx_port_11 = rvx_signal_045;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST02:
			begin
				rvx_signal_058 = rvx_signal_051;
				rvx_signal_093 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_034);
				rvx_port_11 = rvx_signal_057;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST03:
			begin
				rvx_signal_091 = rvx_signal_051;
				rvx_signal_035 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_074);
				rvx_port_11 = rvx_signal_005;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_IMP_TYPE:
			begin
				rvx_signal_019 = rvx_signal_051;
				rvx_signal_024 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_084);
				rvx_port_11 = rvx_signal_006;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_BASE_ADDR:
			begin
				rvx_signal_072 = rvx_signal_051;
				rvx_signal_044 = rvx_signal_056;
				rvx_signal_012 = $unsigned(rvx_signal_022);
				rvx_port_11 = rvx_signal_027;
			end
			default:
				rvx_port_01 = 1;
		endcase
	end
end

always@(posedge rvx_port_33, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_092 <= `PLATFORM_REGISTER_APP_ADDR_DEFAULT_VALUE;
	else if (rvx_signal_014==1'b 1)
		rvx_signal_092 <= rvx_signal_069;
end
assign rvx_signal_079 = rvx_signal_092;
assign rvx_port_16 = rvx_signal_080;
assign rvx_signal_062 = rvx_port_09;
assign rvx_signal_009 = 1;
assign rvx_port_05 = rvx_signal_081;
assign rvx_signal_018 = rvx_port_00;
assign rvx_signal_001 = 1;
assign rvx_port_10 = rvx_signal_059;
assign rvx_signal_031 = rvx_port_02;
assign rvx_port_08 = rvx_signal_064;
assign rvx_port_14 = rvx_signal_037;
assign rvx_signal_021 = 1;
assign rvx_port_35 = rvx_signal_071;
assign rvx_signal_067 = rvx_port_13;
assign rvx_signal_082 = 1;
assign rvx_port_19 = rvx_signal_040;
assign rvx_signal_063 = rvx_port_18;
assign rvx_port_28 = rvx_signal_085;
assign rvx_port_32 = rvx_signal_061;
assign rvx_signal_029 = 1;
assign rvx_port_26 = rvx_signal_092;
assign rvx_signal_026 = 1;
assign rvx_port_06 = rvx_signal_046;
assign rvx_signal_099 = rvx_port_07;
assign rvx_signal_043 = 1;
assign rvx_port_23 = rvx_signal_095;
assign rvx_signal_025 = rvx_port_25;
assign rvx_signal_030 = 1;
assign rvx_port_03 = rvx_signal_019;
assign rvx_signal_084 = rvx_port_04;
assign rvx_signal_006 = 1;
assign rvx_port_31 = rvx_signal_072;
assign rvx_signal_022 = rvx_port_17;
assign rvx_signal_027 = 1;

assign rvx_port_29[00] = rvx_signal_076;
assign rvx_signal_038 = rvx_port_37[(32)*((00)+1)-1-:32];

assign rvx_port_29[01] = rvx_signal_016;
assign rvx_signal_048 = rvx_port_37[(32)*((01)+1)-1-:32];

assign rvx_port_29[02] = rvx_signal_060;
assign rvx_signal_094 = rvx_port_37[(32)*((02)+1)-1-:32];

assign rvx_port_29[03] = rvx_signal_004;
assign rvx_signal_086 = rvx_port_37[(32)*((03)+1)-1-:32];

assign rvx_signal_033 = 1;

assign rvx_signal_077 = 1;

assign rvx_signal_023 = 1;

assign rvx_signal_078 = 1;

assign rvx_port_34[00] = rvx_signal_096;
assign rvx_signal_066 = rvx_port_22[(32)*((00)+1)-1-:32];

assign rvx_port_34[01] = rvx_signal_041;
assign rvx_signal_098 = rvx_port_22[(32)*((01)+1)-1-:32];

assign rvx_port_34[02] = rvx_signal_058;
assign rvx_signal_034 = rvx_port_22[(32)*((02)+1)-1-:32];

assign rvx_port_34[03] = rvx_signal_091;
assign rvx_signal_074 = rvx_port_22[(32)*((03)+1)-1-:32];

assign rvx_signal_003 = 1;

assign rvx_signal_045 = 1;

assign rvx_signal_057 = 1;

assign rvx_signal_005 = 1;

endmodule
