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
`include "rvx_include_20.vh"




module RVX_MODULE_039
(
	rvx_port_11,
	rvx_port_14,

	rvx_port_13,
	rvx_port_06,
	rvx_port_15,
	rvx_port_00,
	rvx_port_07,
	rvx_port_16,
	rvx_port_17,
	rvx_port_02,

	rvx_port_18,
	rvx_port_09,
	rvx_port_08,
	rvx_port_03,
	rvx_port_05,
	rvx_port_04,
	rvx_port_10,
	rvx_port_12,
	rvx_port_01
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_11, rvx_port_14;
input wire rvx_port_13;
input wire rvx_port_06;
input wire [RVX_GPARA_2-1:0] rvx_port_15;
input wire rvx_port_00;
input wire [RVX_GPARA_0-1:0] rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_16;
output reg rvx_port_17;
output reg rvx_port_02;

input wire rvx_port_18;

output wire rvx_port_09;
input wire [5-1:0] rvx_port_08;
output wire rvx_port_03;
output wire [5-1:0] rvx_port_05;

output wire [32-1:0] rvx_port_04;

output wire rvx_port_10;

output wire [32-1:0] rvx_port_12;

output wire [32-1:0] rvx_port_01;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_16;
reg [RVX_GPARA_0-1:0] rvx_signal_35;
wire rvx_signal_36;
wire rvx_signal_07;
wire rvx_signal_08;

wire [`RVX_GDEF_402-1:0] paddr_offset = rvx_port_15;
wire [`RVX_GDEF_402-1:0] rvx_signal_12;
wire [RVX_GPARA_2-1:0] rvx_signal_28;
wire [`RVX_GDEF_599-1:0] rvx_signal_32;
wire [`RVX_GDEF_599-1:0] addr_unused = 0;
reg rvx_signal_01;
wire [5-1:0] rvx_signal_29;
reg rvx_signal_33;
wire [5-1:0] rvx_signal_34;
wire rvx_signal_19;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_37;
wire rvx_signal_06;
reg [32-1:0] rvx_signal_02;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_14;
reg rvx_signal_15;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_25;
reg rvx_signal_26;
wire [32-1:0] rvx_signal_20;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_23;
wire rvx_signal_17;
reg [32-1:0] rvx_signal_31;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_10;
wire rvx_signal_05;
reg [32-1:0] rvx_signal_27;

assign rvx_signal_16 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_07);
assign rvx_port_16 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_35);
assign {rvx_signal_28,rvx_signal_32} = paddr_offset;
assign rvx_signal_12 = {rvx_signal_28,addr_unused};
assign rvx_signal_08 = (rvx_signal_32==0);
assign rvx_signal_36 = rvx_port_13 & rvx_port_06 & rvx_signal_08 & (~rvx_port_00);
assign rvx_signal_07 = rvx_port_13 & rvx_port_06 & rvx_signal_08 & rvx_port_00;

assign rvx_signal_34 = $unsigned(rvx_port_07);
assign rvx_signal_37 = $unsigned(rvx_port_07);
assign rvx_signal_24 = $unsigned(rvx_port_07);
assign rvx_signal_23 = $unsigned(rvx_port_07);
assign rvx_signal_10 = $unsigned(rvx_port_07);

always@(*)
begin
	rvx_port_02 = 0;
	rvx_signal_35 = 0;
	rvx_port_17 = 1;

	rvx_signal_01 = 0;
	rvx_signal_33 = 0;

	rvx_signal_30 = 0;
	rvx_signal_21 = 0;

	rvx_signal_13 = 0;
	rvx_signal_15 = 0;

	rvx_signal_26 = 0;
	rvx_signal_11 = 0;

	rvx_signal_22 = 0;
	rvx_signal_04 = 0;

	if(rvx_port_13==1'b 1)
	begin
		case(rvx_signal_12)
			`RVX_GDEF_042:
			begin
				rvx_signal_01 = rvx_signal_36;
				rvx_signal_33 = rvx_signal_07;
				rvx_signal_35 = $unsigned(rvx_signal_29);
				rvx_port_17 = rvx_signal_19;
			end
			`RVX_GDEF_419:
			begin
				rvx_signal_30 = rvx_signal_36;
				rvx_signal_21 = rvx_signal_07;
				rvx_signal_35 = $unsigned(rvx_signal_00);
				rvx_port_17 = rvx_signal_06;
			end
			`RVX_GDEF_274:
			begin
				rvx_signal_13 = rvx_signal_36;
				rvx_signal_15 = rvx_signal_07;
				rvx_signal_35 = $unsigned(rvx_signal_14);
				rvx_port_17 = rvx_signal_25;
			end
			`RVX_GDEF_410:
			begin
				rvx_signal_26 = rvx_signal_36;
				rvx_signal_11 = rvx_signal_07;
				rvx_signal_35 = $unsigned(rvx_signal_20);
				rvx_port_17 = rvx_signal_17;
			end
			`RVX_GDEF_437:
			begin
				rvx_signal_22 = rvx_signal_36;
				rvx_signal_04 = rvx_signal_07;
				rvx_signal_35 = $unsigned(rvx_signal_18);
				rvx_port_17 = rvx_signal_05;
			end
			default:
				rvx_port_02 = 1;
		endcase
	end
end

always@(posedge rvx_port_11, negedge rvx_port_14)
begin
	if(rvx_port_14==0)
		rvx_signal_02 <= `RVX_GDEF_355;
	else if (rvx_signal_21==1'b 1)
		rvx_signal_02 <= rvx_signal_37;
end
assign rvx_signal_00 = rvx_signal_02;
always@(posedge rvx_port_11, negedge rvx_port_14)
begin
	if(rvx_port_14==0)
		rvx_signal_31 <= `RVX_GDEF_207;
	else if (rvx_signal_11==1'b 1)
		rvx_signal_31 <= rvx_signal_23;
end
assign rvx_signal_20 = rvx_signal_31;
always@(posedge rvx_port_11, negedge rvx_port_14)
begin
	if(rvx_port_14==0)
		rvx_signal_27 <= `RVX_GDEF_405;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_27 <= rvx_signal_10;
end
assign rvx_signal_18 = rvx_signal_27;
assign rvx_port_09 = rvx_signal_01;
assign rvx_signal_29 = rvx_port_08;
assign rvx_port_03 = rvx_signal_33;
assign rvx_port_05 = rvx_signal_34;
assign rvx_signal_19 = 1;
assign rvx_port_04 = rvx_signal_02;
assign rvx_signal_06 = 1;
assign rvx_port_10 = rvx_signal_15;
assign rvx_signal_14 = 0;
assign rvx_signal_25 = 1;
assign rvx_port_12 = rvx_signal_31;
assign rvx_signal_17 = 1;
assign rvx_port_01 = rvx_signal_27;
assign rvx_signal_05 = 1;

endmodule
