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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_10.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_08.vh"
`include "munoc_include_06.vh"




module MUNOC_MODULE_36
(
	munoc_port_21,
	munoc_port_14,

	munoc_port_03,
	munoc_port_27,
	munoc_port_18,

	munoc_port_24,
	munoc_port_05,
	munoc_port_23,

	munoc_port_00,
	munoc_port_20,
	munoc_port_22,

	munoc_port_28,
	munoc_port_17,

	munoc_port_08,
	munoc_port_13,
	munoc_port_01,
	munoc_port_19,

	munoc_port_16,
	munoc_port_25,
	munoc_port_06,
	munoc_port_09,

	munoc_port_12,
	munoc_port_04,
	munoc_port_10,
	munoc_port_11,
	munoc_port_02,
	munoc_port_15,
	
	munoc_port_26,
	munoc_port_07
);




parameter MUNOC_GPARA_3 = -1;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_4 = 1;

input wire munoc_port_21, munoc_port_14;

input wire munoc_port_03;
input wire munoc_port_27;
input wire munoc_port_18;

input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_24;
input wire [MUNOC_GPARA_4-1:0] munoc_port_05;
input wire [`BW_AXI_BRESP-1:0] munoc_port_23;

input wire munoc_port_00;
input wire [`BW_AXI_RRESP-1:0] munoc_port_20;
input wire [MUNOC_GPARA_2-1:0] munoc_port_22;

output wire munoc_port_28;
output wire munoc_port_17;

output wire [MUNOC_GPARA_4-1:0] munoc_port_08;
output wire munoc_port_13;
output wire [MUNOC_GPARA_4-1:0] munoc_port_01;
output wire munoc_port_19;

output wire [MUNOC_GPARA_4-1:0] munoc_port_16;
output wire [`BW_AXI_BRESP-1:0] munoc_port_25;
output wire munoc_port_06;
input wire munoc_port_09;

output reg [MUNOC_GPARA_4-1:0] munoc_port_12;
output wire [MUNOC_GPARA_2-1:0] munoc_port_04;
output wire [`BW_AXI_RRESP-1:0] munoc_port_10;
output wire munoc_port_11;
output wire munoc_port_02;
input wire munoc_port_15;

output reg [`MUNOC_GDEF_59-1:0] munoc_port_26;
`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
output reg munoc_port_07;
`else
output wire munoc_port_07;
`endif

genvar i;
integer j;

`define MUNOC_LDEF_2 0
`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_0 2

wire munoc_signal_1;
wire munoc_signal_0;
wire munoc_signal_2;
wire munoc_signal_4;
wire munoc_signal_3;

always@(posedge munoc_port_21, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		munoc_port_26 <= `MUNOC_LDEF_2;
	else
		case(munoc_port_26)
			`MUNOC_LDEF_2:
				if(munoc_signal_0)
					munoc_port_26 <= `MUNOC_LDEF_0;
				else if(munoc_port_27)
					munoc_port_26 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_4)
					munoc_port_26 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_0:
				munoc_port_26 <= `MUNOC_LDEF_2;
		endcase
end

assign munoc_signal_3 = (munoc_port_26==`MUNOC_LDEF_2) & munoc_port_27;
assign munoc_signal_1 = munoc_port_03 | munoc_port_27;
assign munoc_signal_0 = munoc_port_09 & munoc_port_06;
assign munoc_signal_2 = munoc_port_15 & munoc_port_02;
assign munoc_signal_4 = munoc_signal_2 & munoc_port_11;

assign munoc_port_28 = munoc_signal_0 | munoc_signal_3;
assign munoc_port_17 = munoc_signal_2;

assign munoc_port_08 = munoc_port_05;
assign munoc_port_13 = munoc_signal_3;
assign munoc_port_01 = munoc_port_05;
assign munoc_port_19 = munoc_signal_0;

assign munoc_port_16 = munoc_port_05;
assign munoc_port_25 = munoc_port_23;
assign munoc_port_06 = (munoc_port_26==`MUNOC_LDEF_2) & munoc_port_03;

always@(posedge munoc_port_21, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		munoc_port_12 <= 0;
	else if(munoc_signal_3)
		munoc_port_12 <= munoc_port_05;
end
assign munoc_port_04 = munoc_port_22;
assign munoc_port_10 = munoc_port_20;
assign munoc_port_11 = munoc_port_00 & munoc_port_18;
assign munoc_port_02 = (munoc_port_26==`MUNOC_LDEF_1) & munoc_port_18;

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(posedge munoc_port_21, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		munoc_port_07 <= 0;
	else if((munoc_port_26==`MUNOC_LDEF_2) && munoc_signal_1)
		if(munoc_port_24!=MUNOC_GPARA_3)
			munoc_port_07 <= 1;
end
`else
	assign munoc_port_07 = 0;
`endif

`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
endmodule
