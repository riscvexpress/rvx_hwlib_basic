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
`include "rvx_include_00.vh"




module RVX_MODULE_135
(
	rvx_port_13,
	rvx_port_07,

	rvx_port_08,
	rvx_port_06,
	rvx_port_18,
	rvx_port_12,
	rvx_port_10,
	rvx_port_04,
	rvx_port_03,
	rvx_port_11,

	rvx_port_14,
	rvx_port_00,
	rvx_port_01,
	rvx_port_15,
	rvx_port_02,
	rvx_port_17,
	rvx_port_05,
	rvx_port_16,
	rvx_port_09
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_13, rvx_port_07;
input wire rvx_port_08;
input wire rvx_port_06;
input wire [RVX_GPARA_2-1:0] rvx_port_18;
input wire rvx_port_12;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
output wire [RVX_GPARA_0-1:0] rvx_port_04;
output reg rvx_port_03;
output reg rvx_port_11;

input wire rvx_port_14;

output wire rvx_port_00;
input wire [5-1:0] rvx_port_01;
output wire rvx_port_15;
output wire [5-1:0] rvx_port_02;

output wire [32-1:0] rvx_port_17;

output wire rvx_port_05;

output wire [32-1:0] rvx_port_16;

output wire [32-1:0] rvx_port_09;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_03;
reg [RVX_GPARA_0-1:0] rvx_signal_19;
wire rvx_signal_25;
wire rvx_signal_29;
wire rvx_signal_36;

wire [`RVX_GDEF_370-1:0] paddr_offset = rvx_port_18;
wire [`RVX_GDEF_370-1:0] rvx_signal_02;
wire [RVX_GPARA_2-1:0] rvx_signal_13;
wire [`RVX_GDEF_609-1:0] rvx_signal_15;
wire [`RVX_GDEF_609-1:0] addr_unused = 0;
reg rvx_signal_14;
wire [5-1:0] rvx_signal_22;
reg rvx_signal_30;
wire [5-1:0] rvx_signal_27;
wire rvx_signal_01;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_37;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_23;
wire rvx_signal_26;
reg [32-1:0] rvx_signal_09;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_21;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_16;
wire rvx_signal_35;
reg rvx_signal_12;
wire [32-1:0] rvx_signal_05;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_11;
reg [32-1:0] rvx_signal_34;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_06;
reg rvx_signal_33;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_28;
reg [32-1:0] rvx_signal_17;

assign rvx_signal_03 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_10);
assign rvx_port_04 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_19);
assign {rvx_signal_13,rvx_signal_15} = paddr_offset;
assign rvx_signal_02 = {rvx_signal_13,addr_unused};
assign rvx_signal_36 = (rvx_signal_15==0);
assign rvx_signal_25 = rvx_port_08 & rvx_port_06 & rvx_signal_36 & (~rvx_port_12);
assign rvx_signal_29 = rvx_port_08 & rvx_port_06 & rvx_signal_36 & rvx_port_12;

assign rvx_signal_27 = $unsigned(rvx_port_10);
assign rvx_signal_23 = $unsigned(rvx_port_10);
assign rvx_signal_16 = $unsigned(rvx_port_10);
assign rvx_signal_24 = $unsigned(rvx_port_10);
assign rvx_signal_08 = $unsigned(rvx_port_10);

always@(*)
begin
	rvx_port_11 = 0;
	rvx_signal_19 = 0;
	rvx_port_03 = 1;

	rvx_signal_14 = 0;
	rvx_signal_30 = 0;

	rvx_signal_32 = 0;
	rvx_signal_04 = 0;

	rvx_signal_31 = 0;
	rvx_signal_00 = 0;

	rvx_signal_12 = 0;
	rvx_signal_20 = 0;

	rvx_signal_10 = 0;
	rvx_signal_33 = 0;

	if(rvx_port_08==1'b 1)
	begin
		case(rvx_signal_02)
			`RVX_GDEF_310:
			begin
				rvx_signal_14 = rvx_signal_25;
				rvx_signal_30 = rvx_signal_29;
				rvx_signal_19 = $unsigned(rvx_signal_22);
				rvx_port_03 = rvx_signal_01;
			end
			`RVX_GDEF_017:
			begin
				rvx_signal_32 = rvx_signal_25;
				rvx_signal_04 = rvx_signal_29;
				rvx_signal_19 = $unsigned(rvx_signal_37);
				rvx_port_03 = rvx_signal_26;
			end
			`RVX_GDEF_597:
			begin
				rvx_signal_31 = rvx_signal_25;
				rvx_signal_00 = rvx_signal_29;
				rvx_signal_19 = $unsigned(rvx_signal_21);
				rvx_port_03 = rvx_signal_35;
			end
			`RVX_GDEF_002:
			begin
				rvx_signal_12 = rvx_signal_25;
				rvx_signal_20 = rvx_signal_29;
				rvx_signal_19 = $unsigned(rvx_signal_05);
				rvx_port_03 = rvx_signal_11;
			end
			`RVX_GDEF_278:
			begin
				rvx_signal_10 = rvx_signal_25;
				rvx_signal_33 = rvx_signal_29;
				rvx_signal_19 = $unsigned(rvx_signal_06);
				rvx_port_03 = rvx_signal_28;
			end
			default:
				rvx_port_11 = 1;
		endcase
	end
end

always@(posedge rvx_port_13, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_09 <= `RVX_GDEF_000;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_09 <= rvx_signal_23;
end
assign rvx_signal_37 = rvx_signal_09;
always@(posedge rvx_port_13, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_34 <= `RVX_GDEF_005;
	else if (rvx_signal_20==1'b 1)
		rvx_signal_34 <= rvx_signal_24;
end
assign rvx_signal_05 = rvx_signal_34;
always@(posedge rvx_port_13, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_17 <= `RVX_GDEF_097;
	else if (rvx_signal_33==1'b 1)
		rvx_signal_17 <= rvx_signal_08;
end
assign rvx_signal_06 = rvx_signal_17;
assign rvx_port_00 = rvx_signal_14;
assign rvx_signal_22 = rvx_port_01;
assign rvx_port_15 = rvx_signal_30;
assign rvx_port_02 = rvx_signal_27;
assign rvx_signal_01 = 1;
assign rvx_port_17 = rvx_signal_09;
assign rvx_signal_26 = 1;
assign rvx_port_05 = rvx_signal_00;
assign rvx_signal_21 = 0;
assign rvx_signal_35 = 1;
assign rvx_port_16 = rvx_signal_34;
assign rvx_signal_11 = 1;
assign rvx_port_09 = rvx_signal_17;
assign rvx_signal_28 = 1;

endmodule
