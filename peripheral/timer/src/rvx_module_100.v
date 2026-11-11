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
`include "rvx_include_13.vh"




module RVX_MODULE_100
(
	rvx_port_00,
	rvx_port_15,

	rvx_port_18,
	rvx_port_17,
	rvx_port_14,
	rvx_port_04,
	rvx_port_13,
	rvx_port_01,
	rvx_port_11,
	rvx_port_08,

	rvx_port_16,
	rvx_port_07,
	rvx_port_12,
	rvx_port_03,
	rvx_port_06,
	rvx_port_05,
	rvx_port_09,
	rvx_port_02,
	rvx_port_10
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_00, rvx_port_15;
input wire rvx_port_18;
input wire rvx_port_17;
input wire [RVX_GPARA_2-1:0] rvx_port_14;
input wire rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_01;
output reg rvx_port_11;
output reg rvx_port_08;

input wire rvx_port_16;

output wire rvx_port_07;
input wire [5-1:0] rvx_port_12;
output wire rvx_port_03;
output wire [5-1:0] rvx_port_06;

output wire [32-1:0] rvx_port_05;

output wire rvx_port_09;

output wire [32-1:0] rvx_port_02;

output wire [32-1:0] rvx_port_10;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_13;
reg [RVX_GPARA_1-1:0] rvx_signal_33;
wire rvx_signal_32;
wire rvx_signal_10;
wire rvx_signal_05;

wire [`RVX_GDEF_147-1:0] paddr_offset = rvx_port_14;
wire [`RVX_GDEF_147-1:0] rvx_signal_03;
wire [RVX_GPARA_2-1:0] rvx_signal_29;
wire [`RVX_GDEF_009-1:0] rvx_signal_21;
wire [`RVX_GDEF_009-1:0] addr_unused = 0;
reg rvx_signal_28;
wire [5-1:0] rvx_signal_22;
reg rvx_signal_04;
wire [5-1:0] rvx_signal_06;
wire rvx_signal_17;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_23;
wire rvx_signal_26;
reg [32-1:0] rvx_signal_15;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_24;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_30;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_01;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_12;
wire rvx_signal_07;
reg [32-1:0] rvx_signal_14;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_34;
wire rvx_signal_19;
reg [32-1:0] rvx_signal_35;

assign rvx_signal_13 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_13);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_33);
assign {rvx_signal_29,rvx_signal_21} = paddr_offset;
assign rvx_signal_03 = {rvx_signal_29,addr_unused};
assign rvx_signal_05 = (rvx_signal_21==0);
assign rvx_signal_32 = rvx_port_18 & rvx_port_17 & rvx_signal_05 & (~rvx_port_04);
assign rvx_signal_10 = rvx_port_18 & rvx_port_17 & rvx_signal_05 & rvx_port_04;

assign rvx_signal_06 = $unsigned(rvx_port_13);
assign rvx_signal_23 = $unsigned(rvx_port_13);
assign rvx_signal_27 = $unsigned(rvx_port_13);
assign rvx_signal_12 = $unsigned(rvx_port_13);
assign rvx_signal_34 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_08 = 0;
	rvx_signal_33 = 0;
	rvx_port_11 = 1;

	rvx_signal_28 = 0;
	rvx_signal_04 = 0;

	rvx_signal_31 = 0;
	rvx_signal_20 = 0;

	rvx_signal_02 = 0;
	rvx_signal_24 = 0;

	rvx_signal_36 = 0;
	rvx_signal_08 = 0;

	rvx_signal_09 = 0;
	rvx_signal_37 = 0;

	if(rvx_port_18==1'b 1)
	begin
		case(rvx_signal_03)
			`RVX_GDEF_370:
			begin
				rvx_signal_28 = rvx_signal_32;
				rvx_signal_04 = rvx_signal_10;
				rvx_signal_33 = $unsigned(rvx_signal_22);
				rvx_port_11 = rvx_signal_17;
			end
			`RVX_GDEF_571:
			begin
				rvx_signal_31 = rvx_signal_32;
				rvx_signal_20 = rvx_signal_10;
				rvx_signal_33 = $unsigned(rvx_signal_18);
				rvx_port_11 = rvx_signal_26;
			end
			`RVX_GDEF_192:
			begin
				rvx_signal_02 = rvx_signal_32;
				rvx_signal_24 = rvx_signal_10;
				rvx_signal_33 = $unsigned(rvx_signal_00);
				rvx_port_11 = rvx_signal_30;
			end
			`RVX_GDEF_589:
			begin
				rvx_signal_36 = rvx_signal_32;
				rvx_signal_08 = rvx_signal_10;
				rvx_signal_33 = $unsigned(rvx_signal_01);
				rvx_port_11 = rvx_signal_07;
			end
			`RVX_GDEF_049:
			begin
				rvx_signal_09 = rvx_signal_32;
				rvx_signal_37 = rvx_signal_10;
				rvx_signal_33 = $unsigned(rvx_signal_25);
				rvx_port_11 = rvx_signal_19;
			end
			default:
				rvx_port_08 = 1;
		endcase
	end
end

always@(posedge rvx_port_00, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_15 <= `RVX_GDEF_100;
	else if (rvx_signal_20==1'b 1)
		rvx_signal_15 <= rvx_signal_23;
end
assign rvx_signal_18 = rvx_signal_15;
always@(posedge rvx_port_00, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_14 <= `RVX_GDEF_167;
	else if (rvx_signal_08==1'b 1)
		rvx_signal_14 <= rvx_signal_12;
end
assign rvx_signal_01 = rvx_signal_14;
always@(posedge rvx_port_00, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_35 <= `RVX_GDEF_287;
	else if (rvx_signal_37==1'b 1)
		rvx_signal_35 <= rvx_signal_34;
end
assign rvx_signal_25 = rvx_signal_35;
assign rvx_port_07 = rvx_signal_28;
assign rvx_signal_22 = rvx_port_12;
assign rvx_port_03 = rvx_signal_04;
assign rvx_port_06 = rvx_signal_06;
assign rvx_signal_17 = 1;
assign rvx_port_05 = rvx_signal_15;
assign rvx_signal_26 = 1;
assign rvx_port_09 = rvx_signal_24;
assign rvx_signal_00 = 0;
assign rvx_signal_30 = 1;
assign rvx_port_02 = rvx_signal_14;
assign rvx_signal_07 = 1;
assign rvx_port_10 = rvx_signal_35;
assign rvx_signal_19 = 1;

endmodule
