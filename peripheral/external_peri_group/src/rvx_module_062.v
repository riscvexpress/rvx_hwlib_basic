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
`include "ervp_external_peri_group_memorymap_offset.vh"




module RVX_MODULE_062
(
	rvx_port_04,
	rvx_port_03,

	rvx_port_11,
	rvx_port_14,
	rvx_port_02,
	rvx_port_05,
	rvx_port_13,
	rvx_port_12,
	rvx_port_07,
	rvx_port_00,

	rvx_port_06,
	rvx_port_09,
	rvx_port_01,
	rvx_port_10,
	rvx_port_08
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_04, rvx_port_03;
input wire rvx_port_11;
input wire rvx_port_14;
input wire [RVX_GPARA_1-1:0] rvx_port_02;
input wire rvx_port_05;
input wire [RVX_GPARA_2-1:0] rvx_port_13;
output wire [RVX_GPARA_2-1:0] rvx_port_12;
output reg rvx_port_07;
output reg rvx_port_00;

input wire rvx_port_06;

output wire [16-1:0] rvx_port_09;
input wire [(32)*(16)-1:0] rvx_port_01;
output wire [16-1:0] rvx_port_10;
output wire [(32)*(16)-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_33;
reg [RVX_GPARA_2-1:0] rvx_signal_71;
wire rvx_signal_62;
wire rvx_signal_57;
wire rvx_signal_18;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_02;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_76;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_32;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_60;
wire [32-1:0] rvx_signal_81;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_53;
wire rvx_signal_21;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_70;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_67;
wire rvx_signal_87;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_23;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_74;
wire rvx_signal_14;
reg rvx_signal_85;
wire [32-1:0] rvx_signal_10;
reg rvx_signal_63;
wire [32-1:0] rvx_signal_73;
wire rvx_signal_01;
reg rvx_signal_15;
wire [32-1:0] rvx_signal_86;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_65;
wire rvx_signal_28;
reg rvx_signal_66;
wire [32-1:0] rvx_signal_40;
reg rvx_signal_54;
wire [32-1:0] rvx_signal_30;
wire rvx_signal_58;
reg rvx_signal_35;
wire [32-1:0] rvx_signal_50;
reg rvx_signal_52;
wire [32-1:0] rvx_signal_41;
wire rvx_signal_80;
reg rvx_signal_84;
wire [32-1:0] rvx_signal_13;
reg rvx_signal_51;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_64;
reg rvx_signal_79;
wire [32-1:0] rvx_signal_59;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_77;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_42;
reg rvx_signal_69;
wire [32-1:0] rvx_signal_47;
wire rvx_signal_22;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_20;
reg rvx_signal_26;
wire [32-1:0] rvx_signal_48;
wire rvx_signal_02;
reg rvx_signal_68;
wire [32-1:0] rvx_signal_61;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_44;
wire rvx_signal_25;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_08;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_82;
wire rvx_signal_12;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_88;
reg rvx_signal_89;
wire [32-1:0] rvx_signal_00;
wire rvx_signal_24;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_45;
reg rvx_signal_55;
wire [32-1:0] rvx_signal_56;
wire rvx_signal_19;
reg rvx_signal_75;
wire [32-1:0] rvx_signal_46;
reg rvx_signal_43;
wire [32-1:0] rvx_signal_72;
wire rvx_signal_05;

assign rvx_signal_33 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_13);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_71);
assign {rvx_signal_76,rvx_signal_32} = paddr_offset;
assign rvx_signal_16 = {rvx_signal_76,addr_unused};
assign rvx_signal_18 = (rvx_signal_32==0);
assign rvx_signal_62 = rvx_port_11 & rvx_port_14 & rvx_signal_18 & (~rvx_port_05);
assign rvx_signal_57 = rvx_port_11 & rvx_port_14 & rvx_signal_18 & rvx_port_05;

assign rvx_signal_53 = $unsigned(rvx_port_13);
assign rvx_signal_67 = $unsigned(rvx_port_13);
assign rvx_signal_74 = $unsigned(rvx_port_13);
assign rvx_signal_73 = $unsigned(rvx_port_13);
assign rvx_signal_65 = $unsigned(rvx_port_13);
assign rvx_signal_30 = $unsigned(rvx_port_13);
assign rvx_signal_41 = $unsigned(rvx_port_13);
assign rvx_signal_06 = $unsigned(rvx_port_13);
assign rvx_signal_27 = $unsigned(rvx_port_13);
assign rvx_signal_47 = $unsigned(rvx_port_13);
assign rvx_signal_48 = $unsigned(rvx_port_13);
assign rvx_signal_44 = $unsigned(rvx_port_13);
assign rvx_signal_82 = $unsigned(rvx_port_13);
assign rvx_signal_00 = $unsigned(rvx_port_13);
assign rvx_signal_56 = $unsigned(rvx_port_13);
assign rvx_signal_72 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_00 = 0;
	rvx_signal_71 = 0;
	rvx_port_07 = 1;

	rvx_signal_60 = 0;
	rvx_signal_34 = 0;

	rvx_signal_09 = 0;
	rvx_signal_83 = 0;

	rvx_signal_29 = 0;
	rvx_signal_11 = 0;

	rvx_signal_85 = 0;
	rvx_signal_63 = 0;

	rvx_signal_15 = 0;
	rvx_signal_37 = 0;

	rvx_signal_66 = 0;
	rvx_signal_54 = 0;

	rvx_signal_35 = 0;
	rvx_signal_52 = 0;

	rvx_signal_84 = 0;
	rvx_signal_51 = 0;

	rvx_signal_79 = 0;
	rvx_signal_31 = 0;

	rvx_signal_07 = 0;
	rvx_signal_69 = 0;

	rvx_signal_38 = 0;
	rvx_signal_26 = 0;

	rvx_signal_68 = 0;
	rvx_signal_04 = 0;

	rvx_signal_36 = 0;
	rvx_signal_03 = 0;

	rvx_signal_17 = 0;
	rvx_signal_89 = 0;

	rvx_signal_49 = 0;
	rvx_signal_55 = 0;

	rvx_signal_75 = 0;
	rvx_signal_43 = 0;

	if(rvx_port_11==1'b 1)
	begin
		case(rvx_signal_16)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_60 = rvx_signal_62;
				rvx_signal_34 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_81);
				rvx_port_07 = rvx_signal_21;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_09 = rvx_signal_62;
				rvx_signal_83 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_70);
				rvx_port_07 = rvx_signal_87;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_29 = rvx_signal_62;
				rvx_signal_11 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_23);
				rvx_port_07 = rvx_signal_14;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_85 = rvx_signal_62;
				rvx_signal_63 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_10);
				rvx_port_07 = rvx_signal_01;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_15 = rvx_signal_62;
				rvx_signal_37 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_86);
				rvx_port_07 = rvx_signal_28;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_66 = rvx_signal_62;
				rvx_signal_54 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_40);
				rvx_port_07 = rvx_signal_58;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_35 = rvx_signal_62;
				rvx_signal_52 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_50);
				rvx_port_07 = rvx_signal_80;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_84 = rvx_signal_62;
				rvx_signal_51 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_13);
				rvx_port_07 = rvx_signal_64;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_79 = rvx_signal_62;
				rvx_signal_31 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_59);
				rvx_port_07 = rvx_signal_77;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_07 = rvx_signal_62;
				rvx_signal_69 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_42);
				rvx_port_07 = rvx_signal_22;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_38 = rvx_signal_62;
				rvx_signal_26 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_20);
				rvx_port_07 = rvx_signal_02;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_68 = rvx_signal_62;
				rvx_signal_04 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_61);
				rvx_port_07 = rvx_signal_25;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_36 = rvx_signal_62;
				rvx_signal_03 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_08);
				rvx_port_07 = rvx_signal_12;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_17 = rvx_signal_62;
				rvx_signal_89 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_88);
				rvx_port_07 = rvx_signal_24;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_49 = rvx_signal_62;
				rvx_signal_55 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_45);
				rvx_port_07 = rvx_signal_19;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_75 = rvx_signal_62;
				rvx_signal_43 = rvx_signal_57;
				rvx_signal_71 = $unsigned(rvx_signal_46);
				rvx_port_07 = rvx_signal_05;
			end
			default:
				rvx_port_00 = 1;
		endcase
	end
end

assign rvx_port_09[00] = rvx_signal_60;
assign rvx_signal_81 = rvx_port_01[(32)*((00)+1)-1-:32];
assign rvx_port_10[00] = rvx_signal_34;
assign rvx_port_08[(32)*((00)+1)-1-:32] = rvx_signal_53;

assign rvx_port_09[01] = rvx_signal_09;
assign rvx_signal_70 = rvx_port_01[(32)*((01)+1)-1-:32];
assign rvx_port_10[01] = rvx_signal_83;
assign rvx_port_08[(32)*((01)+1)-1-:32] = rvx_signal_67;

assign rvx_port_09[02] = rvx_signal_29;
assign rvx_signal_23 = rvx_port_01[(32)*((02)+1)-1-:32];
assign rvx_port_10[02] = rvx_signal_11;
assign rvx_port_08[(32)*((02)+1)-1-:32] = rvx_signal_74;

assign rvx_port_09[03] = rvx_signal_85;
assign rvx_signal_10 = rvx_port_01[(32)*((03)+1)-1-:32];
assign rvx_port_10[03] = rvx_signal_63;
assign rvx_port_08[(32)*((03)+1)-1-:32] = rvx_signal_73;

assign rvx_port_09[04] = rvx_signal_15;
assign rvx_signal_86 = rvx_port_01[(32)*((04)+1)-1-:32];
assign rvx_port_10[04] = rvx_signal_37;
assign rvx_port_08[(32)*((04)+1)-1-:32] = rvx_signal_65;

assign rvx_port_09[05] = rvx_signal_66;
assign rvx_signal_40 = rvx_port_01[(32)*((05)+1)-1-:32];
assign rvx_port_10[05] = rvx_signal_54;
assign rvx_port_08[(32)*((05)+1)-1-:32] = rvx_signal_30;

assign rvx_port_09[06] = rvx_signal_35;
assign rvx_signal_50 = rvx_port_01[(32)*((06)+1)-1-:32];
assign rvx_port_10[06] = rvx_signal_52;
assign rvx_port_08[(32)*((06)+1)-1-:32] = rvx_signal_41;

assign rvx_port_09[07] = rvx_signal_84;
assign rvx_signal_13 = rvx_port_01[(32)*((07)+1)-1-:32];
assign rvx_port_10[07] = rvx_signal_51;
assign rvx_port_08[(32)*((07)+1)-1-:32] = rvx_signal_06;

assign rvx_port_09[08] = rvx_signal_79;
assign rvx_signal_59 = rvx_port_01[(32)*((08)+1)-1-:32];
assign rvx_port_10[08] = rvx_signal_31;
assign rvx_port_08[(32)*((08)+1)-1-:32] = rvx_signal_27;

assign rvx_port_09[09] = rvx_signal_07;
assign rvx_signal_42 = rvx_port_01[(32)*((09)+1)-1-:32];
assign rvx_port_10[09] = rvx_signal_69;
assign rvx_port_08[(32)*((09)+1)-1-:32] = rvx_signal_47;

assign rvx_port_09[10] = rvx_signal_38;
assign rvx_signal_20 = rvx_port_01[(32)*((10)+1)-1-:32];
assign rvx_port_10[10] = rvx_signal_26;
assign rvx_port_08[(32)*((10)+1)-1-:32] = rvx_signal_48;

assign rvx_port_09[11] = rvx_signal_68;
assign rvx_signal_61 = rvx_port_01[(32)*((11)+1)-1-:32];
assign rvx_port_10[11] = rvx_signal_04;
assign rvx_port_08[(32)*((11)+1)-1-:32] = rvx_signal_44;

assign rvx_port_09[12] = rvx_signal_36;
assign rvx_signal_08 = rvx_port_01[(32)*((12)+1)-1-:32];
assign rvx_port_10[12] = rvx_signal_03;
assign rvx_port_08[(32)*((12)+1)-1-:32] = rvx_signal_82;

assign rvx_port_09[13] = rvx_signal_17;
assign rvx_signal_88 = rvx_port_01[(32)*((13)+1)-1-:32];
assign rvx_port_10[13] = rvx_signal_89;
assign rvx_port_08[(32)*((13)+1)-1-:32] = rvx_signal_00;

assign rvx_port_09[14] = rvx_signal_49;
assign rvx_signal_45 = rvx_port_01[(32)*((14)+1)-1-:32];
assign rvx_port_10[14] = rvx_signal_55;
assign rvx_port_08[(32)*((14)+1)-1-:32] = rvx_signal_56;

assign rvx_port_09[15] = rvx_signal_75;
assign rvx_signal_46 = rvx_port_01[(32)*((15)+1)-1-:32];
assign rvx_port_10[15] = rvx_signal_43;
assign rvx_port_08[(32)*((15)+1)-1-:32] = rvx_signal_72;

assign rvx_signal_21 = 1;

assign rvx_signal_87 = 1;

assign rvx_signal_14 = 1;

assign rvx_signal_01 = 1;

assign rvx_signal_28 = 1;

assign rvx_signal_58 = 1;

assign rvx_signal_80 = 1;

assign rvx_signal_64 = 1;

assign rvx_signal_77 = 1;

assign rvx_signal_22 = 1;

assign rvx_signal_02 = 1;

assign rvx_signal_25 = 1;

assign rvx_signal_12 = 1;

assign rvx_signal_24 = 1;

assign rvx_signal_19 = 1;

assign rvx_signal_05 = 1;

endmodule
