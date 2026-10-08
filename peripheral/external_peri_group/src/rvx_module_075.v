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




module RVX_MODULE_075
(
	rvx_port_13,
	rvx_port_02,

	rvx_port_01,
	rvx_port_11,
	rvx_port_14,
	rvx_port_04,
	rvx_port_03,
	rvx_port_12,
	rvx_port_07,
	rvx_port_06,

	rvx_port_05,
	rvx_port_10,
	rvx_port_09,
	rvx_port_00,
	rvx_port_08
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_13, rvx_port_02;
input wire rvx_port_01;
input wire rvx_port_11;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire [RVX_GPARA_1-1:0] rvx_port_12;
output reg rvx_port_07;
output reg rvx_port_06;

input wire rvx_port_05;

output wire [16-1:0] rvx_port_10;
input wire [(32)*(16)-1:0] rvx_port_09;
output wire [16-1:0] rvx_port_00;
output wire [(32)*(16)-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_28;
reg [RVX_GPARA_1-1:0] rvx_signal_84;
wire rvx_signal_40;
wire rvx_signal_64;
wire rvx_signal_43;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_14;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_31;
wire [RVX_GPARA_0-1:0] rvx_signal_20;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_39;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_12;
wire [32-1:0] rvx_signal_81;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_67;
wire rvx_signal_26;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_50;
wire [32-1:0] rvx_signal_85;
wire rvx_signal_45;
reg rvx_signal_59;
wire [32-1:0] rvx_signal_35;
reg rvx_signal_82;
wire [32-1:0] rvx_signal_52;
wire rvx_signal_73;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_24;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_72;
wire rvx_signal_55;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_80;
reg rvx_signal_46;
wire [32-1:0] rvx_signal_89;
wire rvx_signal_18;
reg rvx_signal_48;
wire [32-1:0] rvx_signal_44;
reg rvx_signal_23;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_27;
reg rvx_signal_86;
wire [32-1:0] rvx_signal_21;
reg rvx_signal_33;
wire [32-1:0] rvx_signal_88;
wire rvx_signal_22;
reg rvx_signal_14;
wire [32-1:0] rvx_signal_01;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_65;
wire rvx_signal_71;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_38;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_76;
wire rvx_signal_09;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_87;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_79;
wire rvx_signal_30;
reg rvx_signal_63;
wire [32-1:0] rvx_signal_58;
reg rvx_signal_62;
wire [32-1:0] rvx_signal_57;
wire rvx_signal_17;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_36;
reg rvx_signal_70;
wire [32-1:0] rvx_signal_00;
wire rvx_signal_25;
reg rvx_signal_74;
wire [32-1:0] rvx_signal_53;
reg rvx_signal_47;
wire [32-1:0] rvx_signal_02;
wire rvx_signal_68;
reg rvx_signal_69;
wire [32-1:0] rvx_signal_60;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_77;
wire rvx_signal_78;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_42;
reg rvx_signal_75;
wire [32-1:0] rvx_signal_15;
wire rvx_signal_19;
reg rvx_signal_06;
wire [32-1:0] rvx_signal_34;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_61;
wire rvx_signal_66;

assign rvx_signal_28 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_03);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_84);
assign {rvx_signal_20,rvx_signal_39} = paddr_offset;
assign rvx_signal_31 = {rvx_signal_20,addr_unused};
assign rvx_signal_43 = (rvx_signal_39==0);
assign rvx_signal_40 = rvx_port_01 & rvx_port_11 & rvx_signal_43 & (~rvx_port_04);
assign rvx_signal_64 = rvx_port_01 & rvx_port_11 & rvx_signal_43 & rvx_port_04;

assign rvx_signal_67 = $unsigned(rvx_port_03);
assign rvx_signal_85 = $unsigned(rvx_port_03);
assign rvx_signal_52 = $unsigned(rvx_port_03);
assign rvx_signal_72 = $unsigned(rvx_port_03);
assign rvx_signal_89 = $unsigned(rvx_port_03);
assign rvx_signal_08 = $unsigned(rvx_port_03);
assign rvx_signal_88 = $unsigned(rvx_port_03);
assign rvx_signal_65 = $unsigned(rvx_port_03);
assign rvx_signal_76 = $unsigned(rvx_port_03);
assign rvx_signal_79 = $unsigned(rvx_port_03);
assign rvx_signal_57 = $unsigned(rvx_port_03);
assign rvx_signal_00 = $unsigned(rvx_port_03);
assign rvx_signal_02 = $unsigned(rvx_port_03);
assign rvx_signal_77 = $unsigned(rvx_port_03);
assign rvx_signal_15 = $unsigned(rvx_port_03);
assign rvx_signal_61 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_06 = 0;
	rvx_signal_84 = 0;
	rvx_port_07 = 1;

	rvx_signal_12 = 0;
	rvx_signal_05 = 0;

	rvx_signal_41 = 0;
	rvx_signal_50 = 0;

	rvx_signal_59 = 0;
	rvx_signal_82 = 0;

	rvx_signal_49 = 0;
	rvx_signal_16 = 0;

	rvx_signal_11 = 0;
	rvx_signal_46 = 0;

	rvx_signal_48 = 0;
	rvx_signal_23 = 0;

	rvx_signal_86 = 0;
	rvx_signal_33 = 0;

	rvx_signal_14 = 0;
	rvx_signal_13 = 0;

	rvx_signal_56 = 0;
	rvx_signal_83 = 0;

	rvx_signal_04 = 0;
	rvx_signal_32 = 0;

	rvx_signal_63 = 0;
	rvx_signal_62 = 0;

	rvx_signal_10 = 0;
	rvx_signal_70 = 0;

	rvx_signal_74 = 0;
	rvx_signal_47 = 0;

	rvx_signal_69 = 0;
	rvx_signal_37 = 0;

	rvx_signal_07 = 0;
	rvx_signal_75 = 0;

	rvx_signal_06 = 0;
	rvx_signal_03 = 0;

	if(rvx_port_01==1'b 1)
	begin
		case(rvx_signal_31)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_12 = rvx_signal_40;
				rvx_signal_05 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_81);
				rvx_port_07 = rvx_signal_26;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_41 = rvx_signal_40;
				rvx_signal_50 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_29);
				rvx_port_07 = rvx_signal_45;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_59 = rvx_signal_40;
				rvx_signal_82 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_35);
				rvx_port_07 = rvx_signal_73;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_49 = rvx_signal_40;
				rvx_signal_16 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_24);
				rvx_port_07 = rvx_signal_55;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_11 = rvx_signal_40;
				rvx_signal_46 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_80);
				rvx_port_07 = rvx_signal_18;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_48 = rvx_signal_40;
				rvx_signal_23 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_44);
				rvx_port_07 = rvx_signal_27;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_86 = rvx_signal_40;
				rvx_signal_33 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_21);
				rvx_port_07 = rvx_signal_22;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_14 = rvx_signal_40;
				rvx_signal_13 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_01);
				rvx_port_07 = rvx_signal_71;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_56 = rvx_signal_40;
				rvx_signal_83 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_38);
				rvx_port_07 = rvx_signal_09;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_04 = rvx_signal_40;
				rvx_signal_32 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_87);
				rvx_port_07 = rvx_signal_30;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_63 = rvx_signal_40;
				rvx_signal_62 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_58);
				rvx_port_07 = rvx_signal_17;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_10 = rvx_signal_40;
				rvx_signal_70 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_36);
				rvx_port_07 = rvx_signal_25;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_74 = rvx_signal_40;
				rvx_signal_47 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_53);
				rvx_port_07 = rvx_signal_68;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_69 = rvx_signal_40;
				rvx_signal_37 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_60);
				rvx_port_07 = rvx_signal_78;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_07 = rvx_signal_40;
				rvx_signal_75 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_42);
				rvx_port_07 = rvx_signal_19;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_06 = rvx_signal_40;
				rvx_signal_03 = rvx_signal_64;
				rvx_signal_84 = $unsigned(rvx_signal_34);
				rvx_port_07 = rvx_signal_66;
			end
			default:
				rvx_port_06 = 1;
		endcase
	end
end

assign rvx_port_10[00] = rvx_signal_12;
assign rvx_signal_81 = rvx_port_09[(32)*((00)+1)-1-:32];
assign rvx_port_00[00] = rvx_signal_05;
assign rvx_port_08[(32)*((00)+1)-1-:32] = rvx_signal_67;

assign rvx_port_10[01] = rvx_signal_41;
assign rvx_signal_29 = rvx_port_09[(32)*((01)+1)-1-:32];
assign rvx_port_00[01] = rvx_signal_50;
assign rvx_port_08[(32)*((01)+1)-1-:32] = rvx_signal_85;

assign rvx_port_10[02] = rvx_signal_59;
assign rvx_signal_35 = rvx_port_09[(32)*((02)+1)-1-:32];
assign rvx_port_00[02] = rvx_signal_82;
assign rvx_port_08[(32)*((02)+1)-1-:32] = rvx_signal_52;

assign rvx_port_10[03] = rvx_signal_49;
assign rvx_signal_24 = rvx_port_09[(32)*((03)+1)-1-:32];
assign rvx_port_00[03] = rvx_signal_16;
assign rvx_port_08[(32)*((03)+1)-1-:32] = rvx_signal_72;

assign rvx_port_10[04] = rvx_signal_11;
assign rvx_signal_80 = rvx_port_09[(32)*((04)+1)-1-:32];
assign rvx_port_00[04] = rvx_signal_46;
assign rvx_port_08[(32)*((04)+1)-1-:32] = rvx_signal_89;

assign rvx_port_10[05] = rvx_signal_48;
assign rvx_signal_44 = rvx_port_09[(32)*((05)+1)-1-:32];
assign rvx_port_00[05] = rvx_signal_23;
assign rvx_port_08[(32)*((05)+1)-1-:32] = rvx_signal_08;

assign rvx_port_10[06] = rvx_signal_86;
assign rvx_signal_21 = rvx_port_09[(32)*((06)+1)-1-:32];
assign rvx_port_00[06] = rvx_signal_33;
assign rvx_port_08[(32)*((06)+1)-1-:32] = rvx_signal_88;

assign rvx_port_10[07] = rvx_signal_14;
assign rvx_signal_01 = rvx_port_09[(32)*((07)+1)-1-:32];
assign rvx_port_00[07] = rvx_signal_13;
assign rvx_port_08[(32)*((07)+1)-1-:32] = rvx_signal_65;

assign rvx_port_10[08] = rvx_signal_56;
assign rvx_signal_38 = rvx_port_09[(32)*((08)+1)-1-:32];
assign rvx_port_00[08] = rvx_signal_83;
assign rvx_port_08[(32)*((08)+1)-1-:32] = rvx_signal_76;

assign rvx_port_10[09] = rvx_signal_04;
assign rvx_signal_87 = rvx_port_09[(32)*((09)+1)-1-:32];
assign rvx_port_00[09] = rvx_signal_32;
assign rvx_port_08[(32)*((09)+1)-1-:32] = rvx_signal_79;

assign rvx_port_10[10] = rvx_signal_63;
assign rvx_signal_58 = rvx_port_09[(32)*((10)+1)-1-:32];
assign rvx_port_00[10] = rvx_signal_62;
assign rvx_port_08[(32)*((10)+1)-1-:32] = rvx_signal_57;

assign rvx_port_10[11] = rvx_signal_10;
assign rvx_signal_36 = rvx_port_09[(32)*((11)+1)-1-:32];
assign rvx_port_00[11] = rvx_signal_70;
assign rvx_port_08[(32)*((11)+1)-1-:32] = rvx_signal_00;

assign rvx_port_10[12] = rvx_signal_74;
assign rvx_signal_53 = rvx_port_09[(32)*((12)+1)-1-:32];
assign rvx_port_00[12] = rvx_signal_47;
assign rvx_port_08[(32)*((12)+1)-1-:32] = rvx_signal_02;

assign rvx_port_10[13] = rvx_signal_69;
assign rvx_signal_60 = rvx_port_09[(32)*((13)+1)-1-:32];
assign rvx_port_00[13] = rvx_signal_37;
assign rvx_port_08[(32)*((13)+1)-1-:32] = rvx_signal_77;

assign rvx_port_10[14] = rvx_signal_07;
assign rvx_signal_42 = rvx_port_09[(32)*((14)+1)-1-:32];
assign rvx_port_00[14] = rvx_signal_75;
assign rvx_port_08[(32)*((14)+1)-1-:32] = rvx_signal_15;

assign rvx_port_10[15] = rvx_signal_06;
assign rvx_signal_34 = rvx_port_09[(32)*((15)+1)-1-:32];
assign rvx_port_00[15] = rvx_signal_03;
assign rvx_port_08[(32)*((15)+1)-1-:32] = rvx_signal_61;

assign rvx_signal_26 = 1;

assign rvx_signal_45 = 1;

assign rvx_signal_73 = 1;

assign rvx_signal_55 = 1;

assign rvx_signal_18 = 1;

assign rvx_signal_27 = 1;

assign rvx_signal_22 = 1;

assign rvx_signal_71 = 1;

assign rvx_signal_09 = 1;

assign rvx_signal_30 = 1;

assign rvx_signal_17 = 1;

assign rvx_signal_25 = 1;

assign rvx_signal_68 = 1;

assign rvx_signal_78 = 1;

assign rvx_signal_19 = 1;

assign rvx_signal_66 = 1;

endmodule
