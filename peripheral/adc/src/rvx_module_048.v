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
`include "rvx_include_04.vh"




module RVX_MODULE_048
(
	rvx_port_16,
	rvx_port_06,

	rvx_port_14,
	rvx_port_02,
	rvx_port_12,
	rvx_port_01,
	rvx_port_15,
	rvx_port_17,
	rvx_port_08,
	rvx_port_00,

	rvx_port_18,
	rvx_port_19,
	rvx_port_04,
	rvx_port_11,
	rvx_port_20,
	rvx_port_05,
	rvx_port_09,
	rvx_port_03,
	rvx_port_13,
	rvx_port_10,
	rvx_port_07
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_16, rvx_port_06;
input wire rvx_port_14;
input wire rvx_port_02;
input wire [RVX_GPARA_2-1:0] rvx_port_12;
input wire rvx_port_01;
input wire [RVX_GPARA_0-1:0] rvx_port_15;
output wire [RVX_GPARA_0-1:0] rvx_port_17;
output reg rvx_port_08;
output reg rvx_port_00;

input wire rvx_port_18;

output wire rvx_port_19;
input wire [32-1:0] rvx_port_04;
output wire rvx_port_11;
output wire [32-1:0] rvx_port_20;

output wire [32-1:0] rvx_port_05;

output wire [32-1:0] rvx_port_09;

output wire rvx_port_03;
input wire [32-1:0] rvx_port_13;

output wire rvx_port_10;
input wire [32-1:0] rvx_port_07;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_13;
reg [RVX_GPARA_0-1:0] rvx_signal_07;
wire rvx_signal_01;
wire rvx_signal_23;
wire rvx_signal_24;

wire [`RVX_GDEF_480-1:0] paddr_offset = rvx_port_12;
wire [`RVX_GDEF_480-1:0] rvx_signal_04;
wire [RVX_GPARA_2-1:0] rvx_signal_00;
wire [`RVX_GDEF_369-1:0] rvx_signal_21;
wire [`RVX_GDEF_369-1:0] addr_unused = 0;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_15;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_36;
reg rvx_signal_27;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_19;
wire rvx_signal_02;
reg [32-1:0] rvx_signal_32;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_08;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_34;
wire rvx_signal_14;
reg [32-1:0] rvx_signal_30;
reg rvx_signal_12;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_10;
wire rvx_signal_09;
reg rvx_signal_26;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_28;
wire [32-1:0] rvx_signal_33;
wire rvx_signal_31;

assign rvx_signal_13 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_15);
assign rvx_port_17 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_07);
assign {rvx_signal_00,rvx_signal_21} = paddr_offset;
assign rvx_signal_04 = {rvx_signal_00,addr_unused};
assign rvx_signal_24 = (rvx_signal_21==0);
assign rvx_signal_01 = rvx_port_14 & rvx_port_02 & rvx_signal_24 & (~rvx_port_01);
assign rvx_signal_23 = rvx_port_14 & rvx_port_02 & rvx_signal_24 & rvx_port_01;

assign rvx_signal_05 = $unsigned(rvx_port_15);
assign rvx_signal_19 = $unsigned(rvx_port_15);
assign rvx_signal_34 = $unsigned(rvx_port_15);
assign rvx_signal_10 = $unsigned(rvx_port_15);
assign rvx_signal_33 = $unsigned(rvx_port_15);

always@(*)
begin
	rvx_port_00 = 0;
	rvx_signal_07 = 0;
	rvx_port_08 = 1;

	rvx_signal_16 = 0;
	rvx_signal_20 = 0;

	rvx_signal_27 = 0;
	rvx_signal_11 = 0;

	rvx_signal_22 = 0;
	rvx_signal_17 = 0;

	rvx_signal_12 = 0;
	rvx_signal_03 = 0;

	rvx_signal_26 = 0;
	rvx_signal_28 = 0;

	if(rvx_port_14==1'b 1)
	begin
		case(rvx_signal_04)
			`RVX_GDEF_455:
			begin
				rvx_signal_16 = rvx_signal_01;
				rvx_signal_20 = rvx_signal_23;
				rvx_signal_07 = $unsigned(rvx_signal_15);
				rvx_port_08 = rvx_signal_36;
			end
			`RVX_GDEF_186:
			begin
				rvx_signal_27 = rvx_signal_01;
				rvx_signal_11 = rvx_signal_23;
				rvx_signal_07 = $unsigned(rvx_signal_18);
				rvx_port_08 = rvx_signal_02;
			end
			`RVX_GDEF_158:
			begin
				rvx_signal_22 = rvx_signal_01;
				rvx_signal_17 = rvx_signal_23;
				rvx_signal_07 = $unsigned(rvx_signal_08);
				rvx_port_08 = rvx_signal_14;
			end
			`RVX_GDEF_328:
			begin
				rvx_signal_12 = rvx_signal_01;
				rvx_signal_03 = rvx_signal_23;
				rvx_signal_07 = $unsigned(rvx_signal_25);
				rvx_port_08 = rvx_signal_09;
			end
			`RVX_GDEF_196:
			begin
				rvx_signal_26 = rvx_signal_01;
				rvx_signal_28 = rvx_signal_23;
				rvx_signal_07 = $unsigned(rvx_signal_29);
				rvx_port_08 = rvx_signal_31;
			end
			default:
				rvx_port_00 = 1;
		endcase
	end
end

always@(posedge rvx_port_16, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_32 <= `RVX_GDEF_371;
	else if (rvx_signal_11==1'b 1)
		rvx_signal_32 <= rvx_signal_19;
end
assign rvx_signal_18 = rvx_signal_32;
always@(posedge rvx_port_16, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_30 <= `RVX_GDEF_554;
	else if (rvx_signal_17==1'b 1)
		rvx_signal_30 <= rvx_signal_34;
end
assign rvx_signal_08 = rvx_signal_30;
assign rvx_port_19 = rvx_signal_16;
assign rvx_signal_15 = rvx_port_04;
assign rvx_port_11 = rvx_signal_20;
assign rvx_port_20 = rvx_signal_05;
assign rvx_signal_36 = 1;
assign rvx_port_05 = rvx_signal_32;
assign rvx_signal_02 = 1;
assign rvx_port_09 = rvx_signal_30;
assign rvx_signal_14 = 1;
assign rvx_port_03 = rvx_signal_12;
assign rvx_signal_25 = rvx_port_13;
assign rvx_signal_09 = 1;
assign rvx_port_10 = rvx_signal_26;
assign rvx_signal_29 = rvx_port_07;
assign rvx_signal_31 = 1;

endmodule
