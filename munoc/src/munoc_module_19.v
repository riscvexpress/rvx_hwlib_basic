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
// 2026-10-20
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_03.vh"
`include "munoc_include_08.vh"




module MUNOC_MODULE_19
(
	munoc_port_25,
	munoc_port_23,

	munoc_port_08,
	munoc_port_06,
	munoc_port_13,

	munoc_port_11,
	munoc_port_01,
	munoc_port_26,

	munoc_port_12,
	munoc_port_15,
	munoc_port_14,

	munoc_port_00,
	munoc_port_20,

	munoc_port_09,
	munoc_port_17,
	munoc_port_22,
	munoc_port_28,

	munoc_port_16,
	munoc_port_04,
	munoc_port_18,
	munoc_port_10,

	munoc_port_21,
	munoc_port_03,
	munoc_port_05,
	munoc_port_02,
	munoc_port_27,
	munoc_port_07,
	
	munoc_port_19,
	munoc_port_24
);




parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 1;

input wire munoc_port_25, munoc_port_23;

input wire munoc_port_08;
input wire munoc_port_06;
input wire munoc_port_13;

input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_11;
input wire [MUNOC_GPARA_1-1:0] munoc_port_01;
input wire [`BW_AXI_BRESP-1:0] munoc_port_26;

input wire munoc_port_12;
input wire [`BW_AXI_RRESP-1:0] munoc_port_15;
input wire [MUNOC_GPARA_2-1:0] munoc_port_14;

output wire munoc_port_00;
output wire munoc_port_20;

output wire [MUNOC_GPARA_1-1:0] munoc_port_09;
output wire munoc_port_17;
output wire [MUNOC_GPARA_1-1:0] munoc_port_22;
output wire munoc_port_28;

output wire [MUNOC_GPARA_1-1:0] munoc_port_16;
output wire [`BW_AXI_BRESP-1:0] munoc_port_04;
output wire munoc_port_18;
input wire munoc_port_10;

output reg [MUNOC_GPARA_1-1:0] munoc_port_21;
output wire [MUNOC_GPARA_2-1:0] munoc_port_03;
output wire [`BW_AXI_RRESP-1:0] munoc_port_05;
output wire munoc_port_02;
output wire munoc_port_27;
input wire munoc_port_07;

output reg [`MUNOC_GDEF_94-1:0] munoc_port_19;
`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
output reg munoc_port_24;
`else
output wire munoc_port_24;
`endif

genvar i;
integer j;

`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_0 1
`define MUNOC_LDEF_2 2

wire munoc_signal_2;
wire munoc_signal_0;
wire munoc_signal_3;
wire munoc_signal_4;
wire munoc_signal_1;

always@(posedge munoc_port_25, negedge munoc_port_23)
begin
	if(munoc_port_23==0)
		munoc_port_19 <= `MUNOC_LDEF_1;
	else
		case(munoc_port_19)
			`MUNOC_LDEF_1:
				if(munoc_signal_0)
					munoc_port_19 <= `MUNOC_LDEF_2;
				else if(munoc_port_06)
					munoc_port_19 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_4)
					munoc_port_19 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_2:
				munoc_port_19 <= `MUNOC_LDEF_1;
		endcase
end

assign munoc_signal_1 = (munoc_port_19==`MUNOC_LDEF_1) & munoc_port_06;
assign munoc_signal_2 = munoc_port_08 | munoc_port_06;
assign munoc_signal_0 = munoc_port_10 & munoc_port_18;
assign munoc_signal_3 = munoc_port_07 & munoc_port_27;
assign munoc_signal_4 = munoc_signal_3 & munoc_port_02;

assign munoc_port_00 = munoc_signal_0 | munoc_signal_1;
assign munoc_port_20 = munoc_signal_3;

assign munoc_port_09 = munoc_port_01;
assign munoc_port_17 = munoc_signal_1;
assign munoc_port_22 = munoc_port_01;
assign munoc_port_28 = munoc_signal_0;

assign munoc_port_16 = munoc_port_01;
assign munoc_port_04 = munoc_port_26;
assign munoc_port_18 = (munoc_port_19==`MUNOC_LDEF_1) & munoc_port_08;

always@(posedge munoc_port_25, negedge munoc_port_23)
begin
	if(munoc_port_23==0)
		munoc_port_21 <= 0;
	else if(munoc_signal_1)
		munoc_port_21 <= munoc_port_01;
end
assign munoc_port_03 = munoc_port_14;
assign munoc_port_05 = munoc_port_15;
assign munoc_port_02 = munoc_port_12 & munoc_port_13;
assign munoc_port_27 = (munoc_port_19==`MUNOC_LDEF_0) & munoc_port_13;

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(posedge munoc_port_25, negedge munoc_port_23)
begin
	if(munoc_port_23==0)
		munoc_port_24 <= 0;
	else if((munoc_port_19==`MUNOC_LDEF_1) && munoc_signal_2)
		if(munoc_port_11!=MUNOC_GPARA_0)
			munoc_port_24 <= 1;
end
`else
	assign munoc_port_24 = 0;
`endif

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
endmodule
