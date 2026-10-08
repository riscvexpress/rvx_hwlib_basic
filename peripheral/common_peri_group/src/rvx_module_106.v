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
`include "rvx_include_14.vh"




module RVX_MODULE_106
(
	rvx_port_21,
	rvx_port_08,

	rvx_port_17,
	rvx_port_03,
	rvx_port_07,
	rvx_port_23,
	rvx_port_09,
	rvx_port_14,
	rvx_port_22,
	rvx_port_18,

	rvx_port_11,
	rvx_port_19,
	rvx_port_10,
	rvx_port_15,
	rvx_port_05,
	rvx_port_06,
	rvx_port_04,
	rvx_port_13,
	rvx_port_20,
	rvx_port_24,
	rvx_port_00,
	rvx_port_12,
	rvx_port_16,
	rvx_port_02,
	rvx_port_01
);




parameter RVX_GPARA_4 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_3 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_21, rvx_port_08;
input wire rvx_port_17;
input wire rvx_port_03;
input wire [RVX_GPARA_4-1:0] rvx_port_07;
input wire rvx_port_23;
input wire [RVX_GPARA_0-1:0] rvx_port_09;
output wire [RVX_GPARA_0-1:0] rvx_port_14;
output reg rvx_port_22;
output reg rvx_port_18;

parameter RVX_GPARA_2 = 0;
parameter RVX_GPARA_1 = 0;

input wire rvx_port_11;

output wire rvx_port_19;
input wire [`RVX_GDEF_335-1:0] rvx_port_10;
output wire rvx_port_15;
output wire [`RVX_GDEF_335-1:0] rvx_port_05;

output wire [`RVX_GDEF_013-1:0] rvx_port_06;

output wire [`RVX_GDEF_544-1:0] rvx_port_04;

output wire rvx_port_13;
input wire [`RVX_GDEF_677-1:0] rvx_port_20;
output wire rvx_port_24;
output wire [`RVX_GDEF_677-1:0] rvx_port_00;

output wire rvx_port_12;
input wire [`RVX_GDEF_541-1:0] rvx_port_16;
output wire rvx_port_02;
output wire [`RVX_GDEF_541-1:0] rvx_port_01;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_02;
reg [RVX_GPARA_0-1:0] rvx_signal_12;
wire rvx_signal_25;
wire rvx_signal_22;
wire rvx_signal_28;

wire [`RVX_GDEF_515-1:0] paddr_offset = rvx_port_07;
wire [`RVX_GDEF_515-1:0] rvx_signal_04;
wire [RVX_GPARA_4-1:0] rvx_signal_24;
wire [`RVX_GDEF_256-1:0] rvx_signal_00;
wire [`RVX_GDEF_256-1:0] addr_unused = 0;
reg rvx_signal_29;
wire [RVX_GPARA_0-1:0] rvx_signal_34;
reg rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_20;
wire rvx_signal_14;
reg rvx_signal_30;
wire [RVX_GPARA_0-1:0] rvx_signal_08;
reg rvx_signal_35;
wire [RVX_GPARA_0-1:0] rvx_signal_31;
wire rvx_signal_16;
reg [11-1:0] rvx_signal_09;
reg rvx_signal_15;
wire [RVX_GPARA_0-1:0] rvx_signal_17;
reg rvx_signal_03;
wire [RVX_GPARA_0-1:0] rvx_signal_21;
wire rvx_signal_13;
reg [11-1:0] rvx_signal_33;
reg rvx_signal_27;
wire [RVX_GPARA_0-1:0] rvx_signal_32;
reg rvx_signal_36;
wire [RVX_GPARA_0-1:0] rvx_signal_01;
wire rvx_signal_06;
reg rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_26;
reg rvx_signal_19;
wire [RVX_GPARA_0-1:0] rvx_signal_23;
wire rvx_signal_07;

assign rvx_signal_02 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_3,rvx_port_09);
assign rvx_port_14 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_3,rvx_signal_12);
assign {rvx_signal_24,rvx_signal_00} = paddr_offset;
assign rvx_signal_04 = {rvx_signal_24,addr_unused};
assign rvx_signal_28 = (rvx_signal_00==0);
assign rvx_signal_25 = rvx_port_17 & rvx_port_03 & rvx_signal_28 & (~rvx_port_23);
assign rvx_signal_22 = rvx_port_17 & rvx_port_03 & rvx_signal_28 & rvx_port_23;

assign rvx_signal_20 = $unsigned(rvx_port_09);
assign rvx_signal_31 = $unsigned(rvx_port_09);
assign rvx_signal_21 = $unsigned(rvx_port_09);
assign rvx_signal_01 = $unsigned(rvx_port_09);
assign rvx_signal_23 = $unsigned(rvx_port_09);

always@(*)
begin
	rvx_port_18 = 0;
	rvx_signal_12 = 0;
	rvx_port_22 = 1;

	rvx_signal_29 = 0;
	rvx_signal_11 = 0;

	rvx_signal_30 = 0;
	rvx_signal_35 = 0;

	rvx_signal_15 = 0;
	rvx_signal_03 = 0;

	rvx_signal_27 = 0;
	rvx_signal_36 = 0;

	rvx_signal_10 = 0;
	rvx_signal_19 = 0;

	if(rvx_port_17==1'b 1)
	begin
		case(rvx_signal_04)
			`RVX_GDEF_100:
			begin
				rvx_signal_29 = rvx_signal_25;
				rvx_signal_11 = rvx_signal_22;
				rvx_signal_12 = $unsigned(rvx_signal_34);
				rvx_port_22 = rvx_signal_14;
			end
			`RVX_GDEF_208:
			begin
				rvx_signal_30 = rvx_signal_25;
				rvx_signal_35 = rvx_signal_22;
				rvx_signal_12 = $unsigned(rvx_signal_08);
				rvx_port_22 = rvx_signal_16;
			end
			`RVX_GDEF_199:
			begin
				rvx_signal_15 = rvx_signal_25;
				rvx_signal_03 = rvx_signal_22;
				rvx_signal_12 = $unsigned(rvx_signal_17);
				rvx_port_22 = rvx_signal_13;
			end
			`RVX_GDEF_622:
			begin
				rvx_signal_27 = rvx_signal_25;
				rvx_signal_36 = rvx_signal_22;
				rvx_signal_12 = $unsigned(rvx_signal_32);
				rvx_port_22 = rvx_signal_06;
			end
			`RVX_GDEF_451:
			begin
				rvx_signal_10 = rvx_signal_25;
				rvx_signal_19 = rvx_signal_22;
				rvx_signal_12 = $unsigned(rvx_signal_26);
				rvx_port_22 = rvx_signal_07;
			end
			default:
				rvx_port_18 = 1;
		endcase
	end
end

always@(posedge rvx_port_21, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_09 <= RVX_GPARA_2;
	else if (rvx_signal_35==1'b 1)
		rvx_signal_09 <= rvx_signal_31;
end
assign rvx_signal_08 = rvx_signal_09;
always@(posedge rvx_port_21, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_33 <= RVX_GPARA_1;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_33 <= rvx_signal_21;
end
assign rvx_signal_17 = rvx_signal_33;
assign rvx_port_19 = rvx_signal_29;
assign rvx_signal_34 = rvx_port_10;
assign rvx_port_15 = rvx_signal_11;
assign rvx_port_05 = rvx_signal_20;
assign rvx_signal_14 = 1;
assign rvx_port_06 = rvx_signal_09;
assign rvx_signal_16 = 1;
assign rvx_port_04 = rvx_signal_33;
assign rvx_signal_13 = 1;
assign rvx_port_13 = rvx_signal_27;
assign rvx_signal_32 = rvx_port_20;
assign rvx_port_24 = rvx_signal_36;
assign rvx_port_00 = rvx_signal_01;
assign rvx_signal_06 = 1;
assign rvx_port_12 = rvx_signal_10;
assign rvx_signal_26 = rvx_port_16;
assign rvx_port_02 = rvx_signal_19;
assign rvx_port_01 = rvx_signal_23;
assign rvx_signal_07 = 1;

endmodule
