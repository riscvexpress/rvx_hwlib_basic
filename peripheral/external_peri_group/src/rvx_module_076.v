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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_external_peri_group_memorymap_offset.vh"




module RVX_MODULE_076
(
	rvx_port_14,
	rvx_port_07,

	rvx_port_06,
	rvx_port_11,
	rvx_port_04,
	rvx_port_09,
	rvx_port_12,
	rvx_port_01,
	rvx_port_00,
	rvx_port_13,

	rvx_port_05,
	rvx_port_10,
	rvx_port_03,
	rvx_port_02,
	rvx_port_08
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_14, rvx_port_07;
input wire rvx_port_06;
input wire rvx_port_11;
input wire [RVX_GPARA_2-1:0] rvx_port_04;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output reg rvx_port_00;
output reg rvx_port_13;

input wire rvx_port_05;

output wire [16-1:0] rvx_port_10;
input wire [(32)*(16)-1:0] rvx_port_03;
output wire [16-1:0] rvx_port_02;
output wire [(32)*(16)-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_14;
reg [RVX_GPARA_0-1:0] rvx_signal_57;
wire rvx_signal_86;
wire rvx_signal_05;
wire rvx_signal_31;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_04;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_10;
wire [RVX_GPARA_2-1:0] rvx_signal_69;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_72;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_68;
wire [32-1:0] rvx_signal_15;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_73;
wire rvx_signal_38;
reg rvx_signal_47;
wire [32-1:0] rvx_signal_23;
reg rvx_signal_18;
wire [32-1:0] rvx_signal_67;
wire rvx_signal_89;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_54;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_66;
wire rvx_signal_01;
reg rvx_signal_59;
wire [32-1:0] rvx_signal_75;
reg rvx_signal_85;
wire [32-1:0] rvx_signal_50;
wire rvx_signal_20;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_45;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_88;
wire rvx_signal_70;
reg rvx_signal_74;
wire [32-1:0] rvx_signal_60;
reg rvx_signal_71;
wire [32-1:0] rvx_signal_19;
wire rvx_signal_42;
reg rvx_signal_78;
wire [32-1:0] rvx_signal_04;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_40;
wire rvx_signal_17;
reg rvx_signal_77;
wire [32-1:0] rvx_signal_28;
reg rvx_signal_48;
wire [32-1:0] rvx_signal_65;
wire rvx_signal_27;
reg rvx_signal_79;
wire [32-1:0] rvx_signal_87;
reg rvx_signal_43;
wire [32-1:0] rvx_signal_84;
wire rvx_signal_08;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_52;
reg rvx_signal_26;
wire [32-1:0] rvx_signal_33;
wire rvx_signal_13;
reg rvx_signal_82;
wire [32-1:0] rvx_signal_44;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_63;
wire rvx_signal_25;
reg rvx_signal_53;
wire [32-1:0] rvx_signal_16;
reg rvx_signal_81;
wire [32-1:0] rvx_signal_80;
wire rvx_signal_21;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_07;
wire rvx_signal_12;
reg rvx_signal_46;
wire [32-1:0] rvx_signal_24;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_36;
wire rvx_signal_39;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_62;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_22;
reg rvx_signal_58;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_51;
wire [32-1:0] rvx_signal_35;
wire rvx_signal_76;

assign rvx_signal_14 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_12);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_57);
assign {rvx_signal_69,rvx_signal_72} = paddr_offset;
assign rvx_signal_10 = {rvx_signal_69,addr_unused};
assign rvx_signal_31 = (rvx_signal_72==0);
assign rvx_signal_86 = rvx_port_06 & rvx_port_11 & rvx_signal_31 & (~rvx_port_09);
assign rvx_signal_05 = rvx_port_06 & rvx_port_11 & rvx_signal_31 & rvx_port_09;

assign rvx_signal_73 = $unsigned(rvx_port_12);
assign rvx_signal_67 = $unsigned(rvx_port_12);
assign rvx_signal_66 = $unsigned(rvx_port_12);
assign rvx_signal_50 = $unsigned(rvx_port_12);
assign rvx_signal_88 = $unsigned(rvx_port_12);
assign rvx_signal_19 = $unsigned(rvx_port_12);
assign rvx_signal_40 = $unsigned(rvx_port_12);
assign rvx_signal_65 = $unsigned(rvx_port_12);
assign rvx_signal_84 = $unsigned(rvx_port_12);
assign rvx_signal_33 = $unsigned(rvx_port_12);
assign rvx_signal_63 = $unsigned(rvx_port_12);
assign rvx_signal_80 = $unsigned(rvx_port_12);
assign rvx_signal_07 = $unsigned(rvx_port_12);
assign rvx_signal_36 = $unsigned(rvx_port_12);
assign rvx_signal_06 = $unsigned(rvx_port_12);
assign rvx_signal_35 = $unsigned(rvx_port_12);

always@(*)
begin
	rvx_port_13 = 0;
	rvx_signal_57 = 0;
	rvx_port_00 = 1;

	rvx_signal_68 = 0;
	rvx_signal_09 = 0;

	rvx_signal_47 = 0;
	rvx_signal_18 = 0;

	rvx_signal_00 = 0;
	rvx_signal_03 = 0;

	rvx_signal_59 = 0;
	rvx_signal_85 = 0;

	rvx_signal_49 = 0;
	rvx_signal_11 = 0;

	rvx_signal_74 = 0;
	rvx_signal_71 = 0;

	rvx_signal_78 = 0;
	rvx_signal_37 = 0;

	rvx_signal_77 = 0;
	rvx_signal_48 = 0;

	rvx_signal_79 = 0;
	rvx_signal_43 = 0;

	rvx_signal_56 = 0;
	rvx_signal_26 = 0;

	rvx_signal_82 = 0;
	rvx_signal_41 = 0;

	rvx_signal_53 = 0;
	rvx_signal_81 = 0;

	rvx_signal_83 = 0;
	rvx_signal_02 = 0;

	rvx_signal_46 = 0;
	rvx_signal_30 = 0;

	rvx_signal_32 = 0;
	rvx_signal_34 = 0;

	rvx_signal_58 = 0;
	rvx_signal_51 = 0;

	if(rvx_port_06==1'b 1)
	begin
		case(rvx_signal_10)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_68 = rvx_signal_86;
				rvx_signal_09 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_15);
				rvx_port_00 = rvx_signal_38;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_47 = rvx_signal_86;
				rvx_signal_18 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_23);
				rvx_port_00 = rvx_signal_89;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_00 = rvx_signal_86;
				rvx_signal_03 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_54);
				rvx_port_00 = rvx_signal_01;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_59 = rvx_signal_86;
				rvx_signal_85 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_75);
				rvx_port_00 = rvx_signal_20;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_49 = rvx_signal_86;
				rvx_signal_11 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_45);
				rvx_port_00 = rvx_signal_70;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_74 = rvx_signal_86;
				rvx_signal_71 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_60);
				rvx_port_00 = rvx_signal_42;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_78 = rvx_signal_86;
				rvx_signal_37 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_04);
				rvx_port_00 = rvx_signal_17;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_77 = rvx_signal_86;
				rvx_signal_48 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_28);
				rvx_port_00 = rvx_signal_27;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_79 = rvx_signal_86;
				rvx_signal_43 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_87);
				rvx_port_00 = rvx_signal_08;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_56 = rvx_signal_86;
				rvx_signal_26 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_52);
				rvx_port_00 = rvx_signal_13;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_82 = rvx_signal_86;
				rvx_signal_41 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_44);
				rvx_port_00 = rvx_signal_25;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_53 = rvx_signal_86;
				rvx_signal_81 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_16);
				rvx_port_00 = rvx_signal_21;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_83 = rvx_signal_86;
				rvx_signal_02 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_55);
				rvx_port_00 = rvx_signal_12;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_46 = rvx_signal_86;
				rvx_signal_30 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_24);
				rvx_port_00 = rvx_signal_39;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_32 = rvx_signal_86;
				rvx_signal_34 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_62);
				rvx_port_00 = rvx_signal_22;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_58 = rvx_signal_86;
				rvx_signal_51 = rvx_signal_05;
				rvx_signal_57 = $unsigned(rvx_signal_29);
				rvx_port_00 = rvx_signal_76;
			end
			default:
				rvx_port_13 = 1;
		endcase
	end
end

assign rvx_port_10[00] = rvx_signal_68;
assign rvx_signal_15 = rvx_port_03[(32)*((00)+1)-1-:32];
assign rvx_port_02[00] = rvx_signal_09;
assign rvx_port_08[(32)*((00)+1)-1-:32] = rvx_signal_73;

assign rvx_port_10[01] = rvx_signal_47;
assign rvx_signal_23 = rvx_port_03[(32)*((01)+1)-1-:32];
assign rvx_port_02[01] = rvx_signal_18;
assign rvx_port_08[(32)*((01)+1)-1-:32] = rvx_signal_67;

assign rvx_port_10[02] = rvx_signal_00;
assign rvx_signal_54 = rvx_port_03[(32)*((02)+1)-1-:32];
assign rvx_port_02[02] = rvx_signal_03;
assign rvx_port_08[(32)*((02)+1)-1-:32] = rvx_signal_66;

assign rvx_port_10[03] = rvx_signal_59;
assign rvx_signal_75 = rvx_port_03[(32)*((03)+1)-1-:32];
assign rvx_port_02[03] = rvx_signal_85;
assign rvx_port_08[(32)*((03)+1)-1-:32] = rvx_signal_50;

assign rvx_port_10[04] = rvx_signal_49;
assign rvx_signal_45 = rvx_port_03[(32)*((04)+1)-1-:32];
assign rvx_port_02[04] = rvx_signal_11;
assign rvx_port_08[(32)*((04)+1)-1-:32] = rvx_signal_88;

assign rvx_port_10[05] = rvx_signal_74;
assign rvx_signal_60 = rvx_port_03[(32)*((05)+1)-1-:32];
assign rvx_port_02[05] = rvx_signal_71;
assign rvx_port_08[(32)*((05)+1)-1-:32] = rvx_signal_19;

assign rvx_port_10[06] = rvx_signal_78;
assign rvx_signal_04 = rvx_port_03[(32)*((06)+1)-1-:32];
assign rvx_port_02[06] = rvx_signal_37;
assign rvx_port_08[(32)*((06)+1)-1-:32] = rvx_signal_40;

assign rvx_port_10[07] = rvx_signal_77;
assign rvx_signal_28 = rvx_port_03[(32)*((07)+1)-1-:32];
assign rvx_port_02[07] = rvx_signal_48;
assign rvx_port_08[(32)*((07)+1)-1-:32] = rvx_signal_65;

assign rvx_port_10[08] = rvx_signal_79;
assign rvx_signal_87 = rvx_port_03[(32)*((08)+1)-1-:32];
assign rvx_port_02[08] = rvx_signal_43;
assign rvx_port_08[(32)*((08)+1)-1-:32] = rvx_signal_84;

assign rvx_port_10[09] = rvx_signal_56;
assign rvx_signal_52 = rvx_port_03[(32)*((09)+1)-1-:32];
assign rvx_port_02[09] = rvx_signal_26;
assign rvx_port_08[(32)*((09)+1)-1-:32] = rvx_signal_33;

assign rvx_port_10[10] = rvx_signal_82;
assign rvx_signal_44 = rvx_port_03[(32)*((10)+1)-1-:32];
assign rvx_port_02[10] = rvx_signal_41;
assign rvx_port_08[(32)*((10)+1)-1-:32] = rvx_signal_63;

assign rvx_port_10[11] = rvx_signal_53;
assign rvx_signal_16 = rvx_port_03[(32)*((11)+1)-1-:32];
assign rvx_port_02[11] = rvx_signal_81;
assign rvx_port_08[(32)*((11)+1)-1-:32] = rvx_signal_80;

assign rvx_port_10[12] = rvx_signal_83;
assign rvx_signal_55 = rvx_port_03[(32)*((12)+1)-1-:32];
assign rvx_port_02[12] = rvx_signal_02;
assign rvx_port_08[(32)*((12)+1)-1-:32] = rvx_signal_07;

assign rvx_port_10[13] = rvx_signal_46;
assign rvx_signal_24 = rvx_port_03[(32)*((13)+1)-1-:32];
assign rvx_port_02[13] = rvx_signal_30;
assign rvx_port_08[(32)*((13)+1)-1-:32] = rvx_signal_36;

assign rvx_port_10[14] = rvx_signal_32;
assign rvx_signal_62 = rvx_port_03[(32)*((14)+1)-1-:32];
assign rvx_port_02[14] = rvx_signal_34;
assign rvx_port_08[(32)*((14)+1)-1-:32] = rvx_signal_06;

assign rvx_port_10[15] = rvx_signal_58;
assign rvx_signal_29 = rvx_port_03[(32)*((15)+1)-1-:32];
assign rvx_port_02[15] = rvx_signal_51;
assign rvx_port_08[(32)*((15)+1)-1-:32] = rvx_signal_35;

assign rvx_signal_38 = 1;

assign rvx_signal_89 = 1;

assign rvx_signal_01 = 1;

assign rvx_signal_20 = 1;

assign rvx_signal_70 = 1;

assign rvx_signal_42 = 1;

assign rvx_signal_17 = 1;

assign rvx_signal_27 = 1;

assign rvx_signal_08 = 1;

assign rvx_signal_13 = 1;

assign rvx_signal_25 = 1;

assign rvx_signal_21 = 1;

assign rvx_signal_12 = 1;

assign rvx_signal_39 = 1;

assign rvx_signal_22 = 1;

assign rvx_signal_76 = 1;

endmodule
