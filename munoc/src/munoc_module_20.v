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
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"
`include "munoc_arbitration_type.vh"





module MUNOC_MODULE_20
(
	munoc_port_4,
	munoc_port_7,
	munoc_port_3,
	munoc_port_1,
	munoc_port_0,
	munoc_port_2,
	munoc_port_5,
	munoc_port_6
);





parameter MUNOC_GPARA_0 = `NOT_SELECTED; 
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_2 = 1;
parameter MUNOC_GPARA_3 = `QOS_ARBITRATION;

localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_0==`FORWARD_NETWORK)? `BW_FNI_LINK(MUNOC_GPARA_1) : `BW_BNI_LINK(MUNOC_GPARA_1);

input wire munoc_port_4, munoc_port_7;
input wire [MUNOC_LPARA_0*MUNOC_GPARA_2-1:0] munoc_port_3;
input wire [MUNOC_GPARA_2-1:0] munoc_port_1;
input wire munoc_port_0;
output wire [MUNOC_GPARA_2-1:0] munoc_port_2;
output wire [MUNOC_GPARA_2-1:0] munoc_port_5;
output wire munoc_port_6;

genvar i;
integer j;

wire [MUNOC_LPARA_0-1:0] munoc_signal_06[MUNOC_GPARA_2-1:0];
wire [MUNOC_GPARA_2-1:0] munoc_signal_15;
wire [MUNOC_GPARA_2-1:0] munoc_signal_16;

reg [MUNOC_GPARA_2-1:0] munoc_signal_07;
reg [MUNOC_GPARA_2-1:0] munoc_signal_09;
reg [MUNOC_GPARA_2-1:0] munoc_signal_13;
reg munoc_signal_08;

`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_0 1

reg munoc_signal_02;
wire munoc_signal_10;
wire munoc_signal_00;
wire munoc_signal_17;

wire munoc_signal_04;
wire munoc_signal_03;

wire [MUNOC_GPARA_2-1:0] munoc_signal_14;
wire [MUNOC_GPARA_2-1:0] munoc_signal_05;

wire [MUNOC_GPARA_2-1:0] munoc_signal_12;
wire [MUNOC_GPARA_2-1:0] munoc_signal_01;
wire munoc_signal_11;

generate
for(i=0;i<MUNOC_GPARA_2;i=i+1)
begin : i_input_separation
	assign munoc_signal_06[i] = munoc_port_3[MUNOC_LPARA_0*(i+1)-1-:MUNOC_LPARA_0];
	assign munoc_signal_15[i] = munoc_signal_06[i][MUNOC_LPARA_0-1]&munoc_port_1[i];
	assign munoc_signal_16[i] = munoc_signal_06[i][MUNOC_LPARA_0-1-1];
end
endgenerate

always@(posedge munoc_port_4, negedge munoc_port_7)
begin
	if(munoc_port_7==0)
		munoc_signal_07 <= 1;
	else if(munoc_signal_08)
		munoc_signal_07 <= munoc_signal_13;
end

assign munoc_signal_10 = ((munoc_signal_15 & munoc_signal_07)!=0);
assign munoc_signal_00 = ((munoc_signal_16 & munoc_signal_07)!=0);
assign munoc_signal_04 = munoc_port_6 & munoc_port_0;
assign munoc_signal_03 = munoc_signal_04 & munoc_signal_00;

generate
for(i=0;i<MUNOC_GPARA_2;i=i+1)
begin : i_ready_request
	assign munoc_port_2[i] = munoc_signal_07[i];
	assign munoc_port_5[i] = munoc_signal_07[i] & munoc_signal_15[i] & munoc_port_0;
end
endgenerate
assign munoc_port_6 = munoc_signal_10;

always@(posedge munoc_port_4, negedge munoc_port_7)
begin
	if(munoc_port_7==0)
		munoc_signal_02 <= `MUNOC_LDEF_1;
	else if(munoc_signal_04)
		case(munoc_signal_02)
			`MUNOC_LDEF_1:
				if(~munoc_signal_00)
					munoc_signal_02 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_00)
					munoc_signal_02 <= `MUNOC_LDEF_1;
		endcase
end

always@(*)
begin
	munoc_signal_08 = 0;
	if(munoc_signal_17)
		case(munoc_signal_02)
			`MUNOC_LDEF_1:
				if(!munoc_signal_10)
					munoc_signal_08 = 1;
				else if(munoc_signal_03)
					munoc_signal_08 = 1;
			`MUNOC_LDEF_0:
				if(munoc_signal_03)
					munoc_signal_08 = 1;
		endcase
end

assign munoc_signal_14 = munoc_signal_15 & (~munoc_signal_07);
assign munoc_signal_17 = (munoc_signal_14!=0);

RVX_MODULE_040
#(
	.RVX_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.rvx_port_0(munoc_signal_14),
	.rvx_port_1(munoc_signal_05)
);

assign munoc_signal_12 = munoc_signal_15 & (~munoc_signal_07) & (~munoc_signal_09);
assign munoc_signal_11 = (munoc_signal_12!=0);

always@(posedge munoc_port_4, negedge munoc_port_7)
begin
	if(munoc_port_7==0)
		munoc_signal_09 <= 0;
	else if(munoc_signal_03)
	begin
		if(munoc_signal_11)
			munoc_signal_09 <= munoc_signal_09 | munoc_signal_07;
		else
			munoc_signal_09 <= 0;
	end
end

RVX_MODULE_040
#(
	.RVX_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_1
(
	.rvx_port_0(munoc_signal_12),
	.rvx_port_1(munoc_signal_01)
);

always@(*)
begin
	munoc_signal_13 = munoc_signal_07;
	case(MUNOC_GPARA_3)
		`LAZY_SCALABLE_ARBITRATION:
			for(j=0;j<MUNOC_GPARA_2;j=j+1)
				if(j==0)
					munoc_signal_13[0] = munoc_signal_07[MUNOC_GPARA_2-1];
				else
					munoc_signal_13[j] = munoc_signal_07[j-1];
		`PRIORITIZED_ARBITRATION:
			munoc_signal_13 = munoc_signal_05;
		`QOS_ARBITRATION:
			if(munoc_signal_11)
				munoc_signal_13 = munoc_signal_01;
			else
				munoc_signal_13 = munoc_signal_05;
	endcase
end

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
endmodule
