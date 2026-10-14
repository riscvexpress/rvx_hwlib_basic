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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_06.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"




module MUNOC_MODULE_24
(
	munoc_port_14,
	munoc_port_11,

	munoc_port_15,
	munoc_port_06,
	munoc_port_09,

	munoc_port_05,
	munoc_port_12,
	munoc_port_18,	
	munoc_port_00,
	munoc_port_01,
	munoc_port_13,

	munoc_port_16,
	munoc_port_04,
	munoc_port_03,
	munoc_port_07,

	munoc_port_17,
	munoc_port_10,
	munoc_port_08,
	munoc_port_19,
	munoc_port_02
);




parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_2 = `BW_LONGEST_MASTER_DATA;

input wire munoc_port_14, munoc_port_11;

input wire [`BW_FNI_LINK(MUNOC_GPARA_0)-1:0] munoc_port_15;
output reg munoc_port_06;
input wire munoc_port_09;

input wire munoc_port_05;
output wire munoc_port_12;
output wire munoc_port_18;
input wire munoc_port_00;
output wire munoc_port_01;
output wire munoc_port_13;

input wire [`MUNOC_GDEF_59(MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0] munoc_port_16;
output wire [`MUNOC_GDEF_59(MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0] munoc_port_04;
input wire [`MUNOC_GDEF_46(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_port_03;
output wire [`MUNOC_GDEF_46(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_port_07;

input wire [`MUNOC_GDEF_60-1:0] munoc_port_17;
output wire munoc_port_10;
output reg munoc_port_08;
input wire munoc_port_19;
input wire munoc_port_02;

integer j;

wire munoc_signal_01;
wire munoc_signal_00;
wire munoc_signal_09;
wire [MUNOC_GPARA_0-1:0] munoc_signal_03;

`define MUNOC_LDEF_0 1
`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_2 1

reg [`MUNOC_LDEF_0-1:0] munoc_signal_04;
wire munoc_signal_08;
wire munoc_signal_06;
wire munoc_signal_02;

reg [`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1:0] munoc_signal_07;
reg [`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1:0] munoc_signal_05;

assign {munoc_signal_01,munoc_signal_00,munoc_signal_09,munoc_signal_03} = munoc_port_15;

always@(posedge munoc_port_14, negedge munoc_port_11)
begin
	if(munoc_port_11==0)
		munoc_signal_04 <= `MUNOC_LDEF_1;
	else if(munoc_signal_08)
		case(munoc_signal_04)
			`MUNOC_LDEF_1:
				if(munoc_signal_09&&(!munoc_signal_00))
					munoc_signal_04 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_00)
					munoc_signal_04 <= `MUNOC_LDEF_1;
		endcase
end

always@(*)
begin
	munoc_port_06 = 0;
	if(munoc_port_09)
		munoc_port_06 = 1;
	else
		case(munoc_signal_04)
			`MUNOC_LDEF_1:
				if(munoc_port_05)
					munoc_port_06 = 1;
				`MUNOC_LDEF_2:
					if(munoc_port_00)
						munoc_port_06 = 1;
		endcase
end

assign munoc_signal_08 = munoc_port_06 & munoc_signal_01;

assign munoc_signal_06 = munoc_signal_08 & (munoc_signal_04==`MUNOC_LDEF_1);
assign munoc_port_12 = munoc_signal_06;
assign munoc_port_18 = munoc_signal_06 & munoc_signal_09;

assign munoc_signal_02 = munoc_signal_08 & (munoc_signal_04==`MUNOC_LDEF_2);
assign munoc_port_01 = munoc_signal_02;
assign munoc_port_13 = munoc_signal_02 & munoc_signal_09;

assign munoc_port_10 = munoc_port_16[0];
assign munoc_port_04 = (munoc_port_19==1)? `ALL_ONE : 0;

always@(*)
begin
	munoc_signal_07 = 0;
	munoc_signal_07[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_46(MUNOC_GPARA_2,MUNOC_GPARA_0)] = munoc_port_03;
end

always@(*)
begin
	munoc_port_08 = 0;
	if(munoc_port_10)
		case(munoc_port_17)
			`MUNOC_GDEF_34:
				munoc_port_08 = munoc_signal_07[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-(`MUNOC_GDEF_46(32,MUNOC_GPARA_0)-1)];
			`MUNOC_GDEF_79:
				munoc_port_08 = munoc_signal_07[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-(`MUNOC_GDEF_46(64,MUNOC_GPARA_0)-1)];
			`MUNOC_GDEF_95:
				munoc_port_08 = munoc_signal_07[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-(`MUNOC_GDEF_46(128,MUNOC_GPARA_0)-1)];
		endcase
end

always@(*)
begin
	munoc_signal_05 = 0;
	if(munoc_port_02)
		case(munoc_port_17)
			`MUNOC_GDEF_34:
				for(j=0;j<`MUNOC_GDEF_46(32,MUNOC_GPARA_0); j=j+1)
					munoc_signal_05[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-j] = 1;
				`MUNOC_GDEF_79:
					for(j=0;j<`MUNOC_GDEF_46(64,MUNOC_GPARA_0); j=j+1)
						munoc_signal_05[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-j] = 1;
					`MUNOC_GDEF_95:
						for(j=0;j<`MUNOC_GDEF_46(128,MUNOC_GPARA_0); j=j+1)
							munoc_signal_05[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-j] = 1;
		endcase
end

assign munoc_port_07 = munoc_signal_05[`MUNOC_GDEF_46(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_46(MUNOC_GPARA_2,MUNOC_GPARA_0)];

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
endmodule
