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
`include "rvx_include_07.vh"




module RVX_MODULE_052
(
	rvx_port_23,
	rvx_port_22,

	rvx_port_03,
	rvx_port_06,
	rvx_port_12,
	rvx_port_15,
	rvx_port_13,
	rvx_port_18,
	rvx_port_10,
	rvx_port_14,

	rvx_port_19,
	rvx_port_04,
	rvx_port_01,
	rvx_port_02,
	rvx_port_24,
	rvx_port_05,
	rvx_port_07,
	rvx_port_00,
	rvx_port_17,
	rvx_port_21,
	rvx_port_08,
	rvx_port_20,
	rvx_port_11,
	rvx_port_16,
	rvx_port_09
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_4 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_23, rvx_port_22;
input wire rvx_port_03;
input wire rvx_port_06;
input wire [RVX_GPARA_2-1:0] rvx_port_12;
input wire rvx_port_15;
input wire [RVX_GPARA_3-1:0] rvx_port_13;
output wire [RVX_GPARA_3-1:0] rvx_port_18;
output reg rvx_port_10;
output reg rvx_port_14;

parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_0 = 0;

input wire rvx_port_19;

output wire rvx_port_04;
input wire [`RVX_GDEF_386-1:0] rvx_port_01;
output wire rvx_port_02;
output wire [`RVX_GDEF_386-1:0] rvx_port_24;

output wire [`RVX_GDEF_249-1:0] rvx_port_05;

output wire [`RVX_GDEF_027-1:0] rvx_port_07;

output wire rvx_port_00;
input wire [`RVX_GDEF_566-1:0] rvx_port_17;
output wire rvx_port_21;
output wire [`RVX_GDEF_566-1:0] rvx_port_08;

output wire rvx_port_20;
input wire [`RVX_GDEF_546-1:0] rvx_port_11;
output wire rvx_port_16;
output wire [`RVX_GDEF_546-1:0] rvx_port_09;

genvar i;

wire [RVX_GPARA_3-1:0] rvx_signal_15;
reg [RVX_GPARA_3-1:0] rvx_signal_19;
wire rvx_signal_12;
wire rvx_signal_00;
wire rvx_signal_13;

wire [`RVX_GDEF_209-1:0] paddr_offset = rvx_port_12;
wire [`RVX_GDEF_209-1:0] rvx_signal_21;
wire [RVX_GPARA_2-1:0] rvx_signal_09;
wire [`RVX_GDEF_406-1:0] rvx_signal_01;
wire [`RVX_GDEF_406-1:0] addr_unused = 0;
reg rvx_signal_03;
wire [RVX_GPARA_3-1:0] rvx_signal_16;
reg rvx_signal_18;
wire [RVX_GPARA_3-1:0] rvx_signal_33;
wire rvx_signal_25;
reg rvx_signal_31;
wire [RVX_GPARA_3-1:0] rvx_signal_34;
reg rvx_signal_08;
wire [RVX_GPARA_3-1:0] rvx_signal_02;
wire rvx_signal_23;
reg [11-1:0] rvx_signal_29;
reg rvx_signal_20;
wire [RVX_GPARA_3-1:0] rvx_signal_14;
reg rvx_signal_35;
wire [RVX_GPARA_3-1:0] rvx_signal_27;
wire rvx_signal_10;
reg [11-1:0] rvx_signal_04;
reg rvx_signal_32;
wire [RVX_GPARA_3-1:0] rvx_signal_11;
reg rvx_signal_24;
wire [RVX_GPARA_3-1:0] rvx_signal_30;
wire rvx_signal_17;
reg rvx_signal_28;
wire [RVX_GPARA_3-1:0] rvx_signal_06;
reg rvx_signal_26;
wire [RVX_GPARA_3-1:0] rvx_signal_36;
wire rvx_signal_22;

assign rvx_signal_15 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_3,RVX_GPARA_4,rvx_port_13);
assign rvx_port_18 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_3,RVX_GPARA_4,rvx_signal_19);
assign {rvx_signal_09,rvx_signal_01} = paddr_offset;
assign rvx_signal_21 = {rvx_signal_09,addr_unused};
assign rvx_signal_13 = (rvx_signal_01==0);
assign rvx_signal_12 = rvx_port_03 & rvx_port_06 & rvx_signal_13 & (~rvx_port_15);
assign rvx_signal_00 = rvx_port_03 & rvx_port_06 & rvx_signal_13 & rvx_port_15;

assign rvx_signal_33 = $unsigned(rvx_port_13);
assign rvx_signal_02 = $unsigned(rvx_port_13);
assign rvx_signal_27 = $unsigned(rvx_port_13);
assign rvx_signal_30 = $unsigned(rvx_port_13);
assign rvx_signal_36 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_14 = 0;
	rvx_signal_19 = 0;
	rvx_port_10 = 1;

	rvx_signal_03 = 0;
	rvx_signal_18 = 0;

	rvx_signal_31 = 0;
	rvx_signal_08 = 0;

	rvx_signal_20 = 0;
	rvx_signal_35 = 0;

	rvx_signal_32 = 0;
	rvx_signal_24 = 0;

	rvx_signal_28 = 0;
	rvx_signal_26 = 0;

	if(rvx_port_03==1'b 1)
	begin
		case(rvx_signal_21)
			`RVX_GDEF_517:
			begin
				rvx_signal_03 = rvx_signal_12;
				rvx_signal_18 = rvx_signal_00;
				rvx_signal_19 = $unsigned(rvx_signal_16);
				rvx_port_10 = rvx_signal_25;
			end
			`RVX_GDEF_354:
			begin
				rvx_signal_31 = rvx_signal_12;
				rvx_signal_08 = rvx_signal_00;
				rvx_signal_19 = $unsigned(rvx_signal_34);
				rvx_port_10 = rvx_signal_23;
			end
			`RVX_GDEF_330:
			begin
				rvx_signal_20 = rvx_signal_12;
				rvx_signal_35 = rvx_signal_00;
				rvx_signal_19 = $unsigned(rvx_signal_14);
				rvx_port_10 = rvx_signal_10;
			end
			`RVX_GDEF_319:
			begin
				rvx_signal_32 = rvx_signal_12;
				rvx_signal_24 = rvx_signal_00;
				rvx_signal_19 = $unsigned(rvx_signal_11);
				rvx_port_10 = rvx_signal_17;
			end
			`RVX_GDEF_020:
			begin
				rvx_signal_28 = rvx_signal_12;
				rvx_signal_26 = rvx_signal_00;
				rvx_signal_19 = $unsigned(rvx_signal_06);
				rvx_port_10 = rvx_signal_22;
			end
			default:
				rvx_port_14 = 1;
		endcase
	end
end

always@(posedge rvx_port_23, negedge rvx_port_22)
begin
	if(rvx_port_22==0)
		rvx_signal_29 <= RVX_GPARA_1;
	else if (rvx_signal_08==1'b 1)
		rvx_signal_29 <= rvx_signal_02;
end
assign rvx_signal_34 = rvx_signal_29;
always@(posedge rvx_port_23, negedge rvx_port_22)
begin
	if(rvx_port_22==0)
		rvx_signal_04 <= RVX_GPARA_0;
	else if (rvx_signal_35==1'b 1)
		rvx_signal_04 <= rvx_signal_27;
end
assign rvx_signal_14 = rvx_signal_04;
assign rvx_port_04 = rvx_signal_03;
assign rvx_signal_16 = rvx_port_01;
assign rvx_port_02 = rvx_signal_18;
assign rvx_port_24 = rvx_signal_33;
assign rvx_signal_25 = 1;
assign rvx_port_05 = rvx_signal_29;
assign rvx_signal_23 = 1;
assign rvx_port_07 = rvx_signal_04;
assign rvx_signal_10 = 1;
assign rvx_port_00 = rvx_signal_32;
assign rvx_signal_11 = rvx_port_17;
assign rvx_port_21 = rvx_signal_24;
assign rvx_port_08 = rvx_signal_30;
assign rvx_signal_17 = 1;
assign rvx_port_20 = rvx_signal_28;
assign rvx_signal_06 = rvx_port_11;
assign rvx_port_16 = rvx_signal_26;
assign rvx_port_09 = rvx_signal_36;
assign rvx_signal_22 = 1;

endmodule
