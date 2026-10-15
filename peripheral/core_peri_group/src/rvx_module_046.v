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
// 2026-10-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_04.vh"




module RVX_MODULE_046
(
	rvx_port_18,
	rvx_port_14,

	rvx_port_06,
	rvx_port_04,
	rvx_port_15,
	rvx_port_05,
	rvx_port_03,
	rvx_port_17,
	rvx_port_09,
	rvx_port_16,

	rvx_port_13,
	rvx_port_10,
	rvx_port_11,
	rvx_port_02,
	rvx_port_07,
	rvx_port_01,
	rvx_port_19,
	rvx_port_12,
	rvx_port_08,
	rvx_port_00
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_18, rvx_port_14;
input wire rvx_port_06;
input wire rvx_port_04;
input wire [RVX_GPARA_2-1:0] rvx_port_15;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_17;
output reg rvx_port_09;
output reg rvx_port_16;

input wire rvx_port_13;

output wire rvx_port_10;
input wire [`RVX_GDEF_229-1:0] rvx_port_11;

output wire rvx_port_02;
output wire [`RVX_GDEF_526-1:0] rvx_port_07;

output wire rvx_port_01;
input wire [`RVX_GDEF_167-1:0] rvx_port_19;
input wire rvx_port_12;

output wire rvx_port_08;
input wire [`RVX_GDEF_332-1:0] rvx_port_00;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_19;
reg [RVX_GPARA_0-1:0] rvx_signal_03;
wire rvx_signal_01;
wire rvx_signal_28;
wire rvx_signal_21;

wire [`RVX_GDEF_024-1:0] paddr_offset = rvx_port_15;
wire [`RVX_GDEF_024-1:0] rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_29;
wire [`RVX_GDEF_074-1:0] rvx_signal_10;
wire [`RVX_GDEF_074-1:0] addr_unused = 0;
reg rvx_signal_02;
wire [RVX_GPARA_0-1:0] rvx_signal_18;
reg rvx_signal_07;
wire [RVX_GPARA_0-1:0] rvx_signal_09;
wire rvx_signal_12;
reg rvx_signal_13;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
reg rvx_signal_14;
wire [RVX_GPARA_0-1:0] rvx_signal_26;
wire rvx_signal_17;
reg rvx_signal_08;
wire [RVX_GPARA_0-1:0] rvx_signal_06;
reg rvx_signal_20;
wire [RVX_GPARA_0-1:0] rvx_signal_04;
wire rvx_signal_24;
reg rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_00;
reg rvx_signal_25;
wire [RVX_GPARA_0-1:0] rvx_signal_23;
wire rvx_signal_22;

assign rvx_signal_19 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_03);
assign rvx_port_17 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_03);
assign {rvx_signal_29,rvx_signal_10} = paddr_offset;
assign rvx_signal_15 = {rvx_signal_29,addr_unused};
assign rvx_signal_21 = (rvx_signal_10==0);
assign rvx_signal_01 = rvx_port_06 & rvx_port_04 & rvx_signal_21 & (~rvx_port_05);
assign rvx_signal_28 = rvx_port_06 & rvx_port_04 & rvx_signal_21 & rvx_port_05;

assign rvx_signal_09 = $unsigned(rvx_port_03);
assign rvx_signal_26 = $unsigned(rvx_port_03);
assign rvx_signal_04 = $unsigned(rvx_port_03);
assign rvx_signal_23 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_16 = 0;
	rvx_signal_03 = 0;
	rvx_port_09 = 1;

	rvx_signal_02 = 0;
	rvx_signal_07 = 0;

	rvx_signal_13 = 0;
	rvx_signal_14 = 0;

	rvx_signal_08 = 0;
	rvx_signal_20 = 0;

	rvx_signal_11 = 0;
	rvx_signal_25 = 0;

	if(rvx_port_06==1'b 1)
	begin
		case(rvx_signal_15)
			`RVX_GDEF_159:
			begin
				rvx_signal_02 = rvx_signal_01;
				rvx_signal_07 = rvx_signal_28;
				rvx_signal_03 = $unsigned(rvx_signal_18);
				rvx_port_09 = rvx_signal_12;
			end
			`RVX_GDEF_162:
			begin
				rvx_signal_13 = rvx_signal_01;
				rvx_signal_14 = rvx_signal_28;
				rvx_signal_03 = $unsigned(rvx_signal_27);
				rvx_port_09 = rvx_signal_17;
			end
			`RVX_GDEF_480:
			begin
				rvx_signal_08 = rvx_signal_01;
				rvx_signal_20 = rvx_signal_28;
				rvx_signal_03 = $unsigned(rvx_signal_06);
				rvx_port_09 = rvx_signal_24;
			end
			`RVX_GDEF_271:
			begin
				rvx_signal_11 = rvx_signal_01;
				rvx_signal_25 = rvx_signal_28;
				rvx_signal_03 = $unsigned(rvx_signal_00);
				rvx_port_09 = rvx_signal_22;
			end
			default:
				rvx_port_16 = 1;
		endcase
	end
end

assign rvx_port_10 = rvx_signal_02;
assign rvx_signal_18 = rvx_port_11;
assign rvx_signal_12 = 1;
assign rvx_signal_27 = 0;
assign rvx_port_02 = rvx_signal_14;
assign rvx_port_07 = rvx_signal_26;
assign rvx_signal_17 = 1;
assign rvx_port_01 = rvx_signal_08;
assign rvx_signal_06 = rvx_port_19;
assign rvx_signal_24 = rvx_port_12;
assign rvx_port_08 = rvx_signal_11;
assign rvx_signal_00 = rvx_port_00;
assign rvx_signal_22 = 1;

endmodule
