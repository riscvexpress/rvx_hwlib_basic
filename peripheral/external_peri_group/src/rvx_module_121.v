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




module RVX_MODULE_121
(
	rvx_port_06,
	rvx_port_02,

	rvx_port_12,
	rvx_port_09,
	rvx_port_00,
	rvx_port_10,
	rvx_port_05,
	rvx_port_01,
	rvx_port_11,
	rvx_port_03,

	rvx_port_07,
	rvx_port_04,
	rvx_port_08
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_06, rvx_port_02;
input wire rvx_port_12;
input wire rvx_port_09;
input wire [RVX_GPARA_2-1:0] rvx_port_00;
input wire rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_05;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output reg rvx_port_11;
output reg rvx_port_03;

input wire rvx_port_07;

output wire [16-1:0] rvx_port_04;

output wire [(32)*(8)-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_60;
reg [RVX_GPARA_0-1:0] rvx_signal_20;
wire rvx_signal_03;
wire rvx_signal_48;
wire rvx_signal_36;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_00;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_40;
wire [RVX_GPARA_2-1:0] rvx_signal_38;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_33;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_43;
reg rvx_signal_18;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_06;
reg [32-1:0] rvx_signal_32;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_12;
wire [32-1:0] rvx_signal_51;
wire rvx_signal_24;
reg [32-1:0] rvx_signal_25;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_56;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_04;
wire rvx_signal_05;
reg [32-1:0] rvx_signal_27;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_09;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_16;
reg [32-1:0] rvx_signal_02;
reg rvx_signal_26;
wire [32-1:0] rvx_signal_14;
reg rvx_signal_47;
wire [32-1:0] rvx_signal_59;
wire rvx_signal_00;
reg [32-1:0] rvx_signal_10;
reg rvx_signal_46;
wire [32-1:0] rvx_signal_41;
reg rvx_signal_45;
wire [32-1:0] rvx_signal_39;
wire rvx_signal_44;
reg [32-1:0] rvx_signal_21;
reg rvx_signal_42;
wire [32-1:0] rvx_signal_57;
reg rvx_signal_52;
wire [32-1:0] rvx_signal_07;
wire rvx_signal_61;
reg [32-1:0] rvx_signal_34;
reg rvx_signal_01;
wire [32-1:0] rvx_signal_63;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_54;
wire rvx_signal_35;
reg [32-1:0] rvx_signal_58;
reg rvx_signal_17;
wire [16-1:0] rvx_signal_15;
reg rvx_signal_62;
wire [16-1:0] rvx_signal_23;
wire rvx_signal_13;
reg [16-1:0] rvx_signal_11;

assign rvx_signal_60 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_05);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_20);
assign {rvx_signal_38,rvx_signal_33} = paddr_offset;
assign rvx_signal_40 = {rvx_signal_38,addr_unused};
assign rvx_signal_36 = (rvx_signal_33==0);
assign rvx_signal_03 = rvx_port_12 & rvx_port_09 & rvx_signal_36 & (~rvx_port_10);
assign rvx_signal_48 = rvx_port_12 & rvx_port_09 & rvx_signal_36 & rvx_port_10;

assign rvx_signal_08 = $unsigned(rvx_port_05);
assign rvx_signal_51 = $unsigned(rvx_port_05);
assign rvx_signal_04 = $unsigned(rvx_port_05);
assign rvx_signal_28 = $unsigned(rvx_port_05);
assign rvx_signal_59 = $unsigned(rvx_port_05);
assign rvx_signal_39 = $unsigned(rvx_port_05);
assign rvx_signal_07 = $unsigned(rvx_port_05);
assign rvx_signal_54 = $unsigned(rvx_port_05);
assign rvx_signal_23 = $unsigned(rvx_port_05);

always@(*)
begin
	rvx_port_03 = 0;
	rvx_signal_20 = 0;
	rvx_port_11 = 1;

	rvx_signal_22 = 0;
	rvx_signal_18 = 0;

	rvx_signal_31 = 0;
	rvx_signal_12 = 0;

	rvx_signal_19 = 0;
	rvx_signal_49 = 0;

	rvx_signal_37 = 0;
	rvx_signal_30 = 0;

	rvx_signal_26 = 0;
	rvx_signal_47 = 0;

	rvx_signal_46 = 0;
	rvx_signal_45 = 0;

	rvx_signal_42 = 0;
	rvx_signal_52 = 0;

	rvx_signal_01 = 0;
	rvx_signal_29 = 0;

	rvx_signal_17 = 0;
	rvx_signal_62 = 0;

	if(rvx_port_12==1'b 1)
	begin
		case(rvx_signal_40)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_22 = rvx_signal_03;
				rvx_signal_18 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_43);
				rvx_port_11 = rvx_signal_06;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_31 = rvx_signal_03;
				rvx_signal_12 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_55);
				rvx_port_11 = rvx_signal_24;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_19 = rvx_signal_03;
				rvx_signal_49 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_56);
				rvx_port_11 = rvx_signal_05;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_37 = rvx_signal_03;
				rvx_signal_30 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_09);
				rvx_port_11 = rvx_signal_16;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_26 = rvx_signal_03;
				rvx_signal_47 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_14);
				rvx_port_11 = rvx_signal_00;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_46 = rvx_signal_03;
				rvx_signal_45 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_41);
				rvx_port_11 = rvx_signal_44;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_42 = rvx_signal_03;
				rvx_signal_52 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_57);
				rvx_port_11 = rvx_signal_61;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_01 = rvx_signal_03;
				rvx_signal_29 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_63);
				rvx_port_11 = rvx_signal_35;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_17 = rvx_signal_03;
				rvx_signal_62 = rvx_signal_48;
				rvx_signal_20 = $unsigned(rvx_signal_15);
				rvx_port_11 = rvx_signal_13;
			end
			default:
				rvx_port_03 = 1;
		endcase
	end
end

always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_32 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_18==1'b 1)
		rvx_signal_32 <= rvx_signal_08;
end
assign rvx_signal_43 = rvx_signal_32;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_25 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_12==1'b 1)
		rvx_signal_25 <= rvx_signal_51;
end
assign rvx_signal_55 = rvx_signal_25;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_27 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_49==1'b 1)
		rvx_signal_27 <= rvx_signal_04;
end
assign rvx_signal_56 = rvx_signal_27;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_02 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_30==1'b 1)
		rvx_signal_02 <= rvx_signal_28;
end
assign rvx_signal_09 = rvx_signal_02;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_10 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_47==1'b 1)
		rvx_signal_10 <= rvx_signal_59;
end
assign rvx_signal_14 = rvx_signal_10;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_21 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_45==1'b 1)
		rvx_signal_21 <= rvx_signal_39;
end
assign rvx_signal_41 = rvx_signal_21;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_34 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_52==1'b 1)
		rvx_signal_34 <= rvx_signal_07;
end
assign rvx_signal_57 = rvx_signal_34;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_58 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_29==1'b 1)
		rvx_signal_58 <= rvx_signal_54;
end
assign rvx_signal_63 = rvx_signal_58;
always@(posedge rvx_port_06, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
		rvx_signal_11 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_62==1'b 1)
		rvx_signal_11 <= rvx_signal_23;
end
assign rvx_signal_15 = rvx_signal_11;
assign rvx_port_04 = rvx_signal_11;
assign rvx_signal_13 = 1;

assign rvx_port_08[(32)*((00)+1)-1-:32] = rvx_signal_32;

assign rvx_port_08[(32)*((01)+1)-1-:32] = rvx_signal_25;

assign rvx_port_08[(32)*((02)+1)-1-:32] = rvx_signal_27;

assign rvx_port_08[(32)*((03)+1)-1-:32] = rvx_signal_02;

assign rvx_port_08[(32)*((04)+1)-1-:32] = rvx_signal_10;

assign rvx_port_08[(32)*((05)+1)-1-:32] = rvx_signal_21;

assign rvx_port_08[(32)*((06)+1)-1-:32] = rvx_signal_34;

assign rvx_port_08[(32)*((07)+1)-1-:32] = rvx_signal_58;

assign rvx_signal_06 = 1;

assign rvx_signal_24 = 1;

assign rvx_signal_05 = 1;

assign rvx_signal_16 = 1;

assign rvx_signal_00 = 1;

assign rvx_signal_44 = 1;

assign rvx_signal_61 = 1;

assign rvx_signal_35 = 1;

endmodule
