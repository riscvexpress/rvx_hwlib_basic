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
`include "rvx_include_06.vh"




module RVX_MODULE_042
(
	rvx_port_05,
	rvx_port_09,

	rvx_port_11,
	rvx_port_04,
	rvx_port_18,
	rvx_port_13,
	rvx_port_16,
	rvx_port_08,
	rvx_port_00,
	rvx_port_01,

	rvx_port_07,
	rvx_port_15,
	rvx_port_12,
	rvx_port_17,
	rvx_port_06,
	rvx_port_10,
	rvx_port_02,
	rvx_port_14,
	rvx_port_03,
	rvx_port_19
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_05, rvx_port_09;
input wire rvx_port_11;
input wire rvx_port_04;
input wire [RVX_GPARA_2-1:0] rvx_port_18;
input wire rvx_port_13;
input wire [RVX_GPARA_0-1:0] rvx_port_16;
output wire [RVX_GPARA_0-1:0] rvx_port_08;
output reg rvx_port_00;
output reg rvx_port_01;

input wire rvx_port_07;

output wire rvx_port_15;
input wire [`RVX_GDEF_687-1:0] rvx_port_12;

output wire rvx_port_17;
output wire [`RVX_GDEF_014-1:0] rvx_port_06;

output wire rvx_port_10;
input wire [`RVX_GDEF_299-1:0] rvx_port_02;
input wire rvx_port_14;

output wire rvx_port_03;
input wire [`RVX_GDEF_010-1:0] rvx_port_19;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_22;
reg [RVX_GPARA_0-1:0] rvx_signal_07;
wire rvx_signal_16;
wire rvx_signal_08;
wire rvx_signal_06;

wire [`RVX_GDEF_060-1:0] paddr_offset = rvx_port_18;
wire [`RVX_GDEF_060-1:0] rvx_signal_26;
wire [RVX_GPARA_2-1:0] rvx_signal_02;
wire [`RVX_GDEF_524-1:0] rvx_signal_00;
wire [`RVX_GDEF_524-1:0] addr_unused = 0;
reg rvx_signal_14;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
reg rvx_signal_15;
wire [RVX_GPARA_0-1:0] rvx_signal_29;
wire rvx_signal_09;
reg rvx_signal_04;
wire [RVX_GPARA_0-1:0] rvx_signal_11;
reg rvx_signal_20;
wire [RVX_GPARA_0-1:0] rvx_signal_03;
wire rvx_signal_19;
reg rvx_signal_24;
wire [RVX_GPARA_0-1:0] rvx_signal_28;
reg rvx_signal_21;
wire [RVX_GPARA_0-1:0] rvx_signal_01;
wire rvx_signal_12;
reg rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_05;
reg rvx_signal_25;
wire [RVX_GPARA_0-1:0] rvx_signal_17;
wire rvx_signal_18;

assign rvx_signal_22 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_16);
assign rvx_port_08 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_07);
assign {rvx_signal_02,rvx_signal_00} = paddr_offset;
assign rvx_signal_26 = {rvx_signal_02,addr_unused};
assign rvx_signal_06 = (rvx_signal_00==0);
assign rvx_signal_16 = rvx_port_11 & rvx_port_04 & rvx_signal_06 & (~rvx_port_13);
assign rvx_signal_08 = rvx_port_11 & rvx_port_04 & rvx_signal_06 & rvx_port_13;

assign rvx_signal_29 = $unsigned(rvx_port_16);
assign rvx_signal_03 = $unsigned(rvx_port_16);
assign rvx_signal_01 = $unsigned(rvx_port_16);
assign rvx_signal_17 = $unsigned(rvx_port_16);

always@(*)
begin
	rvx_port_01 = 0;
	rvx_signal_07 = 0;
	rvx_port_00 = 1;

	rvx_signal_14 = 0;
	rvx_signal_15 = 0;

	rvx_signal_04 = 0;
	rvx_signal_20 = 0;

	rvx_signal_24 = 0;
	rvx_signal_21 = 0;

	rvx_signal_10 = 0;
	rvx_signal_25 = 0;

	if(rvx_port_11==1'b 1)
	begin
		case(rvx_signal_26)
			`RVX_GDEF_172:
			begin
				rvx_signal_14 = rvx_signal_16;
				rvx_signal_15 = rvx_signal_08;
				rvx_signal_07 = $unsigned(rvx_signal_27);
				rvx_port_00 = rvx_signal_09;
			end
			`RVX_GDEF_551:
			begin
				rvx_signal_04 = rvx_signal_16;
				rvx_signal_20 = rvx_signal_08;
				rvx_signal_07 = $unsigned(rvx_signal_11);
				rvx_port_00 = rvx_signal_19;
			end
			`RVX_GDEF_250:
			begin
				rvx_signal_24 = rvx_signal_16;
				rvx_signal_21 = rvx_signal_08;
				rvx_signal_07 = $unsigned(rvx_signal_28);
				rvx_port_00 = rvx_signal_12;
			end
			`RVX_GDEF_348:
			begin
				rvx_signal_10 = rvx_signal_16;
				rvx_signal_25 = rvx_signal_08;
				rvx_signal_07 = $unsigned(rvx_signal_05);
				rvx_port_00 = rvx_signal_18;
			end
			default:
				rvx_port_01 = 1;
		endcase
	end
end

assign rvx_port_15 = rvx_signal_14;
assign rvx_signal_27 = rvx_port_12;
assign rvx_signal_09 = 1;
assign rvx_signal_11 = 0;
assign rvx_port_17 = rvx_signal_20;
assign rvx_port_06 = rvx_signal_03;
assign rvx_signal_19 = 1;
assign rvx_port_10 = rvx_signal_24;
assign rvx_signal_28 = rvx_port_02;
assign rvx_signal_12 = rvx_port_14;
assign rvx_port_03 = rvx_signal_10;
assign rvx_signal_05 = rvx_port_19;
assign rvx_signal_18 = 1;

endmodule
