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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_15.vh"




module RVX_MODULE_027
(
	rvx_port_16,
	rvx_port_06,

	rvx_port_05,
	rvx_port_10,
	rvx_port_11,
	rvx_port_18,
	rvx_port_03,
	rvx_port_01,
	rvx_port_02,
	rvx_port_12,

	rvx_port_14,
	rvx_port_17,
	rvx_port_09,
	rvx_port_00,
	rvx_port_07,
	rvx_port_04,
	rvx_port_20,
	rvx_port_19,
	rvx_port_08,
	rvx_port_15,
	rvx_port_13
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_16, rvx_port_06;
input wire rvx_port_05;
input wire rvx_port_10;
input wire [RVX_GPARA_2-1:0] rvx_port_11;
input wire rvx_port_18;
input wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output reg rvx_port_02;
output reg rvx_port_12;

input wire rvx_port_14;

output wire rvx_port_17;
input wire [32-1:0] rvx_port_09;
output wire rvx_port_00;
output wire [32-1:0] rvx_port_07;

output wire [32-1:0] rvx_port_04;

output wire [32-1:0] rvx_port_20;

output wire rvx_port_19;
input wire [32-1:0] rvx_port_08;

output wire rvx_port_15;
input wire [32-1:0] rvx_port_13;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_09;
reg [RVX_GPARA_0-1:0] rvx_signal_26;
wire rvx_signal_14;
wire rvx_signal_06;
wire rvx_signal_11;

wire [`RVX_GDEF_312-1:0] paddr_offset = rvx_port_11;
wire [`RVX_GDEF_312-1:0] rvx_signal_05;
wire [RVX_GPARA_2-1:0] rvx_signal_33;
wire [`RVX_GDEF_498-1:0] rvx_signal_35;
wire [`RVX_GDEF_498-1:0] addr_unused = 0;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_22;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_23;
wire rvx_signal_30;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_34;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_07;
wire rvx_signal_25;
reg [32-1:0] rvx_signal_19;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_28;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_17;
wire rvx_signal_01;
reg [32-1:0] rvx_signal_18;
reg rvx_signal_15;
wire [32-1:0] rvx_signal_02;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_10;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_16;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_31;
wire rvx_signal_12;

assign rvx_signal_09 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_03);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_26);
assign {rvx_signal_33,rvx_signal_35} = paddr_offset;
assign rvx_signal_05 = {rvx_signal_33,addr_unused};
assign rvx_signal_11 = (rvx_signal_35==0);
assign rvx_signal_14 = rvx_port_05 & rvx_port_10 & rvx_signal_11 & (~rvx_port_18);
assign rvx_signal_06 = rvx_port_05 & rvx_port_10 & rvx_signal_11 & rvx_port_18;

assign rvx_signal_23 = $unsigned(rvx_port_03);
assign rvx_signal_07 = $unsigned(rvx_port_03);
assign rvx_signal_17 = $unsigned(rvx_port_03);
assign rvx_signal_27 = $unsigned(rvx_port_03);
assign rvx_signal_31 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_26 = 0;
	rvx_port_02 = 1;

	rvx_signal_20 = 0;
	rvx_signal_00 = 0;

	rvx_signal_29 = 0;
	rvx_signal_08 = 0;

	rvx_signal_32 = 0;
	rvx_signal_04 = 0;

	rvx_signal_15 = 0;
	rvx_signal_03 = 0;

	rvx_signal_36 = 0;
	rvx_signal_21 = 0;

	if(rvx_port_05==1'b 1)
	begin
		case(rvx_signal_05)
			`RVX_GDEF_489:
			begin
				rvx_signal_20 = rvx_signal_14;
				rvx_signal_00 = rvx_signal_06;
				rvx_signal_26 = $unsigned(rvx_signal_22);
				rvx_port_02 = rvx_signal_30;
			end
			`RVX_GDEF_094:
			begin
				rvx_signal_29 = rvx_signal_14;
				rvx_signal_08 = rvx_signal_06;
				rvx_signal_26 = $unsigned(rvx_signal_34);
				rvx_port_02 = rvx_signal_25;
			end
			`RVX_GDEF_600:
			begin
				rvx_signal_32 = rvx_signal_14;
				rvx_signal_04 = rvx_signal_06;
				rvx_signal_26 = $unsigned(rvx_signal_28);
				rvx_port_02 = rvx_signal_01;
			end
			`RVX_GDEF_097:
			begin
				rvx_signal_15 = rvx_signal_14;
				rvx_signal_03 = rvx_signal_06;
				rvx_signal_26 = $unsigned(rvx_signal_02);
				rvx_port_02 = rvx_signal_10;
			end
			`RVX_GDEF_448:
			begin
				rvx_signal_36 = rvx_signal_14;
				rvx_signal_21 = rvx_signal_06;
				rvx_signal_26 = $unsigned(rvx_signal_16);
				rvx_port_02 = rvx_signal_12;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

always@(posedge rvx_port_16, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_19 <= `RVX_GDEF_199;
	else if (rvx_signal_08==1'b 1)
		rvx_signal_19 <= rvx_signal_07;
end
assign rvx_signal_34 = rvx_signal_19;
always@(posedge rvx_port_16, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_18 <= `RVX_GDEF_170;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_18 <= rvx_signal_17;
end
assign rvx_signal_28 = rvx_signal_18;
assign rvx_port_17 = rvx_signal_20;
assign rvx_signal_22 = rvx_port_09;
assign rvx_port_00 = rvx_signal_00;
assign rvx_port_07 = rvx_signal_23;
assign rvx_signal_30 = 1;
assign rvx_port_04 = rvx_signal_19;
assign rvx_signal_25 = 1;
assign rvx_port_20 = rvx_signal_18;
assign rvx_signal_01 = 1;
assign rvx_port_19 = rvx_signal_15;
assign rvx_signal_02 = rvx_port_08;
assign rvx_signal_10 = 1;
assign rvx_port_15 = rvx_signal_36;
assign rvx_signal_16 = rvx_port_13;
assign rvx_signal_12 = 1;

endmodule
