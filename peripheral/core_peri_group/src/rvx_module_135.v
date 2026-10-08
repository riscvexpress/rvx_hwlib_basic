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
`include "rvx_include_00.vh"




module RVX_MODULE_135
(
	rvx_port_12,
	rvx_port_08,

	rvx_port_01,
	rvx_port_14,
	rvx_port_17,
	rvx_port_16,
	rvx_port_05,
	rvx_port_09,
	rvx_port_15,
	rvx_port_06,

	rvx_port_10,
	rvx_port_03,
	rvx_port_04,
	rvx_port_18,
	rvx_port_13,
	rvx_port_00,
	rvx_port_19,
	rvx_port_02,
	rvx_port_07,
	rvx_port_11
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_12, rvx_port_08;
input wire rvx_port_01;
input wire rvx_port_14;
input wire [RVX_GPARA_0-1:0] rvx_port_17;
input wire rvx_port_16;
input wire [RVX_GPARA_1-1:0] rvx_port_05;
output wire [RVX_GPARA_1-1:0] rvx_port_09;
output reg rvx_port_15;
output reg rvx_port_06;

input wire rvx_port_10;

output wire rvx_port_03;
input wire [`RVX_GDEF_586-1:0] rvx_port_04;

output wire rvx_port_18;
output wire [`RVX_GDEF_209-1:0] rvx_port_13;

output wire rvx_port_00;
input wire [`RVX_GDEF_219-1:0] rvx_port_19;
input wire rvx_port_02;

output wire rvx_port_07;
input wire [`RVX_GDEF_318-1:0] rvx_port_11;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_26;
reg [RVX_GPARA_1-1:0] rvx_signal_09;
wire rvx_signal_14;
wire rvx_signal_03;
wire rvx_signal_29;

wire [`RVX_GDEF_154-1:0] paddr_offset = rvx_port_17;
wire [`RVX_GDEF_154-1:0] rvx_signal_24;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
wire [`RVX_GDEF_138-1:0] rvx_signal_05;
wire [`RVX_GDEF_138-1:0] addr_unused = 0;
reg rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_08;
reg rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_21;
wire rvx_signal_20;
reg rvx_signal_18;
wire [RVX_GPARA_1-1:0] rvx_signal_25;
reg rvx_signal_17;
wire [RVX_GPARA_1-1:0] rvx_signal_10;
wire rvx_signal_04;
reg rvx_signal_07;
wire [RVX_GPARA_1-1:0] rvx_signal_02;
reg rvx_signal_11;
wire [RVX_GPARA_1-1:0] rvx_signal_13;
wire rvx_signal_01;
reg rvx_signal_19;
wire [RVX_GPARA_1-1:0] rvx_signal_12;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire rvx_signal_06;

assign rvx_signal_26 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_05);
assign rvx_port_09 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_09);
assign {rvx_signal_27,rvx_signal_05} = paddr_offset;
assign rvx_signal_24 = {rvx_signal_27,addr_unused};
assign rvx_signal_29 = (rvx_signal_05==0);
assign rvx_signal_14 = rvx_port_01 & rvx_port_14 & rvx_signal_29 & (~rvx_port_16);
assign rvx_signal_03 = rvx_port_01 & rvx_port_14 & rvx_signal_29 & rvx_port_16;

assign rvx_signal_21 = $unsigned(rvx_port_05);
assign rvx_signal_10 = $unsigned(rvx_port_05);
assign rvx_signal_13 = $unsigned(rvx_port_05);
assign rvx_signal_22 = $unsigned(rvx_port_05);

always@(*)
begin
	rvx_port_06 = 0;
	rvx_signal_09 = 0;
	rvx_port_15 = 1;

	rvx_signal_16 = 0;
	rvx_signal_00 = 0;

	rvx_signal_18 = 0;
	rvx_signal_17 = 0;

	rvx_signal_07 = 0;
	rvx_signal_11 = 0;

	rvx_signal_19 = 0;
	rvx_signal_28 = 0;

	if(rvx_port_01==1'b 1)
	begin
		case(rvx_signal_24)
			`RVX_GDEF_552:
			begin
				rvx_signal_16 = rvx_signal_14;
				rvx_signal_00 = rvx_signal_03;
				rvx_signal_09 = $unsigned(rvx_signal_08);
				rvx_port_15 = rvx_signal_20;
			end
			`RVX_GDEF_149:
			begin
				rvx_signal_18 = rvx_signal_14;
				rvx_signal_17 = rvx_signal_03;
				rvx_signal_09 = $unsigned(rvx_signal_25);
				rvx_port_15 = rvx_signal_04;
			end
			`RVX_GDEF_186:
			begin
				rvx_signal_07 = rvx_signal_14;
				rvx_signal_11 = rvx_signal_03;
				rvx_signal_09 = $unsigned(rvx_signal_02);
				rvx_port_15 = rvx_signal_01;
			end
			`RVX_GDEF_253:
			begin
				rvx_signal_19 = rvx_signal_14;
				rvx_signal_28 = rvx_signal_03;
				rvx_signal_09 = $unsigned(rvx_signal_12);
				rvx_port_15 = rvx_signal_06;
			end
			default:
				rvx_port_06 = 1;
		endcase
	end
end

assign rvx_port_03 = rvx_signal_16;
assign rvx_signal_08 = rvx_port_04;
assign rvx_signal_20 = 1;
assign rvx_signal_25 = 0;
assign rvx_port_18 = rvx_signal_17;
assign rvx_port_13 = rvx_signal_10;
assign rvx_signal_04 = 1;
assign rvx_port_00 = rvx_signal_07;
assign rvx_signal_02 = rvx_port_19;
assign rvx_signal_01 = rvx_port_02;
assign rvx_port_07 = rvx_signal_19;
assign rvx_signal_12 = rvx_port_11;
assign rvx_signal_06 = 1;

endmodule
