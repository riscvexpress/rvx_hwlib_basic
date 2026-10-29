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
`include "rvx_include_20.vh"




module RVX_MODULE_036
(
	rvx_port_06,
	rvx_port_15,

	rvx_port_14,
	rvx_port_08,
	rvx_port_18,
	rvx_port_16,
	rvx_port_13,
	rvx_port_23,
	rvx_port_02,
	rvx_port_03,

	rvx_port_21,
	rvx_port_24,
	rvx_port_10,
	rvx_port_07,
	rvx_port_11,
	rvx_port_04,
	rvx_port_20,
	rvx_port_05,
	rvx_port_09,
	rvx_port_00,
	rvx_port_22,
	rvx_port_12,
	rvx_port_19,
	rvx_port_17,
	rvx_port_01
);




parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_06, rvx_port_15;
input wire rvx_port_14;
input wire rvx_port_08;
input wire [RVX_GPARA_3-1:0] rvx_port_18;
input wire rvx_port_16;
input wire [RVX_GPARA_2-1:0] rvx_port_13;
output wire [RVX_GPARA_2-1:0] rvx_port_23;
output reg rvx_port_02;
output reg rvx_port_03;

parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_4 = 0;

input wire rvx_port_21;

output wire rvx_port_24;
input wire [`RVX_GDEF_004-1:0] rvx_port_10;
output wire rvx_port_07;
output wire [`RVX_GDEF_004-1:0] rvx_port_11;

output wire [`RVX_GDEF_577-1:0] rvx_port_04;

output wire [`RVX_GDEF_471-1:0] rvx_port_20;

output wire rvx_port_05;
input wire [`RVX_GDEF_434-1:0] rvx_port_09;
output wire rvx_port_00;
output wire [`RVX_GDEF_434-1:0] rvx_port_22;

output wire rvx_port_12;
input wire [`RVX_GDEF_209-1:0] rvx_port_19;
output wire rvx_port_17;
output wire [`RVX_GDEF_209-1:0] rvx_port_01;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_03;
reg [RVX_GPARA_2-1:0] rvx_signal_00;
wire rvx_signal_17;
wire rvx_signal_06;
wire rvx_signal_20;

wire [`RVX_GDEF_131-1:0] paddr_offset = rvx_port_18;
wire [`RVX_GDEF_131-1:0] rvx_signal_24;
wire [RVX_GPARA_3-1:0] rvx_signal_10;
wire [`RVX_GDEF_582-1:0] rvx_signal_07;
wire [`RVX_GDEF_582-1:0] addr_unused = 0;
reg rvx_signal_25;
wire [RVX_GPARA_2-1:0] rvx_signal_15;
reg rvx_signal_02;
wire [RVX_GPARA_2-1:0] rvx_signal_34;
wire rvx_signal_31;
reg rvx_signal_04;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
reg rvx_signal_35;
wire [RVX_GPARA_2-1:0] rvx_signal_05;
wire rvx_signal_13;
reg [11-1:0] rvx_signal_27;
reg rvx_signal_29;
wire [RVX_GPARA_2-1:0] rvx_signal_22;
reg rvx_signal_18;
wire [RVX_GPARA_2-1:0] rvx_signal_32;
wire rvx_signal_26;
reg [11-1:0] rvx_signal_23;
reg rvx_signal_16;
wire [RVX_GPARA_2-1:0] rvx_signal_08;
reg rvx_signal_01;
wire [RVX_GPARA_2-1:0] rvx_signal_30;
wire rvx_signal_14;
reg rvx_signal_11;
wire [RVX_GPARA_2-1:0] rvx_signal_28;
reg rvx_signal_12;
wire [RVX_GPARA_2-1:0] rvx_signal_09;
wire rvx_signal_36;

assign rvx_signal_03 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_13);
assign rvx_port_23 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_00);
assign {rvx_signal_10,rvx_signal_07} = paddr_offset;
assign rvx_signal_24 = {rvx_signal_10,addr_unused};
assign rvx_signal_20 = (rvx_signal_07==0);
assign rvx_signal_17 = rvx_port_14 & rvx_port_08 & rvx_signal_20 & (~rvx_port_16);
assign rvx_signal_06 = rvx_port_14 & rvx_port_08 & rvx_signal_20 & rvx_port_16;

assign rvx_signal_34 = $unsigned(rvx_port_13);
assign rvx_signal_05 = $unsigned(rvx_port_13);
assign rvx_signal_32 = $unsigned(rvx_port_13);
assign rvx_signal_30 = $unsigned(rvx_port_13);
assign rvx_signal_09 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_03 = 0;
	rvx_signal_00 = 0;
	rvx_port_02 = 1;

	rvx_signal_25 = 0;
	rvx_signal_02 = 0;

	rvx_signal_04 = 0;
	rvx_signal_35 = 0;

	rvx_signal_29 = 0;
	rvx_signal_18 = 0;

	rvx_signal_16 = 0;
	rvx_signal_01 = 0;

	rvx_signal_11 = 0;
	rvx_signal_12 = 0;

	if(rvx_port_14==1'b 1)
	begin
		case(rvx_signal_24)
			`RVX_GDEF_212:
			begin
				rvx_signal_25 = rvx_signal_17;
				rvx_signal_02 = rvx_signal_06;
				rvx_signal_00 = $unsigned(rvx_signal_15);
				rvx_port_02 = rvx_signal_31;
			end
			`RVX_GDEF_417:
			begin
				rvx_signal_04 = rvx_signal_17;
				rvx_signal_35 = rvx_signal_06;
				rvx_signal_00 = $unsigned(rvx_signal_19);
				rvx_port_02 = rvx_signal_13;
			end
			`RVX_GDEF_421:
			begin
				rvx_signal_29 = rvx_signal_17;
				rvx_signal_18 = rvx_signal_06;
				rvx_signal_00 = $unsigned(rvx_signal_22);
				rvx_port_02 = rvx_signal_26;
			end
			`RVX_GDEF_387:
			begin
				rvx_signal_16 = rvx_signal_17;
				rvx_signal_01 = rvx_signal_06;
				rvx_signal_00 = $unsigned(rvx_signal_08);
				rvx_port_02 = rvx_signal_14;
			end
			`RVX_GDEF_334:
			begin
				rvx_signal_11 = rvx_signal_17;
				rvx_signal_12 = rvx_signal_06;
				rvx_signal_00 = $unsigned(rvx_signal_28);
				rvx_port_02 = rvx_signal_36;
			end
			default:
				rvx_port_03 = 1;
		endcase
	end
end

always@(posedge rvx_port_06, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_27 <= RVX_GPARA_1;
	else if (rvx_signal_35==1'b 1)
		rvx_signal_27 <= rvx_signal_05;
end
assign rvx_signal_19 = rvx_signal_27;
always@(posedge rvx_port_06, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_23 <= RVX_GPARA_4;
	else if (rvx_signal_18==1'b 1)
		rvx_signal_23 <= rvx_signal_32;
end
assign rvx_signal_22 = rvx_signal_23;
assign rvx_port_24 = rvx_signal_25;
assign rvx_signal_15 = rvx_port_10;
assign rvx_port_07 = rvx_signal_02;
assign rvx_port_11 = rvx_signal_34;
assign rvx_signal_31 = 1;
assign rvx_port_04 = rvx_signal_27;
assign rvx_signal_13 = 1;
assign rvx_port_20 = rvx_signal_23;
assign rvx_signal_26 = 1;
assign rvx_port_05 = rvx_signal_16;
assign rvx_signal_08 = rvx_port_09;
assign rvx_port_00 = rvx_signal_01;
assign rvx_port_22 = rvx_signal_30;
assign rvx_signal_14 = 1;
assign rvx_port_12 = rvx_signal_11;
assign rvx_signal_28 = rvx_port_19;
assign rvx_port_17 = rvx_signal_12;
assign rvx_port_01 = rvx_signal_09;
assign rvx_signal_36 = 1;

endmodule
