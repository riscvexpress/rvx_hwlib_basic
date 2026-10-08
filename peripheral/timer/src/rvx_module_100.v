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
`include "rvx_include_17.vh"




module RVX_MODULE_100
(
	rvx_port_16,
	rvx_port_08,

	rvx_port_12,
	rvx_port_02,
	rvx_port_17,
	rvx_port_13,
	rvx_port_14,
	rvx_port_05,
	rvx_port_00,
	rvx_port_10,

	rvx_port_09,
	rvx_port_18,
	rvx_port_06,
	rvx_port_03,
	rvx_port_04,
	rvx_port_11,
	rvx_port_15,
	rvx_port_01,
	rvx_port_07
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_16, rvx_port_08;
input wire rvx_port_12;
input wire rvx_port_02;
input wire [RVX_GPARA_0-1:0] rvx_port_17;
input wire rvx_port_13;
input wire [RVX_GPARA_1-1:0] rvx_port_14;
output wire [RVX_GPARA_1-1:0] rvx_port_05;
output reg rvx_port_00;
output reg rvx_port_10;

input wire rvx_port_09;

output wire rvx_port_18;
input wire [5-1:0] rvx_port_06;
output wire rvx_port_03;
output wire [5-1:0] rvx_port_04;

output wire [32-1:0] rvx_port_11;

output wire rvx_port_15;

output wire [32-1:0] rvx_port_01;

output wire [32-1:0] rvx_port_07;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_36;
reg [RVX_GPARA_1-1:0] rvx_signal_11;
wire rvx_signal_14;
wire rvx_signal_20;
wire rvx_signal_07;

wire [`RVX_GDEF_031-1:0] paddr_offset = rvx_port_17;
wire [`RVX_GDEF_031-1:0] rvx_signal_29;
wire [RVX_GPARA_0-1:0] rvx_signal_02;
wire [`RVX_GDEF_507-1:0] rvx_signal_21;
wire [`RVX_GDEF_507-1:0] addr_unused = 0;
reg rvx_signal_22;
wire [5-1:0] rvx_signal_05;
reg rvx_signal_34;
wire [5-1:0] rvx_signal_13;
wire rvx_signal_01;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_26;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_19;
reg [32-1:0] rvx_signal_15;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_33;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_03;
wire rvx_signal_08;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_30;
reg rvx_signal_06;
wire [32-1:0] rvx_signal_35;
wire rvx_signal_23;
reg [32-1:0] rvx_signal_18;
reg rvx_signal_12;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_37;
reg [32-1:0] rvx_signal_17;

assign rvx_signal_36 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_14);
assign rvx_port_05 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_11);
assign {rvx_signal_02,rvx_signal_21} = paddr_offset;
assign rvx_signal_29 = {rvx_signal_02,addr_unused};
assign rvx_signal_07 = (rvx_signal_21==0);
assign rvx_signal_14 = rvx_port_12 & rvx_port_02 & rvx_signal_07 & (~rvx_port_13);
assign rvx_signal_20 = rvx_port_12 & rvx_port_02 & rvx_signal_07 & rvx_port_13;

assign rvx_signal_13 = $unsigned(rvx_port_14);
assign rvx_signal_27 = $unsigned(rvx_port_14);
assign rvx_signal_03 = $unsigned(rvx_port_14);
assign rvx_signal_35 = $unsigned(rvx_port_14);
assign rvx_signal_24 = $unsigned(rvx_port_14);

always@(*)
begin
	rvx_port_10 = 0;
	rvx_signal_11 = 0;
	rvx_port_00 = 1;

	rvx_signal_22 = 0;
	rvx_signal_34 = 0;

	rvx_signal_04 = 0;
	rvx_signal_31 = 0;

	rvx_signal_16 = 0;
	rvx_signal_10 = 0;

	rvx_signal_32 = 0;
	rvx_signal_06 = 0;

	rvx_signal_12 = 0;
	rvx_signal_09 = 0;

	if(rvx_port_12==1'b 1)
	begin
		case(rvx_signal_29)
			`RVX_GDEF_409:
			begin
				rvx_signal_22 = rvx_signal_14;
				rvx_signal_34 = rvx_signal_20;
				rvx_signal_11 = $unsigned(rvx_signal_05);
				rvx_port_00 = rvx_signal_01;
			end
			`RVX_GDEF_493:
			begin
				rvx_signal_04 = rvx_signal_14;
				rvx_signal_31 = rvx_signal_20;
				rvx_signal_11 = $unsigned(rvx_signal_26);
				rvx_port_00 = rvx_signal_19;
			end
			`RVX_GDEF_285:
			begin
				rvx_signal_16 = rvx_signal_14;
				rvx_signal_10 = rvx_signal_20;
				rvx_signal_11 = $unsigned(rvx_signal_33);
				rvx_port_00 = rvx_signal_08;
			end
			`RVX_GDEF_586:
			begin
				rvx_signal_32 = rvx_signal_14;
				rvx_signal_06 = rvx_signal_20;
				rvx_signal_11 = $unsigned(rvx_signal_30);
				rvx_port_00 = rvx_signal_23;
			end
			`RVX_GDEF_550:
			begin
				rvx_signal_12 = rvx_signal_14;
				rvx_signal_09 = rvx_signal_20;
				rvx_signal_11 = $unsigned(rvx_signal_25);
				rvx_port_00 = rvx_signal_37;
			end
			default:
				rvx_port_10 = 1;
		endcase
	end
end

always@(posedge rvx_port_16, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_15 <= `RVX_GDEF_213;
	else if (rvx_signal_31==1'b 1)
		rvx_signal_15 <= rvx_signal_27;
end
assign rvx_signal_26 = rvx_signal_15;
always@(posedge rvx_port_16, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_18 <= `RVX_GDEF_148;
	else if (rvx_signal_06==1'b 1)
		rvx_signal_18 <= rvx_signal_35;
end
assign rvx_signal_30 = rvx_signal_18;
always@(posedge rvx_port_16, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_17 <= `RVX_GDEF_475;
	else if (rvx_signal_09==1'b 1)
		rvx_signal_17 <= rvx_signal_24;
end
assign rvx_signal_25 = rvx_signal_17;
assign rvx_port_18 = rvx_signal_22;
assign rvx_signal_05 = rvx_port_06;
assign rvx_port_03 = rvx_signal_34;
assign rvx_port_04 = rvx_signal_13;
assign rvx_signal_01 = 1;
assign rvx_port_11 = rvx_signal_15;
assign rvx_signal_19 = 1;
assign rvx_port_15 = rvx_signal_10;
assign rvx_signal_33 = 0;
assign rvx_signal_08 = 1;
assign rvx_port_01 = rvx_signal_18;
assign rvx_signal_23 = 1;
assign rvx_port_07 = rvx_signal_17;
assign rvx_signal_37 = 1;

endmodule
