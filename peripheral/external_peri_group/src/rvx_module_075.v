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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_external_peri_group_memorymap_offset.vh"




module RVX_MODULE_075
(
	rvx_port_09,
	rvx_port_00,

	rvx_port_12,
	rvx_port_03,
	rvx_port_07,
	rvx_port_08,
	rvx_port_05,
	rvx_port_04,
	rvx_port_13,
	rvx_port_01,

	rvx_port_11,
	rvx_port_10,
	rvx_port_02,
	rvx_port_14,
	rvx_port_06
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_09, rvx_port_00;
input wire rvx_port_12;
input wire rvx_port_03;
input wire [RVX_GPARA_2-1:0] rvx_port_07;
input wire rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_05;
output wire [RVX_GPARA_0-1:0] rvx_port_04;
output reg rvx_port_13;
output reg rvx_port_01;

input wire rvx_port_11;

output wire [16-1:0] rvx_port_10;
input wire [(32)*(16)-1:0] rvx_port_02;
output wire [16-1:0] rvx_port_14;
output wire [(32)*(16)-1:0] rvx_port_06;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_55;
reg [RVX_GPARA_0-1:0] rvx_signal_35;
wire rvx_signal_88;
wire rvx_signal_12;
wire rvx_signal_03;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_07;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_68;
wire [RVX_GPARA_2-1:0] rvx_signal_07;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_25;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_69;
wire [32-1:0] rvx_signal_09;
reg rvx_signal_39;
wire [32-1:0] rvx_signal_52;
wire rvx_signal_67;
reg rvx_signal_06;
wire [32-1:0] rvx_signal_30;
reg rvx_signal_26;
wire [32-1:0] rvx_signal_38;
wire rvx_signal_15;
reg rvx_signal_53;
wire [32-1:0] rvx_signal_59;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_42;
wire rvx_signal_49;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_16;
reg rvx_signal_75;
wire [32-1:0] rvx_signal_56;
wire rvx_signal_40;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_82;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_46;
wire rvx_signal_08;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_51;
reg rvx_signal_33;
wire [32-1:0] rvx_signal_13;
wire rvx_signal_80;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_54;
reg rvx_signal_24;
wire [32-1:0] rvx_signal_72;
wire rvx_signal_29;
reg rvx_signal_73;
wire [32-1:0] rvx_signal_14;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_17;
wire rvx_signal_70;
reg rvx_signal_27;
wire [32-1:0] rvx_signal_37;
reg rvx_signal_58;
wire [32-1:0] rvx_signal_32;
wire rvx_signal_71;
reg rvx_signal_65;
wire [32-1:0] rvx_signal_86;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_50;
wire rvx_signal_43;
reg rvx_signal_63;
wire [32-1:0] rvx_signal_85;
reg rvx_signal_76;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_19;
reg rvx_signal_60;
wire [32-1:0] rvx_signal_23;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_48;
wire rvx_signal_79;
reg rvx_signal_01;
wire [32-1:0] rvx_signal_36;
reg rvx_signal_77;
wire [32-1:0] rvx_signal_84;
wire rvx_signal_78;
reg rvx_signal_45;
wire [32-1:0] rvx_signal_89;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_18;
wire rvx_signal_31;
reg rvx_signal_64;
wire [32-1:0] rvx_signal_47;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_61;
wire rvx_signal_57;
reg rvx_signal_87;
wire [32-1:0] rvx_signal_21;
reg rvx_signal_74;
wire [32-1:0] rvx_signal_66;
wire rvx_signal_44;

assign rvx_signal_55 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_05);
assign rvx_port_04 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_35);
assign {rvx_signal_07,rvx_signal_25} = paddr_offset;
assign rvx_signal_68 = {rvx_signal_07,addr_unused};
assign rvx_signal_03 = (rvx_signal_25==0);
assign rvx_signal_88 = rvx_port_12 & rvx_port_03 & rvx_signal_03 & (~rvx_port_08);
assign rvx_signal_12 = rvx_port_12 & rvx_port_03 & rvx_signal_03 & rvx_port_08;

assign rvx_signal_52 = $unsigned(rvx_port_05);
assign rvx_signal_38 = $unsigned(rvx_port_05);
assign rvx_signal_42 = $unsigned(rvx_port_05);
assign rvx_signal_56 = $unsigned(rvx_port_05);
assign rvx_signal_46 = $unsigned(rvx_port_05);
assign rvx_signal_13 = $unsigned(rvx_port_05);
assign rvx_signal_72 = $unsigned(rvx_port_05);
assign rvx_signal_17 = $unsigned(rvx_port_05);
assign rvx_signal_32 = $unsigned(rvx_port_05);
assign rvx_signal_50 = $unsigned(rvx_port_05);
assign rvx_signal_28 = $unsigned(rvx_port_05);
assign rvx_signal_48 = $unsigned(rvx_port_05);
assign rvx_signal_84 = $unsigned(rvx_port_05);
assign rvx_signal_18 = $unsigned(rvx_port_05);
assign rvx_signal_61 = $unsigned(rvx_port_05);
assign rvx_signal_66 = $unsigned(rvx_port_05);

always@(*)
begin
	rvx_port_01 = 0;
	rvx_signal_35 = 0;
	rvx_port_13 = 1;

	rvx_signal_69 = 0;
	rvx_signal_39 = 0;

	rvx_signal_06 = 0;
	rvx_signal_26 = 0;

	rvx_signal_53 = 0;
	rvx_signal_10 = 0;

	rvx_signal_02 = 0;
	rvx_signal_75 = 0;

	rvx_signal_00 = 0;
	rvx_signal_04 = 0;

	rvx_signal_20 = 0;
	rvx_signal_33 = 0;

	rvx_signal_34 = 0;
	rvx_signal_24 = 0;

	rvx_signal_73 = 0;
	rvx_signal_22 = 0;

	rvx_signal_27 = 0;
	rvx_signal_58 = 0;

	rvx_signal_65 = 0;
	rvx_signal_11 = 0;

	rvx_signal_63 = 0;
	rvx_signal_76 = 0;

	rvx_signal_60 = 0;
	rvx_signal_41 = 0;

	rvx_signal_01 = 0;
	rvx_signal_77 = 0;

	rvx_signal_45 = 0;
	rvx_signal_05 = 0;

	rvx_signal_64 = 0;
	rvx_signal_83 = 0;

	rvx_signal_87 = 0;
	rvx_signal_74 = 0;

	if(rvx_port_12==1'b 1)
	begin
		case(rvx_signal_68)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_69 = rvx_signal_88;
				rvx_signal_39 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_09);
				rvx_port_13 = rvx_signal_67;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_06 = rvx_signal_88;
				rvx_signal_26 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_30);
				rvx_port_13 = rvx_signal_15;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_53 = rvx_signal_88;
				rvx_signal_10 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_59);
				rvx_port_13 = rvx_signal_49;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_02 = rvx_signal_88;
				rvx_signal_75 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_16);
				rvx_port_13 = rvx_signal_40;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_00 = rvx_signal_88;
				rvx_signal_04 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_82);
				rvx_port_13 = rvx_signal_08;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_20 = rvx_signal_88;
				rvx_signal_33 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_51);
				rvx_port_13 = rvx_signal_80;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_34 = rvx_signal_88;
				rvx_signal_24 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_54);
				rvx_port_13 = rvx_signal_29;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_73 = rvx_signal_88;
				rvx_signal_22 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_14);
				rvx_port_13 = rvx_signal_70;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_27 = rvx_signal_88;
				rvx_signal_58 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_37);
				rvx_port_13 = rvx_signal_71;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_65 = rvx_signal_88;
				rvx_signal_11 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_86);
				rvx_port_13 = rvx_signal_43;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_63 = rvx_signal_88;
				rvx_signal_76 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_85);
				rvx_port_13 = rvx_signal_19;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_60 = rvx_signal_88;
				rvx_signal_41 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_23);
				rvx_port_13 = rvx_signal_79;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_01 = rvx_signal_88;
				rvx_signal_77 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_36);
				rvx_port_13 = rvx_signal_78;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_45 = rvx_signal_88;
				rvx_signal_05 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_89);
				rvx_port_13 = rvx_signal_31;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_64 = rvx_signal_88;
				rvx_signal_83 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_47);
				rvx_port_13 = rvx_signal_57;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_87 = rvx_signal_88;
				rvx_signal_74 = rvx_signal_12;
				rvx_signal_35 = $unsigned(rvx_signal_21);
				rvx_port_13 = rvx_signal_44;
			end
			default:
				rvx_port_01 = 1;
		endcase
	end
end

assign rvx_port_10[00] = rvx_signal_69;
assign rvx_signal_09 = rvx_port_02[(32)*((00)+1)-1-:32];
assign rvx_port_14[00] = rvx_signal_39;
assign rvx_port_06[(32)*((00)+1)-1-:32] = rvx_signal_52;

assign rvx_port_10[01] = rvx_signal_06;
assign rvx_signal_30 = rvx_port_02[(32)*((01)+1)-1-:32];
assign rvx_port_14[01] = rvx_signal_26;
assign rvx_port_06[(32)*((01)+1)-1-:32] = rvx_signal_38;

assign rvx_port_10[02] = rvx_signal_53;
assign rvx_signal_59 = rvx_port_02[(32)*((02)+1)-1-:32];
assign rvx_port_14[02] = rvx_signal_10;
assign rvx_port_06[(32)*((02)+1)-1-:32] = rvx_signal_42;

assign rvx_port_10[03] = rvx_signal_02;
assign rvx_signal_16 = rvx_port_02[(32)*((03)+1)-1-:32];
assign rvx_port_14[03] = rvx_signal_75;
assign rvx_port_06[(32)*((03)+1)-1-:32] = rvx_signal_56;

assign rvx_port_10[04] = rvx_signal_00;
assign rvx_signal_82 = rvx_port_02[(32)*((04)+1)-1-:32];
assign rvx_port_14[04] = rvx_signal_04;
assign rvx_port_06[(32)*((04)+1)-1-:32] = rvx_signal_46;

assign rvx_port_10[05] = rvx_signal_20;
assign rvx_signal_51 = rvx_port_02[(32)*((05)+1)-1-:32];
assign rvx_port_14[05] = rvx_signal_33;
assign rvx_port_06[(32)*((05)+1)-1-:32] = rvx_signal_13;

assign rvx_port_10[06] = rvx_signal_34;
assign rvx_signal_54 = rvx_port_02[(32)*((06)+1)-1-:32];
assign rvx_port_14[06] = rvx_signal_24;
assign rvx_port_06[(32)*((06)+1)-1-:32] = rvx_signal_72;

assign rvx_port_10[07] = rvx_signal_73;
assign rvx_signal_14 = rvx_port_02[(32)*((07)+1)-1-:32];
assign rvx_port_14[07] = rvx_signal_22;
assign rvx_port_06[(32)*((07)+1)-1-:32] = rvx_signal_17;

assign rvx_port_10[08] = rvx_signal_27;
assign rvx_signal_37 = rvx_port_02[(32)*((08)+1)-1-:32];
assign rvx_port_14[08] = rvx_signal_58;
assign rvx_port_06[(32)*((08)+1)-1-:32] = rvx_signal_32;

assign rvx_port_10[09] = rvx_signal_65;
assign rvx_signal_86 = rvx_port_02[(32)*((09)+1)-1-:32];
assign rvx_port_14[09] = rvx_signal_11;
assign rvx_port_06[(32)*((09)+1)-1-:32] = rvx_signal_50;

assign rvx_port_10[10] = rvx_signal_63;
assign rvx_signal_85 = rvx_port_02[(32)*((10)+1)-1-:32];
assign rvx_port_14[10] = rvx_signal_76;
assign rvx_port_06[(32)*((10)+1)-1-:32] = rvx_signal_28;

assign rvx_port_10[11] = rvx_signal_60;
assign rvx_signal_23 = rvx_port_02[(32)*((11)+1)-1-:32];
assign rvx_port_14[11] = rvx_signal_41;
assign rvx_port_06[(32)*((11)+1)-1-:32] = rvx_signal_48;

assign rvx_port_10[12] = rvx_signal_01;
assign rvx_signal_36 = rvx_port_02[(32)*((12)+1)-1-:32];
assign rvx_port_14[12] = rvx_signal_77;
assign rvx_port_06[(32)*((12)+1)-1-:32] = rvx_signal_84;

assign rvx_port_10[13] = rvx_signal_45;
assign rvx_signal_89 = rvx_port_02[(32)*((13)+1)-1-:32];
assign rvx_port_14[13] = rvx_signal_05;
assign rvx_port_06[(32)*((13)+1)-1-:32] = rvx_signal_18;

assign rvx_port_10[14] = rvx_signal_64;
assign rvx_signal_47 = rvx_port_02[(32)*((14)+1)-1-:32];
assign rvx_port_14[14] = rvx_signal_83;
assign rvx_port_06[(32)*((14)+1)-1-:32] = rvx_signal_61;

assign rvx_port_10[15] = rvx_signal_87;
assign rvx_signal_21 = rvx_port_02[(32)*((15)+1)-1-:32];
assign rvx_port_14[15] = rvx_signal_74;
assign rvx_port_06[(32)*((15)+1)-1-:32] = rvx_signal_66;

assign rvx_signal_67 = 1;

assign rvx_signal_15 = 1;

assign rvx_signal_49 = 1;

assign rvx_signal_40 = 1;

assign rvx_signal_08 = 1;

assign rvx_signal_80 = 1;

assign rvx_signal_29 = 1;

assign rvx_signal_70 = 1;

assign rvx_signal_71 = 1;

assign rvx_signal_43 = 1;

assign rvx_signal_19 = 1;

assign rvx_signal_79 = 1;

assign rvx_signal_78 = 1;

assign rvx_signal_31 = 1;

assign rvx_signal_57 = 1;

assign rvx_signal_44 = 1;

endmodule
