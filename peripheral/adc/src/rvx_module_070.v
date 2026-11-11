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
`include "rvx_include_22.vh"




module RVX_MODULE_070
(
	rvx_port_20,
	rvx_port_13,

	rvx_port_19,
	rvx_port_07,
	rvx_port_09,
	rvx_port_11,
	rvx_port_17,
	rvx_port_12,
	rvx_port_04,
	rvx_port_02,

	rvx_port_00,
	rvx_port_15,
	rvx_port_16,
	rvx_port_03,
	rvx_port_18,
	rvx_port_06,
	rvx_port_01,
	rvx_port_14,
	rvx_port_05,
	rvx_port_10,
	rvx_port_08
);




parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_20, rvx_port_13;
input wire rvx_port_19;
input wire rvx_port_07;
input wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire rvx_port_11;
input wire [RVX_GPARA_1-1:0] rvx_port_17;
output wire [RVX_GPARA_1-1:0] rvx_port_12;
output reg rvx_port_04;
output reg rvx_port_02;

input wire rvx_port_00;

output wire rvx_port_15;
input wire [32-1:0] rvx_port_16;
output wire rvx_port_03;
output wire [32-1:0] rvx_port_18;

output wire [32-1:0] rvx_port_06;

output wire [32-1:0] rvx_port_01;

output wire rvx_port_14;
input wire [32-1:0] rvx_port_05;

output wire rvx_port_10;
input wire [32-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_03;
reg [RVX_GPARA_1-1:0] rvx_signal_09;
wire rvx_signal_15;
wire rvx_signal_23;
wire rvx_signal_34;

wire [`RVX_GDEF_423-1:0] paddr_offset = rvx_port_09;
wire [`RVX_GDEF_423-1:0] rvx_signal_24;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
wire [`RVX_GDEF_281-1:0] rvx_signal_30;
wire [`RVX_GDEF_281-1:0] addr_unused = 0;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_11;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_22;
wire rvx_signal_18;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_27;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_21;
reg [32-1:0] rvx_signal_17;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_33;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_14;
wire rvx_signal_12;
reg [32-1:0] rvx_signal_28;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_13;
reg rvx_signal_01;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_16;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_20;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_25;
wire rvx_signal_10;

assign rvx_signal_03 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_17);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_09);
assign {rvx_signal_19,rvx_signal_30} = paddr_offset;
assign rvx_signal_24 = {rvx_signal_19,addr_unused};
assign rvx_signal_34 = (rvx_signal_30==0);
assign rvx_signal_15 = rvx_port_19 & rvx_port_07 & rvx_signal_34 & (~rvx_port_11);
assign rvx_signal_23 = rvx_port_19 & rvx_port_07 & rvx_signal_34 & rvx_port_11;

assign rvx_signal_22 = $unsigned(rvx_port_17);
assign rvx_signal_06 = $unsigned(rvx_port_17);
assign rvx_signal_14 = $unsigned(rvx_port_17);
assign rvx_signal_05 = $unsigned(rvx_port_17);
assign rvx_signal_25 = $unsigned(rvx_port_17);

always@(*)
begin
	rvx_port_02 = 0;
	rvx_signal_09 = 0;
	rvx_port_04 = 1;

	rvx_signal_02 = 0;
	rvx_signal_04 = 0;

	rvx_signal_08 = 0;
	rvx_signal_29 = 0;

	rvx_signal_32 = 0;
	rvx_signal_31 = 0;

	rvx_signal_07 = 0;
	rvx_signal_01 = 0;

	rvx_signal_00 = 0;
	rvx_signal_36 = 0;

	if(rvx_port_19==1'b 1)
	begin
		case(rvx_signal_24)
			`RVX_GDEF_254:
			begin
				rvx_signal_02 = rvx_signal_15;
				rvx_signal_04 = rvx_signal_23;
				rvx_signal_09 = $unsigned(rvx_signal_11);
				rvx_port_04 = rvx_signal_18;
			end
			`RVX_GDEF_129:
			begin
				rvx_signal_08 = rvx_signal_15;
				rvx_signal_29 = rvx_signal_23;
				rvx_signal_09 = $unsigned(rvx_signal_27);
				rvx_port_04 = rvx_signal_21;
			end
			`RVX_GDEF_327:
			begin
				rvx_signal_32 = rvx_signal_15;
				rvx_signal_31 = rvx_signal_23;
				rvx_signal_09 = $unsigned(rvx_signal_33);
				rvx_port_04 = rvx_signal_12;
			end
			`RVX_GDEF_252:
			begin
				rvx_signal_07 = rvx_signal_15;
				rvx_signal_01 = rvx_signal_23;
				rvx_signal_09 = $unsigned(rvx_signal_13);
				rvx_port_04 = rvx_signal_16;
			end
			`RVX_GDEF_424:
			begin
				rvx_signal_00 = rvx_signal_15;
				rvx_signal_36 = rvx_signal_23;
				rvx_signal_09 = $unsigned(rvx_signal_20);
				rvx_port_04 = rvx_signal_10;
			end
			default:
				rvx_port_02 = 1;
		endcase
	end
end

always@(posedge rvx_port_20, negedge rvx_port_13)
begin
	if(rvx_port_13==0)
		rvx_signal_17 <= `RVX_GDEF_574;
	else if (rvx_signal_29==1'b 1)
		rvx_signal_17 <= rvx_signal_06;
end
assign rvx_signal_27 = rvx_signal_17;
always@(posedge rvx_port_20, negedge rvx_port_13)
begin
	if(rvx_port_13==0)
		rvx_signal_28 <= `RVX_GDEF_381;
	else if (rvx_signal_31==1'b 1)
		rvx_signal_28 <= rvx_signal_14;
end
assign rvx_signal_33 = rvx_signal_28;
assign rvx_port_15 = rvx_signal_02;
assign rvx_signal_11 = rvx_port_16;
assign rvx_port_03 = rvx_signal_04;
assign rvx_port_18 = rvx_signal_22;
assign rvx_signal_18 = 1;
assign rvx_port_06 = rvx_signal_17;
assign rvx_signal_21 = 1;
assign rvx_port_01 = rvx_signal_28;
assign rvx_signal_12 = 1;
assign rvx_port_14 = rvx_signal_07;
assign rvx_signal_13 = rvx_port_05;
assign rvx_signal_16 = 1;
assign rvx_port_10 = rvx_signal_00;
assign rvx_signal_20 = rvx_port_08;
assign rvx_signal_10 = 1;

endmodule
