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




module RVX_MODULE_112
(
	rvx_port_10,
	rvx_port_06,

	rvx_port_02,
	rvx_port_00,
	rvx_port_11,
	rvx_port_09,
	rvx_port_07,
	rvx_port_12,
	rvx_port_01,
	rvx_port_05,

	rvx_port_04,
	rvx_port_08,
	rvx_port_03
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_10, rvx_port_06;
input wire rvx_port_02;
input wire rvx_port_00;
input wire [RVX_GPARA_2-1:0] rvx_port_11;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_12;
output reg rvx_port_01;
output reg rvx_port_05;

input wire rvx_port_04;

output wire [16-1:0] rvx_port_08;

output wire [(32)*(8)-1:0] rvx_port_03;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_52;
reg [RVX_GPARA_0-1:0] rvx_signal_26;
wire rvx_signal_42;
wire rvx_signal_08;
wire rvx_signal_12;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_11;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_47;
wire [RVX_GPARA_2-1:0] rvx_signal_46;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_33;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_32;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_41;
wire rvx_signal_35;
reg [32-1:0] rvx_signal_00;
reg rvx_signal_57;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_44;
wire [32-1:0] rvx_signal_58;
wire rvx_signal_54;
reg [32-1:0] rvx_signal_02;
reg rvx_signal_45;
wire [32-1:0] rvx_signal_13;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_04;
reg [32-1:0] rvx_signal_36;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_06;
reg rvx_signal_28;
wire [32-1:0] rvx_signal_14;
wire rvx_signal_40;
reg [32-1:0] rvx_signal_63;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_48;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_49;
reg [32-1:0] rvx_signal_30;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_07;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_01;
wire rvx_signal_16;
reg [32-1:0] rvx_signal_25;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_50;
reg rvx_signal_53;
wire [32-1:0] rvx_signal_62;
wire rvx_signal_55;
reg [32-1:0] rvx_signal_34;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_37;
reg rvx_signal_59;
wire [32-1:0] rvx_signal_10;
wire rvx_signal_39;
reg [32-1:0] rvx_signal_11;
reg rvx_signal_60;
wire [16-1:0] rvx_signal_17;
reg rvx_signal_15;
wire [16-1:0] rvx_signal_51;
wire rvx_signal_61;
reg [16-1:0] rvx_signal_43;

assign rvx_signal_52 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_07);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_26);
assign {rvx_signal_46,rvx_signal_33} = paddr_offset;
assign rvx_signal_47 = {rvx_signal_46,addr_unused};
assign rvx_signal_12 = (rvx_signal_33==0);
assign rvx_signal_42 = rvx_port_02 & rvx_port_00 & rvx_signal_12 & (~rvx_port_09);
assign rvx_signal_08 = rvx_port_02 & rvx_port_00 & rvx_signal_12 & rvx_port_09;

assign rvx_signal_41 = $unsigned(rvx_port_07);
assign rvx_signal_58 = $unsigned(rvx_port_07);
assign rvx_signal_24 = $unsigned(rvx_port_07);
assign rvx_signal_14 = $unsigned(rvx_port_07);
assign rvx_signal_27 = $unsigned(rvx_port_07);
assign rvx_signal_01 = $unsigned(rvx_port_07);
assign rvx_signal_62 = $unsigned(rvx_port_07);
assign rvx_signal_10 = $unsigned(rvx_port_07);
assign rvx_signal_51 = $unsigned(rvx_port_07);

always@(*)
begin
	rvx_port_05 = 0;
	rvx_signal_26 = 0;
	rvx_port_01 = 1;

	rvx_signal_19 = 0;
	rvx_signal_03 = 0;

	rvx_signal_57 = 0;
	rvx_signal_44 = 0;

	rvx_signal_45 = 0;
	rvx_signal_29 = 0;

	rvx_signal_38 = 0;
	rvx_signal_28 = 0;

	rvx_signal_22 = 0;
	rvx_signal_56 = 0;

	rvx_signal_05 = 0;
	rvx_signal_20 = 0;

	rvx_signal_21 = 0;
	rvx_signal_53 = 0;

	rvx_signal_09 = 0;
	rvx_signal_59 = 0;

	rvx_signal_60 = 0;
	rvx_signal_15 = 0;

	if(rvx_port_02==1'b 1)
	begin
		case(rvx_signal_47)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_19 = rvx_signal_42;
				rvx_signal_03 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_32);
				rvx_port_01 = rvx_signal_35;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_57 = rvx_signal_42;
				rvx_signal_44 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_18);
				rvx_port_01 = rvx_signal_54;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_45 = rvx_signal_42;
				rvx_signal_29 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_13);
				rvx_port_01 = rvx_signal_04;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_38 = rvx_signal_42;
				rvx_signal_28 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_06);
				rvx_port_01 = rvx_signal_40;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_22 = rvx_signal_42;
				rvx_signal_56 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_48);
				rvx_port_01 = rvx_signal_49;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_05 = rvx_signal_42;
				rvx_signal_20 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_07);
				rvx_port_01 = rvx_signal_16;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_21 = rvx_signal_42;
				rvx_signal_53 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_50);
				rvx_port_01 = rvx_signal_55;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_09 = rvx_signal_42;
				rvx_signal_59 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_37);
				rvx_port_01 = rvx_signal_39;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_60 = rvx_signal_42;
				rvx_signal_15 = rvx_signal_08;
				rvx_signal_26 = $unsigned(rvx_signal_17);
				rvx_port_01 = rvx_signal_61;
			end
			default:
				rvx_port_05 = 1;
		endcase
	end
end

always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_00 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_00 <= rvx_signal_41;
end
assign rvx_signal_32 = rvx_signal_00;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_02 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_44==1'b 1)
		rvx_signal_02 <= rvx_signal_58;
end
assign rvx_signal_18 = rvx_signal_02;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_36 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_29==1'b 1)
		rvx_signal_36 <= rvx_signal_24;
end
assign rvx_signal_13 = rvx_signal_36;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_63 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_28==1'b 1)
		rvx_signal_63 <= rvx_signal_14;
end
assign rvx_signal_06 = rvx_signal_63;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_30 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_56==1'b 1)
		rvx_signal_30 <= rvx_signal_27;
end
assign rvx_signal_48 = rvx_signal_30;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_25 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_20==1'b 1)
		rvx_signal_25 <= rvx_signal_01;
end
assign rvx_signal_07 = rvx_signal_25;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_34 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_53==1'b 1)
		rvx_signal_34 <= rvx_signal_62;
end
assign rvx_signal_50 = rvx_signal_34;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_11 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_59==1'b 1)
		rvx_signal_11 <= rvx_signal_10;
end
assign rvx_signal_37 = rvx_signal_11;
always@(posedge rvx_port_10, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_43 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_15==1'b 1)
		rvx_signal_43 <= rvx_signal_51;
end
assign rvx_signal_17 = rvx_signal_43;
assign rvx_port_08 = rvx_signal_43;
assign rvx_signal_61 = 1;

assign rvx_port_03[(32)*((00)+1)-1-:32] = rvx_signal_00;

assign rvx_port_03[(32)*((01)+1)-1-:32] = rvx_signal_02;

assign rvx_port_03[(32)*((02)+1)-1-:32] = rvx_signal_36;

assign rvx_port_03[(32)*((03)+1)-1-:32] = rvx_signal_63;

assign rvx_port_03[(32)*((04)+1)-1-:32] = rvx_signal_30;

assign rvx_port_03[(32)*((05)+1)-1-:32] = rvx_signal_25;

assign rvx_port_03[(32)*((06)+1)-1-:32] = rvx_signal_34;

assign rvx_port_03[(32)*((07)+1)-1-:32] = rvx_signal_11;

assign rvx_signal_35 = 1;

assign rvx_signal_54 = 1;

assign rvx_signal_04 = 1;

assign rvx_signal_40 = 1;

assign rvx_signal_49 = 1;

assign rvx_signal_16 = 1;

assign rvx_signal_55 = 1;

assign rvx_signal_39 = 1;

endmodule
