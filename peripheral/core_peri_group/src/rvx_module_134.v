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
`include "rvx_include_12.vh"




module RVX_MODULE_134
(
	rvx_port_15,
	rvx_port_08,

	rvx_port_01,
	rvx_port_12,
	rvx_port_06,
	rvx_port_09,
	rvx_port_03,
	rvx_port_02,
	rvx_port_07,
	rvx_port_04,

	rvx_port_10,
	rvx_port_14,
	rvx_port_11,
	rvx_port_00,
	rvx_port_18,
	rvx_port_13,
	rvx_port_19,
	rvx_port_05,
	rvx_port_17,
	rvx_port_16
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_15, rvx_port_08;
input wire rvx_port_01;
input wire rvx_port_12;
input wire [RVX_GPARA_2-1:0] rvx_port_06;
input wire rvx_port_09;
input wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire [RVX_GPARA_1-1:0] rvx_port_02;
output reg rvx_port_07;
output reg rvx_port_04;

input wire rvx_port_10;

output wire rvx_port_14;
input wire [`RVX_GDEF_456-1:0] rvx_port_11;

output wire rvx_port_00;
output wire [`RVX_GDEF_579-1:0] rvx_port_18;

output wire rvx_port_13;
input wire [`RVX_GDEF_405-1:0] rvx_port_19;
input wire rvx_port_05;

output wire rvx_port_17;
input wire [`RVX_GDEF_438-1:0] rvx_port_16;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_06;
reg [RVX_GPARA_1-1:0] rvx_signal_26;
wire rvx_signal_02;
wire rvx_signal_10;
wire rvx_signal_21;

wire [`RVX_GDEF_162-1:0] paddr_offset = rvx_port_06;
wire [`RVX_GDEF_162-1:0] rvx_signal_20;
wire [RVX_GPARA_2-1:0] rvx_signal_23;
wire [`RVX_GDEF_057-1:0] rvx_signal_28;
wire [`RVX_GDEF_057-1:0] addr_unused = 0;
reg rvx_signal_14;
wire [RVX_GPARA_1-1:0] rvx_signal_04;
reg rvx_signal_12;
wire [RVX_GPARA_1-1:0] rvx_signal_15;
wire rvx_signal_22;
reg rvx_signal_18;
wire [RVX_GPARA_1-1:0] rvx_signal_29;
reg rvx_signal_17;
wire [RVX_GPARA_1-1:0] rvx_signal_27;
wire rvx_signal_01;
reg rvx_signal_13;
wire [RVX_GPARA_1-1:0] rvx_signal_24;
reg rvx_signal_08;
wire [RVX_GPARA_1-1:0] rvx_signal_05;
wire rvx_signal_19;
reg rvx_signal_25;
wire [RVX_GPARA_1-1:0] rvx_signal_07;
reg rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_11;
wire rvx_signal_03;

assign rvx_signal_06 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_03);
assign rvx_port_02 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_26);
assign {rvx_signal_23,rvx_signal_28} = paddr_offset;
assign rvx_signal_20 = {rvx_signal_23,addr_unused};
assign rvx_signal_21 = (rvx_signal_28==0);
assign rvx_signal_02 = rvx_port_01 & rvx_port_12 & rvx_signal_21 & (~rvx_port_09);
assign rvx_signal_10 = rvx_port_01 & rvx_port_12 & rvx_signal_21 & rvx_port_09;

assign rvx_signal_15 = $unsigned(rvx_port_03);
assign rvx_signal_27 = $unsigned(rvx_port_03);
assign rvx_signal_05 = $unsigned(rvx_port_03);
assign rvx_signal_11 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_04 = 0;
	rvx_signal_26 = 0;
	rvx_port_07 = 1;

	rvx_signal_14 = 0;
	rvx_signal_12 = 0;

	rvx_signal_18 = 0;
	rvx_signal_17 = 0;

	rvx_signal_13 = 0;
	rvx_signal_08 = 0;

	rvx_signal_25 = 0;
	rvx_signal_00 = 0;

	if(rvx_port_01==1'b 1)
	begin
		case(rvx_signal_20)
			`RVX_GDEF_222:
			begin
				rvx_signal_14 = rvx_signal_02;
				rvx_signal_12 = rvx_signal_10;
				rvx_signal_26 = $unsigned(rvx_signal_04);
				rvx_port_07 = rvx_signal_22;
			end
			`RVX_GDEF_578:
			begin
				rvx_signal_18 = rvx_signal_02;
				rvx_signal_17 = rvx_signal_10;
				rvx_signal_26 = $unsigned(rvx_signal_29);
				rvx_port_07 = rvx_signal_01;
			end
			`RVX_GDEF_534:
			begin
				rvx_signal_13 = rvx_signal_02;
				rvx_signal_08 = rvx_signal_10;
				rvx_signal_26 = $unsigned(rvx_signal_24);
				rvx_port_07 = rvx_signal_19;
			end
			`RVX_GDEF_548:
			begin
				rvx_signal_25 = rvx_signal_02;
				rvx_signal_00 = rvx_signal_10;
				rvx_signal_26 = $unsigned(rvx_signal_07);
				rvx_port_07 = rvx_signal_03;
			end
			default:
				rvx_port_04 = 1;
		endcase
	end
end

assign rvx_port_14 = rvx_signal_14;
assign rvx_signal_04 = rvx_port_11;
assign rvx_signal_22 = 1;
assign rvx_signal_29 = 0;
assign rvx_port_00 = rvx_signal_17;
assign rvx_port_18 = rvx_signal_27;
assign rvx_signal_01 = 1;
assign rvx_port_13 = rvx_signal_13;
assign rvx_signal_24 = rvx_port_19;
assign rvx_signal_19 = rvx_port_05;
assign rvx_port_17 = rvx_signal_25;
assign rvx_signal_07 = rvx_port_16;
assign rvx_signal_03 = 1;

endmodule
