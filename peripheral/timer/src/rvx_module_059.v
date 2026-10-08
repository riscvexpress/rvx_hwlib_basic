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
`include "rvx_include_06.vh"




module RVX_MODULE_059
(
	rvx_port_12,
	rvx_port_10,

	rvx_port_02,
	rvx_port_18,
	rvx_port_06,
	rvx_port_14,
	rvx_port_00,
	rvx_port_07,
	rvx_port_08,
	rvx_port_13,

	rvx_port_04,
	rvx_port_01,
	rvx_port_16,
	rvx_port_15,
	rvx_port_03,
	rvx_port_09,
	rvx_port_17,
	rvx_port_05,
	rvx_port_11
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_12, rvx_port_10;
input wire rvx_port_02;
input wire rvx_port_18;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
input wire rvx_port_14;
input wire [RVX_GPARA_1-1:0] rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_07;
output reg rvx_port_08;
output reg rvx_port_13;

input wire rvx_port_04;

output wire rvx_port_01;
input wire [5-1:0] rvx_port_16;
output wire rvx_port_15;
output wire [5-1:0] rvx_port_03;

output wire [32-1:0] rvx_port_09;

output wire rvx_port_17;

output wire [32-1:0] rvx_port_05;

output wire [32-1:0] rvx_port_11;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_24;
reg [RVX_GPARA_1-1:0] rvx_signal_26;
wire rvx_signal_01;
wire rvx_signal_12;
wire rvx_signal_16;

wire [`RVX_GDEF_452-1:0] paddr_offset = rvx_port_06;
wire [`RVX_GDEF_452-1:0] rvx_signal_37;
wire [RVX_GPARA_0-1:0] rvx_signal_28;
wire [`RVX_GDEF_103-1:0] rvx_signal_21;
wire [`RVX_GDEF_103-1:0] addr_unused = 0;
reg rvx_signal_10;
wire [5-1:0] rvx_signal_07;
reg rvx_signal_13;
wire [5-1:0] rvx_signal_06;
wire rvx_signal_19;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_33;
wire rvx_signal_00;
reg [32-1:0] rvx_signal_27;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_22;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_25;
wire rvx_signal_15;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_23;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_18;
wire rvx_signal_31;
reg [32-1:0] rvx_signal_20;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_32;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_14;
wire rvx_signal_09;
reg [32-1:0] rvx_signal_35;

assign rvx_signal_24 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_00);
assign rvx_port_07 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_26);
assign {rvx_signal_28,rvx_signal_21} = paddr_offset;
assign rvx_signal_37 = {rvx_signal_28,addr_unused};
assign rvx_signal_16 = (rvx_signal_21==0);
assign rvx_signal_01 = rvx_port_02 & rvx_port_18 & rvx_signal_16 & (~rvx_port_14);
assign rvx_signal_12 = rvx_port_02 & rvx_port_18 & rvx_signal_16 & rvx_port_14;

assign rvx_signal_06 = $unsigned(rvx_port_00);
assign rvx_signal_33 = $unsigned(rvx_port_00);
assign rvx_signal_25 = $unsigned(rvx_port_00);
assign rvx_signal_18 = $unsigned(rvx_port_00);
assign rvx_signal_14 = $unsigned(rvx_port_00);

always@(*)
begin
	rvx_port_13 = 0;
	rvx_signal_26 = 0;
	rvx_port_08 = 1;

	rvx_signal_10 = 0;
	rvx_signal_13 = 0;

	rvx_signal_34 = 0;
	rvx_signal_04 = 0;

	rvx_signal_30 = 0;
	rvx_signal_08 = 0;

	rvx_signal_05 = 0;
	rvx_signal_36 = 0;

	rvx_signal_03 = 0;
	rvx_signal_17 = 0;

	if(rvx_port_02==1'b 1)
	begin
		case(rvx_signal_37)
			`RVX_GDEF_598:
			begin
				rvx_signal_10 = rvx_signal_01;
				rvx_signal_13 = rvx_signal_12;
				rvx_signal_26 = $unsigned(rvx_signal_07);
				rvx_port_08 = rvx_signal_19;
			end
			`RVX_GDEF_418:
			begin
				rvx_signal_34 = rvx_signal_01;
				rvx_signal_04 = rvx_signal_12;
				rvx_signal_26 = $unsigned(rvx_signal_29);
				rvx_port_08 = rvx_signal_00;
			end
			`RVX_GDEF_036:
			begin
				rvx_signal_30 = rvx_signal_01;
				rvx_signal_08 = rvx_signal_12;
				rvx_signal_26 = $unsigned(rvx_signal_22);
				rvx_port_08 = rvx_signal_15;
			end
			`RVX_GDEF_568:
			begin
				rvx_signal_05 = rvx_signal_01;
				rvx_signal_36 = rvx_signal_12;
				rvx_signal_26 = $unsigned(rvx_signal_23);
				rvx_port_08 = rvx_signal_31;
			end
			`RVX_GDEF_679:
			begin
				rvx_signal_03 = rvx_signal_01;
				rvx_signal_17 = rvx_signal_12;
				rvx_signal_26 = $unsigned(rvx_signal_32);
				rvx_port_08 = rvx_signal_09;
			end
			default:
				rvx_port_13 = 1;
		endcase
	end
end

always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_27 <= `RVX_GDEF_109;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_27 <= rvx_signal_33;
end
assign rvx_signal_29 = rvx_signal_27;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_20 <= `RVX_GDEF_684;
	else if (rvx_signal_36==1'b 1)
		rvx_signal_20 <= rvx_signal_18;
end
assign rvx_signal_23 = rvx_signal_20;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_35 <= `RVX_GDEF_650;
	else if (rvx_signal_17==1'b 1)
		rvx_signal_35 <= rvx_signal_14;
end
assign rvx_signal_32 = rvx_signal_35;
assign rvx_port_01 = rvx_signal_10;
assign rvx_signal_07 = rvx_port_16;
assign rvx_port_15 = rvx_signal_13;
assign rvx_port_03 = rvx_signal_06;
assign rvx_signal_19 = 1;
assign rvx_port_09 = rvx_signal_27;
assign rvx_signal_00 = 1;
assign rvx_port_17 = rvx_signal_08;
assign rvx_signal_22 = 0;
assign rvx_signal_15 = 1;
assign rvx_port_05 = rvx_signal_20;
assign rvx_signal_31 = 1;
assign rvx_port_11 = rvx_signal_35;
assign rvx_signal_09 = 1;

endmodule
