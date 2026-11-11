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
`include "ervp_platform_controller_memorymap_offset.vh"




module RVX_MODULE_104
(
	rvx_port_00,
	rvx_port_21,

	rvx_port_24,
	rvx_port_17,
	rvx_port_09,
	rvx_port_39,
	rvx_port_32,
	rvx_port_11,
	rvx_port_31,
	rvx_port_01,

	rvx_port_35,
	rvx_port_16,
	rvx_port_06,
	rvx_port_29,
	rvx_port_19,
	rvx_port_33,
	rvx_port_36,
	rvx_port_30,
	rvx_port_07,
	rvx_port_23,
	rvx_port_10,
	rvx_port_03,
	rvx_port_22,
	rvx_port_25,
	rvx_port_27,
	rvx_port_12,
	rvx_port_34,
	rvx_port_20,
	rvx_port_04,
	rvx_port_28,
	rvx_port_14,
	rvx_port_13,
	rvx_port_37,
	rvx_port_15,
	rvx_port_05,
	rvx_port_26,
	rvx_port_38,
	rvx_port_02,
	rvx_port_18,
	rvx_port_08
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_00, rvx_port_21;
input wire rvx_port_24;
input wire rvx_port_17;
input wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire rvx_port_39;
input wire [RVX_GPARA_1-1:0] rvx_port_32;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
output reg rvx_port_31;
output reg rvx_port_01;

input wire rvx_port_35;

output wire rvx_port_16;
input wire [`BW_PLATFORM_REGISTER_BOOT_MODE-1:0] rvx_port_06;

output wire rvx_port_29;
input wire [`BW_PLATFORM_REGISTER_INITIALIZED-1:0] rvx_port_19;

output wire rvx_port_33;
input wire [`BW_PLATFORM_REGISTER_SIM_ENV-1:0] rvx_port_36;
output wire rvx_port_30;
output wire [`BW_PLATFORM_REGISTER_SIM_ENV-1:0] rvx_port_07;

output wire rvx_port_23;
input wire [`BW_PLATFORM_REGISTER_JTAG_SELECT-1:0] rvx_port_10;

output wire rvx_port_03;
input wire [`BW_PLATFORM_REGISTER_BOOT_STATUS-1:0] rvx_port_22;
output wire rvx_port_25;
output wire [`BW_PLATFORM_REGISTER_BOOT_STATUS-1:0] rvx_port_27;

output wire [`BW_PLATFORM_REGISTER_APP_ADDR-1:0] rvx_port_12;

output wire [`BW_PLATFORM_REGISTER_FLASH_FS_BASEADDR-1:0] rvx_port_34;

output wire [`BW_PLATFORM_REGISTER_FLASH_FS_SIZE-1:0] rvx_port_20;

output wire rvx_port_04;
input wire [`BW_PLATFORM_REGISTER_PROC_AUTO_ID-1:0] rvx_port_28;

output wire rvx_port_14;
input wire [`BW_PLATFORM_REGISTER_PROC_STATUS-1:0] rvx_port_13;

output wire rvx_port_37;
input wire [`BW_PLATFORM_REGISTER_IMP_TYPE-1:0] rvx_port_15;

output wire rvx_port_05;
input wire [`BW_PLATFORM_REGISTER_FLASH_BINARY_BASEADDR-1:0] rvx_port_26;

output wire [`NUM_PLATFORM_REGISTER_CORE_PC-1:0] rvx_port_38;
input wire [(`BW_PLATFORM_REGISTER_CORE_PC)*(`NUM_PLATFORM_REGISTER_CORE_PC)-1:0] rvx_port_02;

output wire [`NUM_PLATFORM_REGISTER_CORE_INST-1:0] rvx_port_18;
input wire [(`BW_PLATFORM_REGISTER_CORE_INST)*(`NUM_PLATFORM_REGISTER_CORE_INST)-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_025;
reg [RVX_GPARA_1-1:0] rvx_signal_085;
wire rvx_signal_067;
wire rvx_signal_102;
wire rvx_signal_037;

wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] paddr_offset = rvx_port_09;
wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_106;
wire [RVX_GPARA_2-1:0] rvx_signal_030;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_023;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] addr_unused = 0;
reg rvx_signal_013;
wire [RVX_GPARA_1-1:0] rvx_signal_004;
reg rvx_signal_095;
wire [RVX_GPARA_1-1:0] rvx_signal_092;
wire rvx_signal_038;
reg rvx_signal_091;
wire [RVX_GPARA_1-1:0] rvx_signal_010;
reg rvx_signal_008;
wire [RVX_GPARA_1-1:0] rvx_signal_045;
wire rvx_signal_090;
reg rvx_signal_058;
wire [RVX_GPARA_1-1:0] rvx_signal_040;
reg rvx_signal_110;
wire [RVX_GPARA_1-1:0] rvx_signal_011;
wire rvx_signal_033;
reg rvx_signal_063;
wire [RVX_GPARA_1-1:0] rvx_signal_056;
reg rvx_signal_100;
wire [RVX_GPARA_1-1:0] rvx_signal_065;
wire rvx_signal_001;
reg rvx_signal_061;
wire [RVX_GPARA_1-1:0] rvx_signal_041;
reg rvx_signal_064;
wire [RVX_GPARA_1-1:0] rvx_signal_087;
wire rvx_signal_109;
reg rvx_signal_031;
wire [RVX_GPARA_1-1:0] rvx_signal_055;
reg rvx_signal_072;
wire [RVX_GPARA_1-1:0] rvx_signal_005;
wire rvx_signal_069;
reg [32-1:0] rvx_signal_098;
reg rvx_signal_051;
wire [RVX_GPARA_1-1:0] rvx_signal_027;
reg rvx_signal_089;
wire [RVX_GPARA_1-1:0] rvx_signal_075;
wire rvx_signal_050;
reg [32-1:0] rvx_signal_074;
reg rvx_signal_020;
wire [RVX_GPARA_1-1:0] rvx_signal_073;
reg rvx_signal_077;
wire [RVX_GPARA_1-1:0] rvx_signal_108;
wire rvx_signal_088;
reg [32-1:0] rvx_signal_082;
reg rvx_signal_104;
wire [RVX_GPARA_1-1:0] rvx_signal_111;
reg rvx_signal_083;
wire [RVX_GPARA_1-1:0] rvx_signal_071;
wire rvx_signal_019;
reg rvx_signal_070;
wire [RVX_GPARA_1-1:0] rvx_signal_039;
reg rvx_signal_059;
wire [RVX_GPARA_1-1:0] rvx_signal_024;
wire rvx_signal_076;
reg rvx_signal_053;
wire [RVX_GPARA_1-1:0] rvx_signal_017;
reg rvx_signal_084;
wire [RVX_GPARA_1-1:0] rvx_signal_048;
wire rvx_signal_029;
reg rvx_signal_079;
wire [RVX_GPARA_1-1:0] rvx_signal_066;
reg rvx_signal_018;
wire [RVX_GPARA_1-1:0] rvx_signal_086;
wire rvx_signal_054;
reg rvx_signal_047;
wire [RVX_GPARA_1-1:0] rvx_signal_007;
reg rvx_signal_022;
wire [RVX_GPARA_1-1:0] rvx_signal_093;
wire rvx_signal_105;
reg rvx_signal_052;
wire [RVX_GPARA_1-1:0] rvx_signal_080;
reg rvx_signal_028;
wire [RVX_GPARA_1-1:0] rvx_signal_049;
wire rvx_signal_094;
reg rvx_signal_042;
wire [RVX_GPARA_1-1:0] rvx_signal_002;
reg rvx_signal_036;
wire [RVX_GPARA_1-1:0] rvx_signal_081;
wire rvx_signal_112;
reg rvx_signal_009;
wire [RVX_GPARA_1-1:0] rvx_signal_034;
reg rvx_signal_016;
wire [RVX_GPARA_1-1:0] rvx_signal_060;
wire rvx_signal_062;
reg rvx_signal_026;
wire [RVX_GPARA_1-1:0] rvx_signal_021;
reg rvx_signal_032;
wire [RVX_GPARA_1-1:0] rvx_signal_043;
wire rvx_signal_068;
reg rvx_signal_103;
wire [RVX_GPARA_1-1:0] rvx_signal_107;
reg rvx_signal_006;
wire [RVX_GPARA_1-1:0] rvx_signal_046;
wire rvx_signal_099;
reg rvx_signal_044;
wire [RVX_GPARA_1-1:0] rvx_signal_000;
reg rvx_signal_096;
wire [RVX_GPARA_1-1:0] rvx_signal_015;
wire rvx_signal_097;
reg rvx_signal_078;
wire [RVX_GPARA_1-1:0] rvx_signal_101;
reg rvx_signal_014;
wire [RVX_GPARA_1-1:0] rvx_signal_003;
wire rvx_signal_057;

assign rvx_signal_025 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_32);
assign rvx_port_11 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_085);
assign {rvx_signal_030,rvx_signal_023} = paddr_offset;
assign rvx_signal_106 = {rvx_signal_030,addr_unused};
assign rvx_signal_037 = (rvx_signal_023==0);
assign rvx_signal_067 = rvx_port_24 & rvx_port_17 & rvx_signal_037 & (~rvx_port_39);
assign rvx_signal_102 = rvx_port_24 & rvx_port_17 & rvx_signal_037 & rvx_port_39;

assign rvx_signal_092 = $unsigned(rvx_port_32);
assign rvx_signal_045 = $unsigned(rvx_port_32);
assign rvx_signal_011 = $unsigned(rvx_port_32);
assign rvx_signal_065 = $unsigned(rvx_port_32);
assign rvx_signal_087 = $unsigned(rvx_port_32);
assign rvx_signal_005 = $unsigned(rvx_port_32);
assign rvx_signal_075 = $unsigned(rvx_port_32);
assign rvx_signal_108 = $unsigned(rvx_port_32);
assign rvx_signal_071 = $unsigned(rvx_port_32);
assign rvx_signal_024 = $unsigned(rvx_port_32);
assign rvx_signal_048 = $unsigned(rvx_port_32);
assign rvx_signal_086 = $unsigned(rvx_port_32);
assign rvx_signal_093 = $unsigned(rvx_port_32);
assign rvx_signal_049 = $unsigned(rvx_port_32);
assign rvx_signal_081 = $unsigned(rvx_port_32);
assign rvx_signal_060 = $unsigned(rvx_port_32);
assign rvx_signal_043 = $unsigned(rvx_port_32);
assign rvx_signal_046 = $unsigned(rvx_port_32);
assign rvx_signal_015 = $unsigned(rvx_port_32);
assign rvx_signal_003 = $unsigned(rvx_port_32);

always@(*)
begin
	rvx_port_01 = 0;
	rvx_signal_085 = 0;
	rvx_port_31 = 1;

	rvx_signal_013 = 0;
	rvx_signal_095 = 0;

	rvx_signal_091 = 0;
	rvx_signal_008 = 0;

	rvx_signal_058 = 0;
	rvx_signal_110 = 0;

	rvx_signal_063 = 0;
	rvx_signal_100 = 0;

	rvx_signal_061 = 0;
	rvx_signal_064 = 0;

	rvx_signal_031 = 0;
	rvx_signal_072 = 0;

	rvx_signal_051 = 0;
	rvx_signal_089 = 0;

	rvx_signal_020 = 0;
	rvx_signal_077 = 0;

	rvx_signal_104 = 0;
	rvx_signal_083 = 0;

	rvx_signal_070 = 0;
	rvx_signal_059 = 0;

	rvx_signal_053 = 0;
	rvx_signal_084 = 0;

	rvx_signal_079 = 0;
	rvx_signal_018 = 0;

	rvx_signal_047 = 0;
	rvx_signal_022 = 0;

	rvx_signal_052 = 0;
	rvx_signal_028 = 0;

	rvx_signal_042 = 0;
	rvx_signal_036 = 0;

	rvx_signal_009 = 0;
	rvx_signal_016 = 0;

	rvx_signal_026 = 0;
	rvx_signal_032 = 0;

	rvx_signal_103 = 0;
	rvx_signal_006 = 0;

	rvx_signal_044 = 0;
	rvx_signal_096 = 0;

	rvx_signal_078 = 0;
	rvx_signal_014 = 0;

	if(rvx_port_24==1'b 1)
	begin
		case(rvx_signal_106)
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_MODE:
			begin
				rvx_signal_013 = rvx_signal_067;
				rvx_signal_095 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_004);
				rvx_port_31 = rvx_signal_038;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_INITIALIZED:
			begin
				rvx_signal_091 = rvx_signal_067;
				rvx_signal_008 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_010);
				rvx_port_31 = rvx_signal_090;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_SIM_ENV:
			begin
				rvx_signal_058 = rvx_signal_067;
				rvx_signal_110 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_040);
				rvx_port_31 = rvx_signal_033;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_JTAG_SELECT:
			begin
				rvx_signal_063 = rvx_signal_067;
				rvx_signal_100 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_056);
				rvx_port_31 = rvx_signal_001;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_STATUS:
			begin
				rvx_signal_061 = rvx_signal_067;
				rvx_signal_064 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_041);
				rvx_port_31 = rvx_signal_109;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_APP_ADDR:
			begin
				rvx_signal_031 = rvx_signal_067;
				rvx_signal_072 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_055);
				rvx_port_31 = rvx_signal_069;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_FS_BASEADDR:
			begin
				rvx_signal_051 = rvx_signal_067;
				rvx_signal_089 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_027);
				rvx_port_31 = rvx_signal_050;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_FS_SIZE:
			begin
				rvx_signal_020 = rvx_signal_067;
				rvx_signal_077 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_073);
				rvx_port_31 = rvx_signal_088;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_AUTO_ID:
			begin
				rvx_signal_104 = rvx_signal_067;
				rvx_signal_083 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_111);
				rvx_port_31 = rvx_signal_019;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_STATUS:
			begin
				rvx_signal_070 = rvx_signal_067;
				rvx_signal_059 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_039);
				rvx_port_31 = rvx_signal_076;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC00:
			begin
				rvx_signal_053 = rvx_signal_067;
				rvx_signal_084 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_017);
				rvx_port_31 = rvx_signal_029;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC01:
			begin
				rvx_signal_079 = rvx_signal_067;
				rvx_signal_018 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_066);
				rvx_port_31 = rvx_signal_054;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC02:
			begin
				rvx_signal_047 = rvx_signal_067;
				rvx_signal_022 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_007);
				rvx_port_31 = rvx_signal_105;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC03:
			begin
				rvx_signal_052 = rvx_signal_067;
				rvx_signal_028 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_080);
				rvx_port_31 = rvx_signal_094;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST00:
			begin
				rvx_signal_042 = rvx_signal_067;
				rvx_signal_036 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_002);
				rvx_port_31 = rvx_signal_112;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST01:
			begin
				rvx_signal_009 = rvx_signal_067;
				rvx_signal_016 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_034);
				rvx_port_31 = rvx_signal_062;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST02:
			begin
				rvx_signal_026 = rvx_signal_067;
				rvx_signal_032 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_021);
				rvx_port_31 = rvx_signal_068;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST03:
			begin
				rvx_signal_103 = rvx_signal_067;
				rvx_signal_006 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_107);
				rvx_port_31 = rvx_signal_099;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_IMP_TYPE:
			begin
				rvx_signal_044 = rvx_signal_067;
				rvx_signal_096 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_000);
				rvx_port_31 = rvx_signal_097;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_BINARY_BASEADDR:
			begin
				rvx_signal_078 = rvx_signal_067;
				rvx_signal_014 = rvx_signal_102;
				rvx_signal_085 = $unsigned(rvx_signal_101);
				rvx_port_31 = rvx_signal_057;
			end
			default:
				rvx_port_01 = 1;
		endcase
	end
end

always@(posedge rvx_port_00, negedge rvx_port_21)
begin
	if(rvx_port_21==0)
		rvx_signal_098 <= `PLATFORM_REGISTER_APP_ADDR_DEFAULT_VALUE;
	else if (rvx_signal_072==1'b 1)
		rvx_signal_098 <= rvx_signal_005;
end
assign rvx_signal_055 = rvx_signal_098;
always@(posedge rvx_port_00, negedge rvx_port_21)
begin
	if(rvx_port_21==0)
		rvx_signal_074 <= `PLATFORM_REGISTER_FLASH_FS_BASEADDR_DEFAULT_VALUE;
	else if (rvx_signal_089==1'b 1)
		rvx_signal_074 <= rvx_signal_075;
end
assign rvx_signal_027 = rvx_signal_074;
always@(posedge rvx_port_00, negedge rvx_port_21)
begin
	if(rvx_port_21==0)
		rvx_signal_082 <= `PLATFORM_REGISTER_FLASH_FS_SIZE_DEFAULT_VALUE;
	else if (rvx_signal_077==1'b 1)
		rvx_signal_082 <= rvx_signal_108;
end
assign rvx_signal_073 = rvx_signal_082;
assign rvx_port_16 = rvx_signal_013;
assign rvx_signal_004 = rvx_port_06;
assign rvx_signal_038 = 1;
assign rvx_port_29 = rvx_signal_091;
assign rvx_signal_010 = rvx_port_19;
assign rvx_signal_090 = 1;
assign rvx_port_33 = rvx_signal_058;
assign rvx_signal_040 = rvx_port_36;
assign rvx_port_30 = rvx_signal_110;
assign rvx_port_07 = rvx_signal_011;
assign rvx_signal_033 = 1;
assign rvx_port_23 = rvx_signal_063;
assign rvx_signal_056 = rvx_port_10;
assign rvx_signal_001 = 1;
assign rvx_port_03 = rvx_signal_061;
assign rvx_signal_041 = rvx_port_22;
assign rvx_port_25 = rvx_signal_064;
assign rvx_port_27 = rvx_signal_087;
assign rvx_signal_109 = 1;
assign rvx_port_12 = rvx_signal_098;
assign rvx_signal_069 = 1;
assign rvx_port_34 = rvx_signal_074;
assign rvx_signal_050 = 1;
assign rvx_port_20 = rvx_signal_082;
assign rvx_signal_088 = 1;
assign rvx_port_04 = rvx_signal_104;
assign rvx_signal_111 = rvx_port_28;
assign rvx_signal_019 = 1;
assign rvx_port_14 = rvx_signal_070;
assign rvx_signal_039 = rvx_port_13;
assign rvx_signal_076 = 1;
assign rvx_port_37 = rvx_signal_044;
assign rvx_signal_000 = rvx_port_15;
assign rvx_signal_097 = 1;
assign rvx_port_05 = rvx_signal_078;
assign rvx_signal_101 = rvx_port_26;
assign rvx_signal_057 = 1;

assign rvx_port_38[00] = rvx_signal_053;
assign rvx_signal_017 = rvx_port_02[(32)*((00)+1)-1-:32];

assign rvx_port_38[01] = rvx_signal_079;
assign rvx_signal_066 = rvx_port_02[(32)*((01)+1)-1-:32];

assign rvx_port_38[02] = rvx_signal_047;
assign rvx_signal_007 = rvx_port_02[(32)*((02)+1)-1-:32];

assign rvx_port_38[03] = rvx_signal_052;
assign rvx_signal_080 = rvx_port_02[(32)*((03)+1)-1-:32];

assign rvx_signal_029 = 1;

assign rvx_signal_054 = 1;

assign rvx_signal_105 = 1;

assign rvx_signal_094 = 1;

assign rvx_port_18[00] = rvx_signal_042;
assign rvx_signal_002 = rvx_port_08[(32)*((00)+1)-1-:32];

assign rvx_port_18[01] = rvx_signal_009;
assign rvx_signal_034 = rvx_port_08[(32)*((01)+1)-1-:32];

assign rvx_port_18[02] = rvx_signal_026;
assign rvx_signal_021 = rvx_port_08[(32)*((02)+1)-1-:32];

assign rvx_port_18[03] = rvx_signal_103;
assign rvx_signal_107 = rvx_port_08[(32)*((03)+1)-1-:32];

assign rvx_signal_112 = 1;

assign rvx_signal_062 = 1;

assign rvx_signal_068 = 1;

assign rvx_signal_099 = 1;

endmodule
