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




module RVX_MODULE_014
(
	rvx_port_01,
	rvx_port_07,

	rvx_port_04,
	rvx_port_11,
	rvx_port_00,
	rvx_port_06,
	rvx_port_03,
	rvx_port_10,
	rvx_port_08,
	rvx_port_12,

	rvx_port_02,
	rvx_port_09,
	rvx_port_05
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_01, rvx_port_07;
input wire rvx_port_04;
input wire rvx_port_11;
input wire [RVX_GPARA_2-1:0] rvx_port_00;
input wire rvx_port_06;
input wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire [RVX_GPARA_1-1:0] rvx_port_10;
output reg rvx_port_08;
output reg rvx_port_12;

input wire rvx_port_02;

output wire [`BW_EPG_MISC_GPIO_TICK_CFG-1:0] rvx_port_09;

output wire [(`BW_EPG_MISC_EXTREG)*(`NUM_EPG_MISC_EXTREG)-1:0] rvx_port_05;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_20;
reg [RVX_GPARA_1-1:0] rvx_signal_43;
wire rvx_signal_54;
wire rvx_signal_63;
wire rvx_signal_35;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_00;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_14;
wire [RVX_GPARA_2-1:0] rvx_signal_52;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_58;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_02;
wire [RVX_GPARA_1-1:0] rvx_signal_19;
reg rvx_signal_33;
wire [RVX_GPARA_1-1:0] rvx_signal_15;
wire rvx_signal_36;
reg [32-1:0] rvx_signal_53;
reg rvx_signal_34;
wire [RVX_GPARA_1-1:0] rvx_signal_56;
reg rvx_signal_46;
wire [RVX_GPARA_1-1:0] rvx_signal_30;
wire rvx_signal_57;
reg [32-1:0] rvx_signal_22;
reg rvx_signal_62;
wire [RVX_GPARA_1-1:0] rvx_signal_59;
reg rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_09;
wire rvx_signal_01;
reg [32-1:0] rvx_signal_44;
reg rvx_signal_47;
wire [RVX_GPARA_1-1:0] rvx_signal_39;
reg rvx_signal_11;
wire [RVX_GPARA_1-1:0] rvx_signal_50;
wire rvx_signal_61;
reg [32-1:0] rvx_signal_16;
reg rvx_signal_12;
wire [RVX_GPARA_1-1:0] rvx_signal_41;
reg rvx_signal_18;
wire [RVX_GPARA_1-1:0] rvx_signal_10;
wire rvx_signal_08;
reg [32-1:0] rvx_signal_06;
reg rvx_signal_49;
wire [RVX_GPARA_1-1:0] rvx_signal_17;
reg rvx_signal_03;
wire [RVX_GPARA_1-1:0] rvx_signal_04;
wire rvx_signal_45;
reg [32-1:0] rvx_signal_51;
reg rvx_signal_07;
wire [RVX_GPARA_1-1:0] rvx_signal_60;
reg rvx_signal_29;
wire [RVX_GPARA_1-1:0] rvx_signal_40;
wire rvx_signal_37;
reg [32-1:0] rvx_signal_27;
reg rvx_signal_42;
wire [RVX_GPARA_1-1:0] rvx_signal_05;
reg rvx_signal_38;
wire [RVX_GPARA_1-1:0] rvx_signal_24;
wire rvx_signal_26;
reg [32-1:0] rvx_signal_13;
reg rvx_signal_23;
wire [RVX_GPARA_1-1:0] rvx_signal_31;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_25;
wire rvx_signal_00;
reg [16-1:0] rvx_signal_48;

assign rvx_signal_20 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_03);
assign rvx_port_10 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_43);
assign {rvx_signal_52,rvx_signal_58} = paddr_offset;
assign rvx_signal_14 = {rvx_signal_52,addr_unused};
assign rvx_signal_35 = (rvx_signal_58==0);
assign rvx_signal_54 = rvx_port_04 & rvx_port_11 & rvx_signal_35 & (~rvx_port_06);
assign rvx_signal_63 = rvx_port_04 & rvx_port_11 & rvx_signal_35 & rvx_port_06;

assign rvx_signal_15 = $unsigned(rvx_port_03);
assign rvx_signal_30 = $unsigned(rvx_port_03);
assign rvx_signal_09 = $unsigned(rvx_port_03);
assign rvx_signal_50 = $unsigned(rvx_port_03);
assign rvx_signal_10 = $unsigned(rvx_port_03);
assign rvx_signal_04 = $unsigned(rvx_port_03);
assign rvx_signal_40 = $unsigned(rvx_port_03);
assign rvx_signal_24 = $unsigned(rvx_port_03);
assign rvx_signal_25 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_43 = 0;
	rvx_port_08 = 1;

	rvx_signal_02 = 0;
	rvx_signal_33 = 0;

	rvx_signal_34 = 0;
	rvx_signal_46 = 0;

	rvx_signal_62 = 0;
	rvx_signal_21 = 0;

	rvx_signal_47 = 0;
	rvx_signal_11 = 0;

	rvx_signal_12 = 0;
	rvx_signal_18 = 0;

	rvx_signal_49 = 0;
	rvx_signal_03 = 0;

	rvx_signal_07 = 0;
	rvx_signal_29 = 0;

	rvx_signal_42 = 0;
	rvx_signal_38 = 0;

	rvx_signal_23 = 0;
	rvx_signal_28 = 0;

	if(rvx_port_04==1'b 1)
	begin
		case(rvx_signal_14)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_02 = rvx_signal_54;
				rvx_signal_33 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_19);
				rvx_port_08 = rvx_signal_36;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_34 = rvx_signal_54;
				rvx_signal_46 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_56);
				rvx_port_08 = rvx_signal_57;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_62 = rvx_signal_54;
				rvx_signal_21 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_59);
				rvx_port_08 = rvx_signal_01;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_47 = rvx_signal_54;
				rvx_signal_11 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_39);
				rvx_port_08 = rvx_signal_61;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_12 = rvx_signal_54;
				rvx_signal_18 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_41);
				rvx_port_08 = rvx_signal_08;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_49 = rvx_signal_54;
				rvx_signal_03 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_17);
				rvx_port_08 = rvx_signal_45;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_07 = rvx_signal_54;
				rvx_signal_29 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_60);
				rvx_port_08 = rvx_signal_37;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_42 = rvx_signal_54;
				rvx_signal_38 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_05);
				rvx_port_08 = rvx_signal_26;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_23 = rvx_signal_54;
				rvx_signal_28 = rvx_signal_63;
				rvx_signal_43 = $unsigned(rvx_signal_31);
				rvx_port_08 = rvx_signal_00;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_53 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_33==1'b 1)
		rvx_signal_53 <= rvx_signal_15;
end
assign rvx_signal_19 = rvx_signal_53;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_22 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_46==1'b 1)
		rvx_signal_22 <= rvx_signal_30;
end
assign rvx_signal_56 = rvx_signal_22;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_44 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_21==1'b 1)
		rvx_signal_44 <= rvx_signal_09;
end
assign rvx_signal_59 = rvx_signal_44;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_16 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_11==1'b 1)
		rvx_signal_16 <= rvx_signal_50;
end
assign rvx_signal_39 = rvx_signal_16;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_06 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_18==1'b 1)
		rvx_signal_06 <= rvx_signal_10;
end
assign rvx_signal_41 = rvx_signal_06;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_51 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_51 <= rvx_signal_04;
end
assign rvx_signal_17 = rvx_signal_51;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_27 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_29==1'b 1)
		rvx_signal_27 <= rvx_signal_40;
end
assign rvx_signal_60 = rvx_signal_27;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_13 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_38==1'b 1)
		rvx_signal_13 <= rvx_signal_24;
end
assign rvx_signal_05 = rvx_signal_13;
always@(posedge rvx_port_01, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_48 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_28==1'b 1)
		rvx_signal_48 <= rvx_signal_25;
end
assign rvx_signal_31 = rvx_signal_48;
assign rvx_port_09 = rvx_signal_48;
assign rvx_signal_00 = 1;

assign rvx_port_05[(32)*((00)+1)-1-:32] = rvx_signal_53;

assign rvx_port_05[(32)*((01)+1)-1-:32] = rvx_signal_22;

assign rvx_port_05[(32)*((02)+1)-1-:32] = rvx_signal_44;

assign rvx_port_05[(32)*((03)+1)-1-:32] = rvx_signal_16;

assign rvx_port_05[(32)*((04)+1)-1-:32] = rvx_signal_06;

assign rvx_port_05[(32)*((05)+1)-1-:32] = rvx_signal_51;

assign rvx_port_05[(32)*((06)+1)-1-:32] = rvx_signal_27;

assign rvx_port_05[(32)*((07)+1)-1-:32] = rvx_signal_13;

assign rvx_signal_36 = 1;

assign rvx_signal_57 = 1;

assign rvx_signal_01 = 1;

assign rvx_signal_61 = 1;

assign rvx_signal_08 = 1;

assign rvx_signal_45 = 1;

assign rvx_signal_37 = 1;

assign rvx_signal_26 = 1;

endmodule
