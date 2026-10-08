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




module RVX_MODULE_043
(
	rvx_port_01,
	rvx_port_11,

	rvx_port_07,
	rvx_port_02,
	rvx_port_00,
	rvx_port_08,
	rvx_port_06,
	rvx_port_05,
	rvx_port_09,
	rvx_port_10,

	rvx_port_04,
	rvx_port_12,
	rvx_port_03
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_01, rvx_port_11;
input wire rvx_port_07;
input wire rvx_port_02;
input wire [RVX_GPARA_1-1:0] rvx_port_00;
input wire rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire [RVX_GPARA_0-1:0] rvx_port_05;
output reg rvx_port_09;
output reg rvx_port_10;

input wire rvx_port_04;

output wire [16-1:0] rvx_port_12;

output wire [(32)*(8)-1:0] rvx_port_03;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_09;
reg [RVX_GPARA_0-1:0] rvx_signal_32;
wire rvx_signal_41;
wire rvx_signal_48;
wire rvx_signal_01;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_00;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_05;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_54;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_16;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_25;
wire rvx_signal_18;
reg [32-1:0] rvx_signal_58;
reg rvx_signal_51;
wire [32-1:0] rvx_signal_11;
reg rvx_signal_28;
wire [32-1:0] rvx_signal_38;
wire rvx_signal_46;
reg [32-1:0] rvx_signal_62;
reg rvx_signal_43;
wire [32-1:0] rvx_signal_47;
reg rvx_signal_35;
wire [32-1:0] rvx_signal_07;
wire rvx_signal_57;
reg [32-1:0] rvx_signal_33;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_60;
reg rvx_signal_63;
wire [32-1:0] rvx_signal_10;
wire rvx_signal_13;
reg [32-1:0] rvx_signal_61;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_49;
reg rvx_signal_24;
wire [32-1:0] rvx_signal_29;
wire rvx_signal_08;
reg [32-1:0] rvx_signal_23;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_42;
wire [32-1:0] rvx_signal_36;
wire rvx_signal_53;
reg [32-1:0] rvx_signal_59;
reg rvx_signal_06;
wire [32-1:0] rvx_signal_34;
reg rvx_signal_50;
wire [32-1:0] rvx_signal_52;
wire rvx_signal_40;
reg [32-1:0] rvx_signal_30;
reg rvx_signal_45;
wire [32-1:0] rvx_signal_14;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_15;
wire rvx_signal_03;
reg [32-1:0] rvx_signal_39;
reg rvx_signal_26;
wire [16-1:0] rvx_signal_20;
reg rvx_signal_27;
wire [16-1:0] rvx_signal_02;
wire rvx_signal_44;
reg [16-1:0] rvx_signal_12;

assign rvx_signal_09 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_06);
assign rvx_port_05 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_32);
assign {rvx_signal_05,rvx_signal_54} = paddr_offset;
assign rvx_signal_00 = {rvx_signal_05,addr_unused};
assign rvx_signal_01 = (rvx_signal_54==0);
assign rvx_signal_41 = rvx_port_07 & rvx_port_02 & rvx_signal_01 & (~rvx_port_08);
assign rvx_signal_48 = rvx_port_07 & rvx_port_02 & rvx_signal_01 & rvx_port_08;

assign rvx_signal_25 = $unsigned(rvx_port_06);
assign rvx_signal_38 = $unsigned(rvx_port_06);
assign rvx_signal_07 = $unsigned(rvx_port_06);
assign rvx_signal_10 = $unsigned(rvx_port_06);
assign rvx_signal_29 = $unsigned(rvx_port_06);
assign rvx_signal_36 = $unsigned(rvx_port_06);
assign rvx_signal_52 = $unsigned(rvx_port_06);
assign rvx_signal_15 = $unsigned(rvx_port_06);
assign rvx_signal_02 = $unsigned(rvx_port_06);

always@(*)
begin
	rvx_port_10 = 0;
	rvx_signal_32 = 0;
	rvx_port_09 = 1;

	rvx_signal_31 = 0;
	rvx_signal_04 = 0;

	rvx_signal_51 = 0;
	rvx_signal_28 = 0;

	rvx_signal_43 = 0;
	rvx_signal_35 = 0;

	rvx_signal_17 = 0;
	rvx_signal_63 = 0;

	rvx_signal_19 = 0;
	rvx_signal_24 = 0;

	rvx_signal_37 = 0;
	rvx_signal_42 = 0;

	rvx_signal_06 = 0;
	rvx_signal_50 = 0;

	rvx_signal_45 = 0;
	rvx_signal_56 = 0;

	rvx_signal_26 = 0;
	rvx_signal_27 = 0;

	if(rvx_port_07==1'b 1)
	begin
		case(rvx_signal_00)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_31 = rvx_signal_41;
				rvx_signal_04 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_16);
				rvx_port_09 = rvx_signal_18;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_51 = rvx_signal_41;
				rvx_signal_28 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_11);
				rvx_port_09 = rvx_signal_46;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_43 = rvx_signal_41;
				rvx_signal_35 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_47);
				rvx_port_09 = rvx_signal_57;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_17 = rvx_signal_41;
				rvx_signal_63 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_60);
				rvx_port_09 = rvx_signal_13;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_19 = rvx_signal_41;
				rvx_signal_24 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_49);
				rvx_port_09 = rvx_signal_08;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_37 = rvx_signal_41;
				rvx_signal_42 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_55);
				rvx_port_09 = rvx_signal_53;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_06 = rvx_signal_41;
				rvx_signal_50 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_34);
				rvx_port_09 = rvx_signal_40;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_45 = rvx_signal_41;
				rvx_signal_56 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_14);
				rvx_port_09 = rvx_signal_03;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_26 = rvx_signal_41;
				rvx_signal_27 = rvx_signal_48;
				rvx_signal_32 = $unsigned(rvx_signal_20);
				rvx_port_09 = rvx_signal_44;
			end
			default:
				rvx_port_10 = 1;
		endcase
	end
end

always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_58 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_58 <= rvx_signal_25;
end
assign rvx_signal_16 = rvx_signal_58;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_62 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_28==1'b 1)
		rvx_signal_62 <= rvx_signal_38;
end
assign rvx_signal_11 = rvx_signal_62;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_33 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_35==1'b 1)
		rvx_signal_33 <= rvx_signal_07;
end
assign rvx_signal_47 = rvx_signal_33;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_61 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_63==1'b 1)
		rvx_signal_61 <= rvx_signal_10;
end
assign rvx_signal_60 = rvx_signal_61;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_23 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_24==1'b 1)
		rvx_signal_23 <= rvx_signal_29;
end
assign rvx_signal_49 = rvx_signal_23;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_59 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_42==1'b 1)
		rvx_signal_59 <= rvx_signal_36;
end
assign rvx_signal_55 = rvx_signal_59;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_30 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_50==1'b 1)
		rvx_signal_30 <= rvx_signal_52;
end
assign rvx_signal_34 = rvx_signal_30;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_39 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_56==1'b 1)
		rvx_signal_39 <= rvx_signal_15;
end
assign rvx_signal_14 = rvx_signal_39;
always@(posedge rvx_port_01, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_12 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_27==1'b 1)
		rvx_signal_12 <= rvx_signal_02;
end
assign rvx_signal_20 = rvx_signal_12;
assign rvx_port_12 = rvx_signal_12;
assign rvx_signal_44 = 1;

assign rvx_port_03[(32)*((00)+1)-1-:32] = rvx_signal_58;

assign rvx_port_03[(32)*((01)+1)-1-:32] = rvx_signal_62;

assign rvx_port_03[(32)*((02)+1)-1-:32] = rvx_signal_33;

assign rvx_port_03[(32)*((03)+1)-1-:32] = rvx_signal_61;

assign rvx_port_03[(32)*((04)+1)-1-:32] = rvx_signal_23;

assign rvx_port_03[(32)*((05)+1)-1-:32] = rvx_signal_59;

assign rvx_port_03[(32)*((06)+1)-1-:32] = rvx_signal_30;

assign rvx_port_03[(32)*((07)+1)-1-:32] = rvx_signal_39;

assign rvx_signal_18 = 1;

assign rvx_signal_46 = 1;

assign rvx_signal_57 = 1;

assign rvx_signal_13 = 1;

assign rvx_signal_08 = 1;

assign rvx_signal_53 = 1;

assign rvx_signal_40 = 1;

assign rvx_signal_03 = 1;

endmodule
