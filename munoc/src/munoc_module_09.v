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
`include "munoc_network_link.vh"
`include "munoc_include_03.vh"




module MUNOC_MODULE_09
(
	munoc_port_18,
	munoc_port_19,

	munoc_port_04,
	munoc_port_06,
	munoc_port_10,

	munoc_port_09,
	munoc_port_16,
	munoc_port_12,	
	munoc_port_17,
	munoc_port_15,
	munoc_port_00,

	munoc_port_01,
	munoc_port_13,
	munoc_port_05,
	munoc_port_11,

	munoc_port_07,
	munoc_port_02,
	munoc_port_14,
	munoc_port_03,
	munoc_port_08
);




parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_0 = `BW_LONGEST_MASTER_DATA;

input wire munoc_port_18, munoc_port_19;

input wire [`BW_FNI_LINK(MUNOC_GPARA_1)-1:0] munoc_port_04;
output reg munoc_port_06;
input wire munoc_port_10;

input wire munoc_port_09;
output wire munoc_port_16;
output wire munoc_port_12;
input wire munoc_port_17;
output wire munoc_port_15;
output wire munoc_port_00;

input wire [`MUNOC_GDEF_65(MUNOC_GPARA_2,MUNOC_GPARA_1)-1:0] munoc_port_01;
output wire [`MUNOC_GDEF_65(MUNOC_GPARA_2,MUNOC_GPARA_1)-1:0] munoc_port_13;
input wire [`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)-1:0] munoc_port_05;
output wire [`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)-1:0] munoc_port_11;

input wire [`MUNOC_GDEF_77-1:0] munoc_port_07;
output wire munoc_port_02;
output reg munoc_port_14;
input wire munoc_port_03;
input wire munoc_port_08;

integer j;

wire munoc_signal_04;
wire munoc_signal_03;
wire munoc_signal_06;
wire [MUNOC_GPARA_1-1:0] munoc_signal_00;

`define MUNOC_LDEF_2 1
`define MUNOC_LDEF_0 0
`define MUNOC_LDEF_1 1

reg [`MUNOC_LDEF_2-1:0] munoc_signal_02;
wire munoc_signal_09;
wire munoc_signal_05;
wire munoc_signal_08;

reg [`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1:0] munoc_signal_01;
reg [`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1:0] munoc_signal_07;

assign {munoc_signal_04,munoc_signal_03,munoc_signal_06,munoc_signal_00} = munoc_port_04;

always@(posedge munoc_port_18, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_02 <= `MUNOC_LDEF_0;
	else if(munoc_signal_09)
		case(munoc_signal_02)
			`MUNOC_LDEF_0:
				if(munoc_signal_06&&(!munoc_signal_03))
					munoc_signal_02 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_03)
					munoc_signal_02 <= `MUNOC_LDEF_0;
		endcase
end

always@(*)
begin
	munoc_port_06 = 0;
	if(munoc_port_10)
		munoc_port_06 = 1;
	else
		case(munoc_signal_02)
			`MUNOC_LDEF_0:
				if(munoc_port_09)
					munoc_port_06 = 1;
				`MUNOC_LDEF_1:
					if(munoc_port_17)
						munoc_port_06 = 1;
		endcase
end

assign munoc_signal_09 = munoc_port_06 & munoc_signal_04;

assign munoc_signal_05 = munoc_signal_09 & (munoc_signal_02==`MUNOC_LDEF_0);
assign munoc_port_16 = munoc_signal_05;
assign munoc_port_12 = munoc_signal_05 & munoc_signal_06;

assign munoc_signal_08 = munoc_signal_09 & (munoc_signal_02==`MUNOC_LDEF_1);
assign munoc_port_15 = munoc_signal_08;
assign munoc_port_00 = munoc_signal_08 & munoc_signal_06;

assign munoc_port_02 = munoc_port_01[0];
assign munoc_port_13 = (munoc_port_03==1)? `ALL_ONE : 0;

always@(*)
begin
	munoc_signal_01 = 0;
	munoc_signal_01[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)] = munoc_port_05;
end

always@(*)
begin
	munoc_port_14 = 0;
	if(munoc_port_02)
		case(munoc_port_07)
			`MUNOC_GDEF_74:
				munoc_port_14 = munoc_signal_01[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-(`MUNOC_GDEF_47(32,MUNOC_GPARA_1)-1)];
			`MUNOC_GDEF_03:
				munoc_port_14 = munoc_signal_01[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-(`MUNOC_GDEF_47(64,MUNOC_GPARA_1)-1)];
			`MUNOC_GDEF_38:
				munoc_port_14 = munoc_signal_01[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-(`MUNOC_GDEF_47(128,MUNOC_GPARA_1)-1)];
			`MUNOC_GDEF_33:
				munoc_port_14 = munoc_signal_01[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-(`MUNOC_GDEF_47(256,MUNOC_GPARA_1)-1)];
			`MUNOC_GDEF_85:
				munoc_port_14 = munoc_signal_01[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-(`MUNOC_GDEF_47(512,MUNOC_GPARA_1)-1)];
		endcase
end

always@(*)
begin
	munoc_signal_07 = 0;
	if(munoc_port_08)
		case(munoc_port_07)
			`MUNOC_GDEF_74:
				for(j=0;j<`MUNOC_GDEF_47(32,MUNOC_GPARA_1); j=j+1)
					munoc_signal_07[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-j] = 1;
				`MUNOC_GDEF_03:
					for(j=0;j<`MUNOC_GDEF_47(64,MUNOC_GPARA_1); j=j+1)
						munoc_signal_07[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-j] = 1;
					`MUNOC_GDEF_38:
						for(j=0;j<`MUNOC_GDEF_47(128,MUNOC_GPARA_1); j=j+1)
							munoc_signal_07[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-j] = 1;
					`MUNOC_GDEF_33:
						for(j=0;j<`MUNOC_GDEF_47(256,MUNOC_GPARA_1); j=j+1)
							munoc_signal_07[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-j] = 1;
					`MUNOC_GDEF_85:
						for(j=0;j<`MUNOC_GDEF_47(512,MUNOC_GPARA_1); j=j+1)
							munoc_signal_07[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-j] = 1;
		endcase
end

assign munoc_port_11 = munoc_signal_07[`MUNOC_GDEF_47(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)];

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
endmodule
