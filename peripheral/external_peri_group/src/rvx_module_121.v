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




module RVX_MODULE_121
(
	rvx_port_05,
	rvx_port_07,

	rvx_port_11,
	rvx_port_00,
	rvx_port_04,
	rvx_port_10,
	rvx_port_03,
	rvx_port_02,
	rvx_port_01,
	rvx_port_12,

	rvx_port_09,
	rvx_port_06,
	rvx_port_08
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_05, rvx_port_07;
input wire rvx_port_11;
input wire rvx_port_00;
input wire [RVX_GPARA_1-1:0] rvx_port_04;
input wire rvx_port_10;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire [RVX_GPARA_2-1:0] rvx_port_02;
output reg rvx_port_01;
output reg rvx_port_12;

input wire rvx_port_09;

output wire [16-1:0] rvx_port_06;

output wire [(32)*(8)-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_21;
reg [RVX_GPARA_2-1:0] rvx_signal_24;
wire rvx_signal_25;
wire rvx_signal_26;
wire rvx_signal_31;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_04;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_09;
wire [RVX_GPARA_1-1:0] rvx_signal_15;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_39;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_53;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_18;
reg [32-1:0] rvx_signal_51;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_47;
reg rvx_signal_55;
wire [32-1:0] rvx_signal_46;
wire rvx_signal_14;
reg [32-1:0] rvx_signal_44;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_61;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_52;
wire rvx_signal_56;
reg [32-1:0] rvx_signal_45;
reg rvx_signal_40;
wire [32-1:0] rvx_signal_17;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_42;
wire rvx_signal_63;
reg [32-1:0] rvx_signal_04;
reg rvx_signal_58;
wire [32-1:0] rvx_signal_23;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_35;
wire rvx_signal_43;
reg [32-1:0] rvx_signal_16;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_06;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_49;
wire rvx_signal_01;
reg [32-1:0] rvx_signal_37;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_32;
reg [32-1:0] rvx_signal_27;
reg rvx_signal_60;
wire [32-1:0] rvx_signal_36;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_59;
wire rvx_signal_20;
reg [32-1:0] rvx_signal_62;
reg rvx_signal_33;
wire [16-1:0] rvx_signal_54;
reg rvx_signal_57;
wire [16-1:0] rvx_signal_12;
wire rvx_signal_05;
reg [16-1:0] rvx_signal_29;

assign rvx_signal_21 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_03);
assign rvx_port_02 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_24);
assign {rvx_signal_15,rvx_signal_39} = paddr_offset;
assign rvx_signal_09 = {rvx_signal_15,addr_unused};
assign rvx_signal_31 = (rvx_signal_39==0);
assign rvx_signal_25 = rvx_port_11 & rvx_port_00 & rvx_signal_31 & (~rvx_port_10);
assign rvx_signal_26 = rvx_port_11 & rvx_port_00 & rvx_signal_31 & rvx_port_10;

assign rvx_signal_28 = $unsigned(rvx_port_03);
assign rvx_signal_46 = $unsigned(rvx_port_03);
assign rvx_signal_52 = $unsigned(rvx_port_03);
assign rvx_signal_42 = $unsigned(rvx_port_03);
assign rvx_signal_35 = $unsigned(rvx_port_03);
assign rvx_signal_49 = $unsigned(rvx_port_03);
assign rvx_signal_08 = $unsigned(rvx_port_03);
assign rvx_signal_59 = $unsigned(rvx_port_03);
assign rvx_signal_12 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_24 = 0;
	rvx_port_01 = 1;

	rvx_signal_30 = 0;
	rvx_signal_11 = 0;

	rvx_signal_13 = 0;
	rvx_signal_55 = 0;

	rvx_signal_07 = 0;
	rvx_signal_02 = 0;

	rvx_signal_40 = 0;
	rvx_signal_19 = 0;

	rvx_signal_58 = 0;
	rvx_signal_34 = 0;

	rvx_signal_22 = 0;
	rvx_signal_10 = 0;

	rvx_signal_03 = 0;
	rvx_signal_38 = 0;

	rvx_signal_60 = 0;
	rvx_signal_41 = 0;

	rvx_signal_33 = 0;
	rvx_signal_57 = 0;

	if(rvx_port_11==1'b 1)
	begin
		case(rvx_signal_09)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_30 = rvx_signal_25;
				rvx_signal_11 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_53);
				rvx_port_01 = rvx_signal_18;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_13 = rvx_signal_25;
				rvx_signal_55 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_47);
				rvx_port_01 = rvx_signal_14;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_07 = rvx_signal_25;
				rvx_signal_02 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_61);
				rvx_port_01 = rvx_signal_56;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_40 = rvx_signal_25;
				rvx_signal_19 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_17);
				rvx_port_01 = rvx_signal_63;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_58 = rvx_signal_25;
				rvx_signal_34 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_23);
				rvx_port_01 = rvx_signal_43;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_22 = rvx_signal_25;
				rvx_signal_10 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_06);
				rvx_port_01 = rvx_signal_01;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_03 = rvx_signal_25;
				rvx_signal_38 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_00);
				rvx_port_01 = rvx_signal_32;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_60 = rvx_signal_25;
				rvx_signal_41 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_36);
				rvx_port_01 = rvx_signal_20;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_33 = rvx_signal_25;
				rvx_signal_57 = rvx_signal_26;
				rvx_signal_24 = $unsigned(rvx_signal_54);
				rvx_port_01 = rvx_signal_05;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_51 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_11==1'b 1)
		rvx_signal_51 <= rvx_signal_28;
end
assign rvx_signal_53 = rvx_signal_51;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_44 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_55==1'b 1)
		rvx_signal_44 <= rvx_signal_46;
end
assign rvx_signal_47 = rvx_signal_44;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_45 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_02==1'b 1)
		rvx_signal_45 <= rvx_signal_52;
end
assign rvx_signal_61 = rvx_signal_45;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_04 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_19==1'b 1)
		rvx_signal_04 <= rvx_signal_42;
end
assign rvx_signal_17 = rvx_signal_04;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_16 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_34==1'b 1)
		rvx_signal_16 <= rvx_signal_35;
end
assign rvx_signal_23 = rvx_signal_16;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_37 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_10==1'b 1)
		rvx_signal_37 <= rvx_signal_49;
end
assign rvx_signal_06 = rvx_signal_37;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_27 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_38==1'b 1)
		rvx_signal_27 <= rvx_signal_08;
end
assign rvx_signal_00 = rvx_signal_27;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_62 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_41==1'b 1)
		rvx_signal_62 <= rvx_signal_59;
end
assign rvx_signal_36 = rvx_signal_62;
always@(posedge rvx_port_05, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_29 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_57==1'b 1)
		rvx_signal_29 <= rvx_signal_12;
end
assign rvx_signal_54 = rvx_signal_29;
assign rvx_port_06 = rvx_signal_29;
assign rvx_signal_05 = 1;

assign rvx_port_08[(32)*((00)+1)-1-:32] = rvx_signal_51;

assign rvx_port_08[(32)*((01)+1)-1-:32] = rvx_signal_44;

assign rvx_port_08[(32)*((02)+1)-1-:32] = rvx_signal_45;

assign rvx_port_08[(32)*((03)+1)-1-:32] = rvx_signal_04;

assign rvx_port_08[(32)*((04)+1)-1-:32] = rvx_signal_16;

assign rvx_port_08[(32)*((05)+1)-1-:32] = rvx_signal_37;

assign rvx_port_08[(32)*((06)+1)-1-:32] = rvx_signal_27;

assign rvx_port_08[(32)*((07)+1)-1-:32] = rvx_signal_62;

assign rvx_signal_18 = 1;

assign rvx_signal_14 = 1;

assign rvx_signal_56 = 1;

assign rvx_signal_63 = 1;

assign rvx_signal_43 = 1;

assign rvx_signal_01 = 1;

assign rvx_signal_32 = 1;

assign rvx_signal_20 = 1;

endmodule
