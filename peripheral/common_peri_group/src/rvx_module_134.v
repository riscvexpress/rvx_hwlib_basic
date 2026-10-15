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
`include "rvx_include_01.vh"




module RVX_MODULE_134
(
	rvx_port_01,
	rvx_port_24,

	rvx_port_15,
	rvx_port_20,
	rvx_port_02,
	rvx_port_10,
	rvx_port_16,
	rvx_port_04,
	rvx_port_21,
	rvx_port_23,

	rvx_port_00,
	rvx_port_18,
	rvx_port_14,
	rvx_port_07,
	rvx_port_19,
	rvx_port_13,
	rvx_port_09,
	rvx_port_12,
	rvx_port_08,
	rvx_port_22,
	rvx_port_17,
	rvx_port_11,
	rvx_port_05,
	rvx_port_06,
	rvx_port_03
);




parameter RVX_GPARA_4 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_01, rvx_port_24;
input wire rvx_port_15;
input wire rvx_port_20;
input wire [RVX_GPARA_4-1:0] rvx_port_02;
input wire rvx_port_10;
input wire [RVX_GPARA_1-1:0] rvx_port_16;
output wire [RVX_GPARA_1-1:0] rvx_port_04;
output reg rvx_port_21;
output reg rvx_port_23;

parameter RVX_GPARA_2 = 0;
parameter RVX_GPARA_3 = 0;

input wire rvx_port_00;

output wire rvx_port_18;
input wire [`RVX_GDEF_187-1:0] rvx_port_14;
output wire rvx_port_07;
output wire [`RVX_GDEF_187-1:0] rvx_port_19;

output wire [`RVX_GDEF_524-1:0] rvx_port_13;

output wire [`RVX_GDEF_576-1:0] rvx_port_09;

output wire rvx_port_12;
input wire [`RVX_GDEF_482-1:0] rvx_port_08;
output wire rvx_port_22;
output wire [`RVX_GDEF_482-1:0] rvx_port_17;

output wire rvx_port_11;
input wire [`RVX_GDEF_336-1:0] rvx_port_05;
output wire rvx_port_06;
output wire [`RVX_GDEF_336-1:0] rvx_port_03;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_27;
reg [RVX_GPARA_1-1:0] rvx_signal_06;
wire rvx_signal_16;
wire rvx_signal_26;
wire rvx_signal_09;

wire [`RVX_GDEF_230-1:0] paddr_offset = rvx_port_02;
wire [`RVX_GDEF_230-1:0] rvx_signal_32;
wire [RVX_GPARA_4-1:0] rvx_signal_31;
wire [`RVX_GDEF_442-1:0] rvx_signal_00;
wire [`RVX_GDEF_442-1:0] addr_unused = 0;
reg rvx_signal_25;
wire [RVX_GPARA_1-1:0] rvx_signal_11;
reg rvx_signal_12;
wire [RVX_GPARA_1-1:0] rvx_signal_19;
wire rvx_signal_05;
reg rvx_signal_15;
wire [RVX_GPARA_1-1:0] rvx_signal_07;
reg rvx_signal_34;
wire [RVX_GPARA_1-1:0] rvx_signal_30;
wire rvx_signal_01;
reg [11-1:0] rvx_signal_33;
reg rvx_signal_29;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
reg rvx_signal_08;
wire [RVX_GPARA_1-1:0] rvx_signal_10;
wire rvx_signal_13;
reg [11-1:0] rvx_signal_35;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_17;
reg rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_02;
wire rvx_signal_20;
reg rvx_signal_24;
wire [RVX_GPARA_1-1:0] rvx_signal_23;
reg rvx_signal_22;
wire [RVX_GPARA_1-1:0] rvx_signal_14;
wire rvx_signal_03;

assign rvx_signal_27 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_16);
assign rvx_port_04 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_06);
assign {rvx_signal_31,rvx_signal_00} = paddr_offset;
assign rvx_signal_32 = {rvx_signal_31,addr_unused};
assign rvx_signal_09 = (rvx_signal_00==0);
assign rvx_signal_16 = rvx_port_15 & rvx_port_20 & rvx_signal_09 & (~rvx_port_10);
assign rvx_signal_26 = rvx_port_15 & rvx_port_20 & rvx_signal_09 & rvx_port_10;

assign rvx_signal_19 = $unsigned(rvx_port_16);
assign rvx_signal_30 = $unsigned(rvx_port_16);
assign rvx_signal_10 = $unsigned(rvx_port_16);
assign rvx_signal_02 = $unsigned(rvx_port_16);
assign rvx_signal_14 = $unsigned(rvx_port_16);

always@(*)
begin
	rvx_port_23 = 0;
	rvx_signal_06 = 0;
	rvx_port_21 = 1;

	rvx_signal_25 = 0;
	rvx_signal_12 = 0;

	rvx_signal_15 = 0;
	rvx_signal_34 = 0;

	rvx_signal_29 = 0;
	rvx_signal_08 = 0;

	rvx_signal_28 = 0;
	rvx_signal_21 = 0;

	rvx_signal_24 = 0;
	rvx_signal_22 = 0;

	if(rvx_port_15==1'b 1)
	begin
		case(rvx_signal_32)
			`RVX_GDEF_550:
			begin
				rvx_signal_25 = rvx_signal_16;
				rvx_signal_12 = rvx_signal_26;
				rvx_signal_06 = $unsigned(rvx_signal_11);
				rvx_port_21 = rvx_signal_05;
			end
			`RVX_GDEF_182:
			begin
				rvx_signal_15 = rvx_signal_16;
				rvx_signal_34 = rvx_signal_26;
				rvx_signal_06 = $unsigned(rvx_signal_07);
				rvx_port_21 = rvx_signal_01;
			end
			`RVX_GDEF_385:
			begin
				rvx_signal_29 = rvx_signal_16;
				rvx_signal_08 = rvx_signal_26;
				rvx_signal_06 = $unsigned(rvx_signal_36);
				rvx_port_21 = rvx_signal_13;
			end
			`RVX_GDEF_279:
			begin
				rvx_signal_28 = rvx_signal_16;
				rvx_signal_21 = rvx_signal_26;
				rvx_signal_06 = $unsigned(rvx_signal_17);
				rvx_port_21 = rvx_signal_20;
			end
			`RVX_GDEF_081:
			begin
				rvx_signal_24 = rvx_signal_16;
				rvx_signal_22 = rvx_signal_26;
				rvx_signal_06 = $unsigned(rvx_signal_23);
				rvx_port_21 = rvx_signal_03;
			end
			default:
				rvx_port_23 = 1;
		endcase
	end
end

always@(posedge rvx_port_01, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_33 <= RVX_GPARA_2;
	else if (rvx_signal_34==1'b 1)
		rvx_signal_33 <= rvx_signal_30;
end
assign rvx_signal_07 = rvx_signal_33;
always@(posedge rvx_port_01, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_35 <= RVX_GPARA_3;
	else if (rvx_signal_08==1'b 1)
		rvx_signal_35 <= rvx_signal_10;
end
assign rvx_signal_36 = rvx_signal_35;
assign rvx_port_18 = rvx_signal_25;
assign rvx_signal_11 = rvx_port_14;
assign rvx_port_07 = rvx_signal_12;
assign rvx_port_19 = rvx_signal_19;
assign rvx_signal_05 = 1;
assign rvx_port_13 = rvx_signal_33;
assign rvx_signal_01 = 1;
assign rvx_port_09 = rvx_signal_35;
assign rvx_signal_13 = 1;
assign rvx_port_12 = rvx_signal_28;
assign rvx_signal_17 = rvx_port_08;
assign rvx_port_22 = rvx_signal_21;
assign rvx_port_17 = rvx_signal_02;
assign rvx_signal_20 = 1;
assign rvx_port_11 = rvx_signal_24;
assign rvx_signal_23 = rvx_port_05;
assign rvx_port_06 = rvx_signal_22;
assign rvx_port_03 = rvx_signal_14;
assign rvx_signal_03 = 1;

endmodule
