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
`include "rvx_include_13.vh"




module RVX_MODULE_099
(
	rvx_port_24,
	rvx_port_06,

	rvx_port_08,
	rvx_port_21,
	rvx_port_03,
	rvx_port_22,
	rvx_port_01,
	rvx_port_18,
	rvx_port_16,
	rvx_port_13,

	rvx_port_12,
	rvx_port_17,
	rvx_port_14,
	rvx_port_10,
	rvx_port_04,
	rvx_port_23,
	rvx_port_20,
	rvx_port_15,
	rvx_port_07,
	rvx_port_11,
	rvx_port_02,
	rvx_port_19,
	rvx_port_00,
	rvx_port_05,
	rvx_port_09
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_24, rvx_port_06;
input wire rvx_port_08;
input wire rvx_port_21;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
input wire rvx_port_22;
input wire [RVX_GPARA_1-1:0] rvx_port_01;
output wire [RVX_GPARA_1-1:0] rvx_port_18;
output reg rvx_port_16;
output reg rvx_port_13;

parameter RVX_GPARA_4 = 0;
parameter RVX_GPARA_3 = 0;

input wire rvx_port_12;

output wire rvx_port_17;
input wire [`RVX_GDEF_093-1:0] rvx_port_14;
output wire rvx_port_10;
output wire [`RVX_GDEF_093-1:0] rvx_port_04;

output wire [`RVX_GDEF_432-1:0] rvx_port_23;

output wire [`RVX_GDEF_515-1:0] rvx_port_20;

output wire rvx_port_15;
input wire [`RVX_GDEF_387-1:0] rvx_port_07;
output wire rvx_port_11;
output wire [`RVX_GDEF_387-1:0] rvx_port_02;

output wire rvx_port_19;
input wire [`RVX_GDEF_080-1:0] rvx_port_00;
output wire rvx_port_05;
output wire [`RVX_GDEF_080-1:0] rvx_port_09;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_27;
reg [RVX_GPARA_1-1:0] rvx_signal_04;
wire rvx_signal_21;
wire rvx_signal_20;
wire rvx_signal_12;

wire [`RVX_GDEF_571-1:0] paddr_offset = rvx_port_03;
wire [`RVX_GDEF_571-1:0] rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_13;
wire [`RVX_GDEF_220-1:0] rvx_signal_25;
wire [`RVX_GDEF_220-1:0] addr_unused = 0;
reg rvx_signal_19;
wire [RVX_GPARA_1-1:0] rvx_signal_05;
reg rvx_signal_06;
wire [RVX_GPARA_1-1:0] rvx_signal_00;
wire rvx_signal_33;
reg rvx_signal_24;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
reg rvx_signal_26;
wire [RVX_GPARA_1-1:0] rvx_signal_07;
wire rvx_signal_08;
reg [11-1:0] rvx_signal_30;
reg rvx_signal_01;
wire [RVX_GPARA_1-1:0] rvx_signal_32;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_10;
wire rvx_signal_18;
reg [11-1:0] rvx_signal_29;
reg rvx_signal_23;
wire [RVX_GPARA_1-1:0] rvx_signal_09;
reg rvx_signal_02;
wire [RVX_GPARA_1-1:0] rvx_signal_11;
wire rvx_signal_15;
reg rvx_signal_35;
wire [RVX_GPARA_1-1:0] rvx_signal_16;
reg rvx_signal_34;
wire [RVX_GPARA_1-1:0] rvx_signal_31;
wire rvx_signal_22;

assign rvx_signal_27 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_01);
assign rvx_port_18 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_04);
assign {rvx_signal_13,rvx_signal_25} = paddr_offset;
assign rvx_signal_17 = {rvx_signal_13,addr_unused};
assign rvx_signal_12 = (rvx_signal_25==0);
assign rvx_signal_21 = rvx_port_08 & rvx_port_21 & rvx_signal_12 & (~rvx_port_22);
assign rvx_signal_20 = rvx_port_08 & rvx_port_21 & rvx_signal_12 & rvx_port_22;

assign rvx_signal_00 = $unsigned(rvx_port_01);
assign rvx_signal_07 = $unsigned(rvx_port_01);
assign rvx_signal_10 = $unsigned(rvx_port_01);
assign rvx_signal_11 = $unsigned(rvx_port_01);
assign rvx_signal_31 = $unsigned(rvx_port_01);

always@(*)
begin
	rvx_port_13 = 0;
	rvx_signal_04 = 0;
	rvx_port_16 = 1;

	rvx_signal_19 = 0;
	rvx_signal_06 = 0;

	rvx_signal_24 = 0;
	rvx_signal_26 = 0;

	rvx_signal_01 = 0;
	rvx_signal_28 = 0;

	rvx_signal_23 = 0;
	rvx_signal_02 = 0;

	rvx_signal_35 = 0;
	rvx_signal_34 = 0;

	if(rvx_port_08==1'b 1)
	begin
		case(rvx_signal_17)
			`RVX_GDEF_615:
			begin
				rvx_signal_19 = rvx_signal_21;
				rvx_signal_06 = rvx_signal_20;
				rvx_signal_04 = $unsigned(rvx_signal_05);
				rvx_port_16 = rvx_signal_33;
			end
			`RVX_GDEF_400:
			begin
				rvx_signal_24 = rvx_signal_21;
				rvx_signal_26 = rvx_signal_20;
				rvx_signal_04 = $unsigned(rvx_signal_36);
				rvx_port_16 = rvx_signal_08;
			end
			`RVX_GDEF_045:
			begin
				rvx_signal_01 = rvx_signal_21;
				rvx_signal_28 = rvx_signal_20;
				rvx_signal_04 = $unsigned(rvx_signal_32);
				rvx_port_16 = rvx_signal_18;
			end
			`RVX_GDEF_687:
			begin
				rvx_signal_23 = rvx_signal_21;
				rvx_signal_02 = rvx_signal_20;
				rvx_signal_04 = $unsigned(rvx_signal_09);
				rvx_port_16 = rvx_signal_15;
			end
			`RVX_GDEF_314:
			begin
				rvx_signal_35 = rvx_signal_21;
				rvx_signal_34 = rvx_signal_20;
				rvx_signal_04 = $unsigned(rvx_signal_16);
				rvx_port_16 = rvx_signal_22;
			end
			default:
				rvx_port_13 = 1;
		endcase
	end
end

always@(posedge rvx_port_24, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_30 <= RVX_GPARA_4;
	else if (rvx_signal_26==1'b 1)
		rvx_signal_30 <= rvx_signal_07;
end
assign rvx_signal_36 = rvx_signal_30;
always@(posedge rvx_port_24, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_29 <= RVX_GPARA_3;
	else if (rvx_signal_28==1'b 1)
		rvx_signal_29 <= rvx_signal_10;
end
assign rvx_signal_32 = rvx_signal_29;
assign rvx_port_17 = rvx_signal_19;
assign rvx_signal_05 = rvx_port_14;
assign rvx_port_10 = rvx_signal_06;
assign rvx_port_04 = rvx_signal_00;
assign rvx_signal_33 = 1;
assign rvx_port_23 = rvx_signal_30;
assign rvx_signal_08 = 1;
assign rvx_port_20 = rvx_signal_29;
assign rvx_signal_18 = 1;
assign rvx_port_15 = rvx_signal_23;
assign rvx_signal_09 = rvx_port_07;
assign rvx_port_11 = rvx_signal_02;
assign rvx_port_02 = rvx_signal_11;
assign rvx_signal_15 = 1;
assign rvx_port_19 = rvx_signal_35;
assign rvx_signal_16 = rvx_port_00;
assign rvx_port_05 = rvx_signal_34;
assign rvx_port_09 = rvx_signal_31;
assign rvx_signal_22 = 1;

endmodule
