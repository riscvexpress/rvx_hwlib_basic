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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"




module MUNOC_MODULE_17
(
	munoc_port_18,
	munoc_port_05,

	munoc_port_10,
	munoc_port_08,
	munoc_port_00,

	munoc_port_19,
	munoc_port_07,
	munoc_port_16,	
	munoc_port_14,
	munoc_port_17,
	munoc_port_15,

	munoc_port_13,
	munoc_port_03,
	munoc_port_09,
	munoc_port_01,

	munoc_port_06,
	munoc_port_11,
	munoc_port_12,
	munoc_port_04,
	munoc_port_02
);




parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_0 = `BW_LONGEST_MASTER_DATA;

input wire munoc_port_18, munoc_port_05;

input wire [`BW_FNI_LINK(MUNOC_GPARA_2)-1:0] munoc_port_10;
output reg munoc_port_08;
input wire munoc_port_00;

input wire munoc_port_19;
output wire munoc_port_07;
output wire munoc_port_16;
input wire munoc_port_14;
output wire munoc_port_17;
output wire munoc_port_15;

input wire [`MUNOC_GDEF_41(MUNOC_GPARA_1,MUNOC_GPARA_2)-1:0] munoc_port_13;
output wire [`MUNOC_GDEF_41(MUNOC_GPARA_1,MUNOC_GPARA_2)-1:0] munoc_port_03;
input wire [`MUNOC_GDEF_31(MUNOC_GPARA_0,MUNOC_GPARA_2)-1:0] munoc_port_09;
output wire [`MUNOC_GDEF_31(MUNOC_GPARA_0,MUNOC_GPARA_2)-1:0] munoc_port_01;

input wire [`MUNOC_GDEF_22-1:0] munoc_port_06;
output wire munoc_port_11;
output reg munoc_port_12;
input wire munoc_port_04;
input wire munoc_port_02;

integer j;

wire munoc_signal_04;
wire munoc_signal_02;
wire munoc_signal_07;
wire [MUNOC_GPARA_2-1:0] munoc_signal_00;

`define MUNOC_LDEF_0 1
`define MUNOC_LDEF_2 0
`define MUNOC_LDEF_1 1

reg [`MUNOC_LDEF_0-1:0] munoc_signal_06;
wire munoc_signal_08;
wire munoc_signal_01;
wire munoc_signal_03;

reg [`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1:0] munoc_signal_05;
reg [`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1:0] munoc_signal_09;

assign {munoc_signal_04,munoc_signal_02,munoc_signal_07,munoc_signal_00} = munoc_port_10;

always@(posedge munoc_port_18, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_06 <= `MUNOC_LDEF_2;
	else if(munoc_signal_08)
		case(munoc_signal_06)
			`MUNOC_LDEF_2:
				if(munoc_signal_07&&(!munoc_signal_02))
					munoc_signal_06 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_02)
					munoc_signal_06 <= `MUNOC_LDEF_2;
		endcase
end

always@(*)
begin
	munoc_port_08 = 0;
	if(munoc_port_00)
		munoc_port_08 = 1;
	else
		case(munoc_signal_06)
			`MUNOC_LDEF_2:
				if(munoc_port_19)
					munoc_port_08 = 1;
				`MUNOC_LDEF_1:
					if(munoc_port_14)
						munoc_port_08 = 1;
		endcase
end

assign munoc_signal_08 = munoc_port_08 & munoc_signal_04;

assign munoc_signal_01 = munoc_signal_08 & (munoc_signal_06==`MUNOC_LDEF_2);
assign munoc_port_07 = munoc_signal_01;
assign munoc_port_16 = munoc_signal_01 & munoc_signal_07;

assign munoc_signal_03 = munoc_signal_08 & (munoc_signal_06==`MUNOC_LDEF_1);
assign munoc_port_17 = munoc_signal_03;
assign munoc_port_15 = munoc_signal_03 & munoc_signal_07;

assign munoc_port_11 = munoc_port_13[0];
assign munoc_port_03 = (munoc_port_04==1)? `ALL_ONE : 0;

always@(*)
begin
	munoc_signal_05 = 0;
	munoc_signal_05[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-:`MUNOC_GDEF_31(MUNOC_GPARA_0,MUNOC_GPARA_2)] = munoc_port_09;
end

always@(*)
begin
	munoc_port_12 = 0;
	if(munoc_port_11)
		case(munoc_port_06)
			`MUNOC_GDEF_80:
				munoc_port_12 = munoc_signal_05[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-(`MUNOC_GDEF_31(32,MUNOC_GPARA_2)-1)];
			`MUNOC_GDEF_14:
				munoc_port_12 = munoc_signal_05[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-(`MUNOC_GDEF_31(64,MUNOC_GPARA_2)-1)];
			`MUNOC_GDEF_24:
				munoc_port_12 = munoc_signal_05[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-(`MUNOC_GDEF_31(128,MUNOC_GPARA_2)-1)];
		endcase
end

always@(*)
begin
	munoc_signal_09 = 0;
	if(munoc_port_02)
		case(munoc_port_06)
			`MUNOC_GDEF_80:
				for(j=0;j<`MUNOC_GDEF_31(32,MUNOC_GPARA_2); j=j+1)
					munoc_signal_09[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-j] = 1;
				`MUNOC_GDEF_14:
					for(j=0;j<`MUNOC_GDEF_31(64,MUNOC_GPARA_2); j=j+1)
						munoc_signal_09[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-j] = 1;
					`MUNOC_GDEF_24:
						for(j=0;j<`MUNOC_GDEF_31(128,MUNOC_GPARA_2); j=j+1)
							munoc_signal_09[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-j] = 1;
		endcase
end

assign munoc_port_01 = munoc_signal_09[`MUNOC_GDEF_31(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1-:`MUNOC_GDEF_31(MUNOC_GPARA_0,MUNOC_GPARA_2)];

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_1
endmodule
