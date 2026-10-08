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
`include "rvx_include_07.vh"




module RVX_MODULE_009
(
	rvx_port_10,
	rvx_port_03,

	rvx_port_13,
	rvx_port_19,
	rvx_port_08,
	rvx_port_18,
	rvx_port_14,
	rvx_port_12,
	rvx_port_11,
	rvx_port_05,

	rvx_port_06,
	rvx_port_16,
	rvx_port_01,
	rvx_port_07,
	rvx_port_17,
	rvx_port_15,
	rvx_port_20,
	rvx_port_02,
	rvx_port_00,
	rvx_port_04,
	rvx_port_09
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_10, rvx_port_03;
input wire rvx_port_13;
input wire rvx_port_19;
input wire [RVX_GPARA_1-1:0] rvx_port_08;
input wire rvx_port_18;
input wire [RVX_GPARA_2-1:0] rvx_port_14;
output wire [RVX_GPARA_2-1:0] rvx_port_12;
output reg rvx_port_11;
output reg rvx_port_05;

input wire rvx_port_06;

output wire rvx_port_16;
input wire [32-1:0] rvx_port_01;
output wire rvx_port_07;
output wire [32-1:0] rvx_port_17;

output wire [32-1:0] rvx_port_15;

output wire [32-1:0] rvx_port_20;

output wire rvx_port_02;
input wire [32-1:0] rvx_port_00;

output wire rvx_port_04;
input wire [32-1:0] rvx_port_09;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_11;
reg [RVX_GPARA_2-1:0] rvx_signal_08;
wire rvx_signal_16;
wire rvx_signal_27;
wire rvx_signal_22;

wire [`RVX_GDEF_088-1:0] paddr_offset = rvx_port_08;
wire [`RVX_GDEF_088-1:0] rvx_signal_10;
wire [RVX_GPARA_1-1:0] rvx_signal_00;
wire [`RVX_GDEF_197-1:0] rvx_signal_26;
wire [`RVX_GDEF_197-1:0] addr_unused = 0;
reg rvx_signal_25;
wire [32-1:0] rvx_signal_32;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_12;
wire rvx_signal_17;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_36;
reg rvx_signal_23;
wire [32-1:0] rvx_signal_35;
wire rvx_signal_20;
reg [32-1:0] rvx_signal_18;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_15;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_09;
wire rvx_signal_33;
reg [32-1:0] rvx_signal_01;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_06;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_14;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_24;
wire [32-1:0] rvx_signal_02;
wire rvx_signal_07;

assign rvx_signal_11 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_14);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_08);
assign {rvx_signal_00,rvx_signal_26} = paddr_offset;
assign rvx_signal_10 = {rvx_signal_00,addr_unused};
assign rvx_signal_22 = (rvx_signal_26==0);
assign rvx_signal_16 = rvx_port_13 & rvx_port_19 & rvx_signal_22 & (~rvx_port_18);
assign rvx_signal_27 = rvx_port_13 & rvx_port_19 & rvx_signal_22 & rvx_port_18;

assign rvx_signal_12 = $unsigned(rvx_port_14);
assign rvx_signal_35 = $unsigned(rvx_port_14);
assign rvx_signal_09 = $unsigned(rvx_port_14);
assign rvx_signal_28 = $unsigned(rvx_port_14);
assign rvx_signal_02 = $unsigned(rvx_port_14);

always@(*)
begin
	rvx_port_05 = 0;
	rvx_signal_08 = 0;
	rvx_port_11 = 1;

	rvx_signal_25 = 0;
	rvx_signal_34 = 0;

	rvx_signal_05 = 0;
	rvx_signal_23 = 0;

	rvx_signal_19 = 0;
	rvx_signal_31 = 0;

	rvx_signal_03 = 0;
	rvx_signal_13 = 0;

	rvx_signal_30 = 0;
	rvx_signal_24 = 0;

	if(rvx_port_13==1'b 1)
	begin
		case(rvx_signal_10)
			`RVX_GDEF_131:
			begin
				rvx_signal_25 = rvx_signal_16;
				rvx_signal_34 = rvx_signal_27;
				rvx_signal_08 = $unsigned(rvx_signal_32);
				rvx_port_11 = rvx_signal_17;
			end
			`RVX_GDEF_214:
			begin
				rvx_signal_05 = rvx_signal_16;
				rvx_signal_23 = rvx_signal_27;
				rvx_signal_08 = $unsigned(rvx_signal_36);
				rvx_port_11 = rvx_signal_20;
			end
			`RVX_GDEF_106:
			begin
				rvx_signal_19 = rvx_signal_16;
				rvx_signal_31 = rvx_signal_27;
				rvx_signal_08 = $unsigned(rvx_signal_15);
				rvx_port_11 = rvx_signal_33;
			end
			`RVX_GDEF_260:
			begin
				rvx_signal_03 = rvx_signal_16;
				rvx_signal_13 = rvx_signal_27;
				rvx_signal_08 = $unsigned(rvx_signal_06);
				rvx_port_11 = rvx_signal_14;
			end
			`RVX_GDEF_577:
			begin
				rvx_signal_30 = rvx_signal_16;
				rvx_signal_24 = rvx_signal_27;
				rvx_signal_08 = $unsigned(rvx_signal_29);
				rvx_port_11 = rvx_signal_07;
			end
			default:
				rvx_port_05 = 1;
		endcase
	end
end

always@(posedge rvx_port_10, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_18 <= `RVX_GDEF_309;
	else if (rvx_signal_23==1'b 1)
		rvx_signal_18 <= rvx_signal_35;
end
assign rvx_signal_36 = rvx_signal_18;
always@(posedge rvx_port_10, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_01 <= `RVX_GDEF_688;
	else if (rvx_signal_31==1'b 1)
		rvx_signal_01 <= rvx_signal_09;
end
assign rvx_signal_15 = rvx_signal_01;
assign rvx_port_16 = rvx_signal_25;
assign rvx_signal_32 = rvx_port_01;
assign rvx_port_07 = rvx_signal_34;
assign rvx_port_17 = rvx_signal_12;
assign rvx_signal_17 = 1;
assign rvx_port_15 = rvx_signal_18;
assign rvx_signal_20 = 1;
assign rvx_port_20 = rvx_signal_01;
assign rvx_signal_33 = 1;
assign rvx_port_02 = rvx_signal_03;
assign rvx_signal_06 = rvx_port_00;
assign rvx_signal_14 = 1;
assign rvx_port_04 = rvx_signal_30;
assign rvx_signal_29 = rvx_port_09;
assign rvx_signal_07 = 1;

endmodule
