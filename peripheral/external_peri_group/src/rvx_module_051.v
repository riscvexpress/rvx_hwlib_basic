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
`include "ervp_external_peri_group_memorymap_offset.vh"




module RVX_MODULE_051
(
	rvx_port_08,
	rvx_port_13,

	rvx_port_02,
	rvx_port_06,
	rvx_port_09,
	rvx_port_05,
	rvx_port_07,
	rvx_port_03,
	rvx_port_11,
	rvx_port_12,

	rvx_port_01,
	rvx_port_00,
	rvx_port_10,
	rvx_port_14,
	rvx_port_04
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_08, rvx_port_13;
input wire rvx_port_02;
input wire rvx_port_06;
input wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire rvx_port_05;
input wire [RVX_GPARA_1-1:0] rvx_port_07;
output wire [RVX_GPARA_1-1:0] rvx_port_03;
output reg rvx_port_11;
output reg rvx_port_12;

input wire rvx_port_01;

output wire [`NUM_GPIO_USER_GPIO-1:0] rvx_port_00;
input wire [(`BW_GPIO_USER_GPIO)*(`NUM_GPIO_USER_GPIO)-1:0] rvx_port_10;
output wire [`NUM_GPIO_USER_GPIO-1:0] rvx_port_14;
output wire [(`BW_GPIO_USER_GPIO)*(`NUM_GPIO_USER_GPIO)-1:0] rvx_port_04;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_06;
reg [RVX_GPARA_1-1:0] rvx_signal_31;
wire rvx_signal_41;
wire rvx_signal_15;
wire rvx_signal_47;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_09;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_25;
wire [RVX_GPARA_2-1:0] rvx_signal_39;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_11;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_63;
wire [RVX_GPARA_1-1:0] rvx_signal_33;
reg rvx_signal_13;
wire [RVX_GPARA_1-1:0] rvx_signal_05;
wire rvx_signal_74;
reg rvx_signal_40;
wire [RVX_GPARA_1-1:0] rvx_signal_84;
reg rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_85;
wire rvx_signal_38;
reg rvx_signal_79;
wire [RVX_GPARA_1-1:0] rvx_signal_75;
reg rvx_signal_14;
wire [RVX_GPARA_1-1:0] rvx_signal_83;
wire rvx_signal_71;
reg rvx_signal_27;
wire [RVX_GPARA_1-1:0] rvx_signal_08;
reg rvx_signal_55;
wire [RVX_GPARA_1-1:0] rvx_signal_89;
wire rvx_signal_24;
reg rvx_signal_46;
wire [RVX_GPARA_1-1:0] rvx_signal_88;
reg rvx_signal_68;
wire [RVX_GPARA_1-1:0] rvx_signal_54;
wire rvx_signal_17;
reg rvx_signal_19;
wire [RVX_GPARA_1-1:0] rvx_signal_81;
reg rvx_signal_53;
wire [RVX_GPARA_1-1:0] rvx_signal_70;
wire rvx_signal_56;
reg rvx_signal_80;
wire [RVX_GPARA_1-1:0] rvx_signal_43;
reg rvx_signal_69;
wire [RVX_GPARA_1-1:0] rvx_signal_49;
wire rvx_signal_72;
reg rvx_signal_57;
wire [RVX_GPARA_1-1:0] rvx_signal_35;
reg rvx_signal_51;
wire [RVX_GPARA_1-1:0] rvx_signal_52;
wire rvx_signal_29;
reg rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_12;
reg rvx_signal_22;
wire [RVX_GPARA_1-1:0] rvx_signal_64;
wire rvx_signal_58;
reg rvx_signal_78;
wire [RVX_GPARA_1-1:0] rvx_signal_65;
reg rvx_signal_20;
wire [RVX_GPARA_1-1:0] rvx_signal_82;
wire rvx_signal_10;
reg rvx_signal_60;
wire [RVX_GPARA_1-1:0] rvx_signal_01;
reg rvx_signal_67;
wire [RVX_GPARA_1-1:0] rvx_signal_32;
wire rvx_signal_07;
reg rvx_signal_87;
wire [RVX_GPARA_1-1:0] rvx_signal_73;
reg rvx_signal_44;
wire [RVX_GPARA_1-1:0] rvx_signal_50;
wire rvx_signal_37;
reg rvx_signal_30;
wire [RVX_GPARA_1-1:0] rvx_signal_26;
reg rvx_signal_86;
wire [RVX_GPARA_1-1:0] rvx_signal_76;
wire rvx_signal_62;
reg rvx_signal_02;
wire [RVX_GPARA_1-1:0] rvx_signal_18;
reg rvx_signal_48;
wire [RVX_GPARA_1-1:0] rvx_signal_34;
wire rvx_signal_03;
reg rvx_signal_59;
wire [RVX_GPARA_1-1:0] rvx_signal_09;
reg rvx_signal_61;
wire [RVX_GPARA_1-1:0] rvx_signal_28;
wire rvx_signal_23;
reg rvx_signal_45;
wire [RVX_GPARA_1-1:0] rvx_signal_04;
reg rvx_signal_77;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
wire rvx_signal_42;

assign rvx_signal_06 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_07);
assign rvx_port_03 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_31);
assign {rvx_signal_39,rvx_signal_11} = paddr_offset;
assign rvx_signal_25 = {rvx_signal_39,addr_unused};
assign rvx_signal_47 = (rvx_signal_11==0);
assign rvx_signal_41 = rvx_port_02 & rvx_port_06 & rvx_signal_47 & (~rvx_port_05);
assign rvx_signal_15 = rvx_port_02 & rvx_port_06 & rvx_signal_47 & rvx_port_05;

assign rvx_signal_05 = $unsigned(rvx_port_07);
assign rvx_signal_85 = $unsigned(rvx_port_07);
assign rvx_signal_83 = $unsigned(rvx_port_07);
assign rvx_signal_89 = $unsigned(rvx_port_07);
assign rvx_signal_54 = $unsigned(rvx_port_07);
assign rvx_signal_70 = $unsigned(rvx_port_07);
assign rvx_signal_49 = $unsigned(rvx_port_07);
assign rvx_signal_52 = $unsigned(rvx_port_07);
assign rvx_signal_64 = $unsigned(rvx_port_07);
assign rvx_signal_82 = $unsigned(rvx_port_07);
assign rvx_signal_32 = $unsigned(rvx_port_07);
assign rvx_signal_50 = $unsigned(rvx_port_07);
assign rvx_signal_76 = $unsigned(rvx_port_07);
assign rvx_signal_34 = $unsigned(rvx_port_07);
assign rvx_signal_28 = $unsigned(rvx_port_07);
assign rvx_signal_36 = $unsigned(rvx_port_07);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_31 = 0;
	rvx_port_11 = 1;

	rvx_signal_63 = 0;
	rvx_signal_13 = 0;

	rvx_signal_40 = 0;
	rvx_signal_16 = 0;

	rvx_signal_79 = 0;
	rvx_signal_14 = 0;

	rvx_signal_27 = 0;
	rvx_signal_55 = 0;

	rvx_signal_46 = 0;
	rvx_signal_68 = 0;

	rvx_signal_19 = 0;
	rvx_signal_53 = 0;

	rvx_signal_80 = 0;
	rvx_signal_69 = 0;

	rvx_signal_57 = 0;
	rvx_signal_51 = 0;

	rvx_signal_00 = 0;
	rvx_signal_22 = 0;

	rvx_signal_78 = 0;
	rvx_signal_20 = 0;

	rvx_signal_60 = 0;
	rvx_signal_67 = 0;

	rvx_signal_87 = 0;
	rvx_signal_44 = 0;

	rvx_signal_30 = 0;
	rvx_signal_86 = 0;

	rvx_signal_02 = 0;
	rvx_signal_48 = 0;

	rvx_signal_59 = 0;
	rvx_signal_61 = 0;

	rvx_signal_45 = 0;
	rvx_signal_77 = 0;

	if(rvx_port_02==1'b 1)
	begin
		case(rvx_signal_25)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_63 = rvx_signal_41;
				rvx_signal_13 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_33);
				rvx_port_11 = rvx_signal_74;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_40 = rvx_signal_41;
				rvx_signal_16 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_84);
				rvx_port_11 = rvx_signal_38;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_79 = rvx_signal_41;
				rvx_signal_14 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_75);
				rvx_port_11 = rvx_signal_71;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_27 = rvx_signal_41;
				rvx_signal_55 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_08);
				rvx_port_11 = rvx_signal_24;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_46 = rvx_signal_41;
				rvx_signal_68 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_88);
				rvx_port_11 = rvx_signal_17;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_19 = rvx_signal_41;
				rvx_signal_53 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_81);
				rvx_port_11 = rvx_signal_56;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_80 = rvx_signal_41;
				rvx_signal_69 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_43);
				rvx_port_11 = rvx_signal_72;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_57 = rvx_signal_41;
				rvx_signal_51 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_35);
				rvx_port_11 = rvx_signal_29;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_00 = rvx_signal_41;
				rvx_signal_22 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_12);
				rvx_port_11 = rvx_signal_58;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_78 = rvx_signal_41;
				rvx_signal_20 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_65);
				rvx_port_11 = rvx_signal_10;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_60 = rvx_signal_41;
				rvx_signal_67 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_01);
				rvx_port_11 = rvx_signal_07;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_87 = rvx_signal_41;
				rvx_signal_44 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_73);
				rvx_port_11 = rvx_signal_37;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_30 = rvx_signal_41;
				rvx_signal_86 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_26);
				rvx_port_11 = rvx_signal_62;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_02 = rvx_signal_41;
				rvx_signal_48 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_18);
				rvx_port_11 = rvx_signal_03;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_59 = rvx_signal_41;
				rvx_signal_61 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_09);
				rvx_port_11 = rvx_signal_23;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_45 = rvx_signal_41;
				rvx_signal_77 = rvx_signal_15;
				rvx_signal_31 = $unsigned(rvx_signal_04);
				rvx_port_11 = rvx_signal_42;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

assign rvx_port_00[00] = rvx_signal_63;
assign rvx_signal_33 = rvx_port_10[(32)*((00)+1)-1-:32];
assign rvx_port_14[00] = rvx_signal_13;
assign rvx_port_04[(32)*((00)+1)-1-:32] = rvx_signal_05;

assign rvx_port_00[01] = rvx_signal_40;
assign rvx_signal_84 = rvx_port_10[(32)*((01)+1)-1-:32];
assign rvx_port_14[01] = rvx_signal_16;
assign rvx_port_04[(32)*((01)+1)-1-:32] = rvx_signal_85;

assign rvx_port_00[02] = rvx_signal_79;
assign rvx_signal_75 = rvx_port_10[(32)*((02)+1)-1-:32];
assign rvx_port_14[02] = rvx_signal_14;
assign rvx_port_04[(32)*((02)+1)-1-:32] = rvx_signal_83;

assign rvx_port_00[03] = rvx_signal_27;
assign rvx_signal_08 = rvx_port_10[(32)*((03)+1)-1-:32];
assign rvx_port_14[03] = rvx_signal_55;
assign rvx_port_04[(32)*((03)+1)-1-:32] = rvx_signal_89;

assign rvx_port_00[04] = rvx_signal_46;
assign rvx_signal_88 = rvx_port_10[(32)*((04)+1)-1-:32];
assign rvx_port_14[04] = rvx_signal_68;
assign rvx_port_04[(32)*((04)+1)-1-:32] = rvx_signal_54;

assign rvx_port_00[05] = rvx_signal_19;
assign rvx_signal_81 = rvx_port_10[(32)*((05)+1)-1-:32];
assign rvx_port_14[05] = rvx_signal_53;
assign rvx_port_04[(32)*((05)+1)-1-:32] = rvx_signal_70;

assign rvx_port_00[06] = rvx_signal_80;
assign rvx_signal_43 = rvx_port_10[(32)*((06)+1)-1-:32];
assign rvx_port_14[06] = rvx_signal_69;
assign rvx_port_04[(32)*((06)+1)-1-:32] = rvx_signal_49;

assign rvx_port_00[07] = rvx_signal_57;
assign rvx_signal_35 = rvx_port_10[(32)*((07)+1)-1-:32];
assign rvx_port_14[07] = rvx_signal_51;
assign rvx_port_04[(32)*((07)+1)-1-:32] = rvx_signal_52;

assign rvx_port_00[08] = rvx_signal_00;
assign rvx_signal_12 = rvx_port_10[(32)*((08)+1)-1-:32];
assign rvx_port_14[08] = rvx_signal_22;
assign rvx_port_04[(32)*((08)+1)-1-:32] = rvx_signal_64;

assign rvx_port_00[09] = rvx_signal_78;
assign rvx_signal_65 = rvx_port_10[(32)*((09)+1)-1-:32];
assign rvx_port_14[09] = rvx_signal_20;
assign rvx_port_04[(32)*((09)+1)-1-:32] = rvx_signal_82;

assign rvx_port_00[10] = rvx_signal_60;
assign rvx_signal_01 = rvx_port_10[(32)*((10)+1)-1-:32];
assign rvx_port_14[10] = rvx_signal_67;
assign rvx_port_04[(32)*((10)+1)-1-:32] = rvx_signal_32;

assign rvx_port_00[11] = rvx_signal_87;
assign rvx_signal_73 = rvx_port_10[(32)*((11)+1)-1-:32];
assign rvx_port_14[11] = rvx_signal_44;
assign rvx_port_04[(32)*((11)+1)-1-:32] = rvx_signal_50;

assign rvx_port_00[12] = rvx_signal_30;
assign rvx_signal_26 = rvx_port_10[(32)*((12)+1)-1-:32];
assign rvx_port_14[12] = rvx_signal_86;
assign rvx_port_04[(32)*((12)+1)-1-:32] = rvx_signal_76;

assign rvx_port_00[13] = rvx_signal_02;
assign rvx_signal_18 = rvx_port_10[(32)*((13)+1)-1-:32];
assign rvx_port_14[13] = rvx_signal_48;
assign rvx_port_04[(32)*((13)+1)-1-:32] = rvx_signal_34;

assign rvx_port_00[14] = rvx_signal_59;
assign rvx_signal_09 = rvx_port_10[(32)*((14)+1)-1-:32];
assign rvx_port_14[14] = rvx_signal_61;
assign rvx_port_04[(32)*((14)+1)-1-:32] = rvx_signal_28;

assign rvx_port_00[15] = rvx_signal_45;
assign rvx_signal_04 = rvx_port_10[(32)*((15)+1)-1-:32];
assign rvx_port_14[15] = rvx_signal_77;
assign rvx_port_04[(32)*((15)+1)-1-:32] = rvx_signal_36;

assign rvx_signal_74 = 1;

assign rvx_signal_38 = 1;

assign rvx_signal_71 = 1;

assign rvx_signal_24 = 1;

assign rvx_signal_17 = 1;

assign rvx_signal_56 = 1;

assign rvx_signal_72 = 1;

assign rvx_signal_29 = 1;

assign rvx_signal_58 = 1;

assign rvx_signal_10 = 1;

assign rvx_signal_07 = 1;

assign rvx_signal_37 = 1;

assign rvx_signal_62 = 1;

assign rvx_signal_03 = 1;

assign rvx_signal_23 = 1;

assign rvx_signal_42 = 1;

endmodule
