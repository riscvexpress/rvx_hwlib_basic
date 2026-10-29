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
`include "rvx_include_23.vh"




module RVX_MODULE_092
(
	rvx_port_01,
	rvx_port_10,

	rvx_port_07,
	rvx_port_05,
	rvx_port_17,
	rvx_port_04,
	rvx_port_13,
	rvx_port_18,
	rvx_port_06,
	rvx_port_19,

	rvx_port_08,
	rvx_port_12,
	rvx_port_02,
	rvx_port_16,
	rvx_port_14,
	rvx_port_00,
	rvx_port_03,
	rvx_port_11,
	rvx_port_15,
	rvx_port_09
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_01, rvx_port_10;
input wire rvx_port_07;
input wire rvx_port_05;
input wire [RVX_GPARA_2-1:0] rvx_port_17;
input wire rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire [RVX_GPARA_0-1:0] rvx_port_18;
output reg rvx_port_06;
output reg rvx_port_19;

input wire rvx_port_08;

output wire rvx_port_12;
input wire [`RVX_GDEF_505-1:0] rvx_port_02;

output wire rvx_port_16;
output wire [`RVX_GDEF_239-1:0] rvx_port_14;

output wire rvx_port_00;
input wire [`RVX_GDEF_130-1:0] rvx_port_03;
input wire rvx_port_11;

output wire rvx_port_15;
input wire [`RVX_GDEF_275-1:0] rvx_port_09;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_14;
reg [RVX_GPARA_0-1:0] rvx_signal_20;
wire rvx_signal_00;
wire rvx_signal_19;
wire rvx_signal_08;

wire [`RVX_GDEF_165-1:0] paddr_offset = rvx_port_17;
wire [`RVX_GDEF_165-1:0] rvx_signal_29;
wire [RVX_GPARA_2-1:0] rvx_signal_05;
wire [`RVX_GDEF_019-1:0] rvx_signal_06;
wire [`RVX_GDEF_019-1:0] addr_unused = 0;
reg rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_07;
reg rvx_signal_28;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
wire rvx_signal_22;
reg rvx_signal_17;
wire [RVX_GPARA_0-1:0] rvx_signal_25;
reg rvx_signal_23;
wire [RVX_GPARA_0-1:0] rvx_signal_21;
wire rvx_signal_26;
reg rvx_signal_16;
wire [RVX_GPARA_0-1:0] rvx_signal_04;
reg rvx_signal_13;
wire [RVX_GPARA_0-1:0] rvx_signal_12;
wire rvx_signal_01;
reg rvx_signal_02;
wire [RVX_GPARA_0-1:0] rvx_signal_18;
reg rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_09;
wire rvx_signal_24;

assign rvx_signal_14 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_13);
assign rvx_port_18 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_20);
assign {rvx_signal_05,rvx_signal_06} = paddr_offset;
assign rvx_signal_29 = {rvx_signal_05,addr_unused};
assign rvx_signal_08 = (rvx_signal_06==0);
assign rvx_signal_00 = rvx_port_07 & rvx_port_05 & rvx_signal_08 & (~rvx_port_04);
assign rvx_signal_19 = rvx_port_07 & rvx_port_05 & rvx_signal_08 & rvx_port_04;

assign rvx_signal_27 = $unsigned(rvx_port_13);
assign rvx_signal_21 = $unsigned(rvx_port_13);
assign rvx_signal_12 = $unsigned(rvx_port_13);
assign rvx_signal_09 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_19 = 0;
	rvx_signal_20 = 0;
	rvx_port_06 = 1;

	rvx_signal_10 = 0;
	rvx_signal_28 = 0;

	rvx_signal_17 = 0;
	rvx_signal_23 = 0;

	rvx_signal_16 = 0;
	rvx_signal_13 = 0;

	rvx_signal_02 = 0;
	rvx_signal_11 = 0;

	if(rvx_port_07==1'b 1)
	begin
		case(rvx_signal_29)
			`RVX_GDEF_621:
			begin
				rvx_signal_10 = rvx_signal_00;
				rvx_signal_28 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_07);
				rvx_port_06 = rvx_signal_22;
			end
			`RVX_GDEF_299:
			begin
				rvx_signal_17 = rvx_signal_00;
				rvx_signal_23 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_25);
				rvx_port_06 = rvx_signal_26;
			end
			`RVX_GDEF_141:
			begin
				rvx_signal_16 = rvx_signal_00;
				rvx_signal_13 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_04);
				rvx_port_06 = rvx_signal_01;
			end
			`RVX_GDEF_050:
			begin
				rvx_signal_02 = rvx_signal_00;
				rvx_signal_11 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_18);
				rvx_port_06 = rvx_signal_24;
			end
			default:
				rvx_port_19 = 1;
		endcase
	end
end

assign rvx_port_12 = rvx_signal_10;
assign rvx_signal_07 = rvx_port_02;
assign rvx_signal_22 = 1;
assign rvx_signal_25 = 0;
assign rvx_port_16 = rvx_signal_23;
assign rvx_port_14 = rvx_signal_21;
assign rvx_signal_26 = 1;
assign rvx_port_00 = rvx_signal_16;
assign rvx_signal_04 = rvx_port_03;
assign rvx_signal_01 = rvx_port_11;
assign rvx_port_15 = rvx_signal_02;
assign rvx_signal_18 = rvx_port_09;
assign rvx_signal_24 = 1;

endmodule
