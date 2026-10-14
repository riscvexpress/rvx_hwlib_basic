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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "rvx_include_21.vh"





module RVX_MODULE_073
(
	rvx_port_06,
	rvx_port_00,
	rvx_port_03,
	rvx_port_07,
	rvx_port_05,
	rvx_port_09,

	rvx_port_04,
	rvx_port_08,
	rvx_port_02,
	rvx_port_01
);





parameter RVX_GPARA_5 = -1;
parameter RVX_GPARA_1 = 4;
localparam  RVX_LPARA_0 = `RVX_GDEF_551 + RVX_GPARA_1;
parameter RVX_GPARA_4 = RVX_LPARA_0+1;

parameter RVX_GPARA_0 = 4;
parameter RVX_GPARA_2 = RVX_GPARA_1 - RVX_GPARA_0;
parameter RVX_GPARA_3 = RVX_GPARA_1;

input wire rvx_port_06, rvx_port_00;

input wire [RVX_GPARA_4-1:0] rvx_port_03;
output wire rvx_port_07;
output wire [RVX_GPARA_4-1:0] rvx_port_05;
input wire rvx_port_09;

output wire rvx_port_04;
output wire [RVX_GPARA_2-1:0] rvx_port_08;
input wire rvx_port_02;
input wire [RVX_GPARA_3-1:0] rvx_port_01;

wire rvx_signal_14;
wire rvx_signal_04;
wire [RVX_LPARA_0-1:0] rvx_signal_15;
wire rvx_signal_07;

wire rvx_signal_08;
wire [RVX_LPARA_0-1:0] rvx_signal_10;
wire rvx_signal_09;

wire [`RVX_GDEF_551-1:0] rvx_signal_01;
wire [RVX_GPARA_1-1:0] rvx_signal_16;
wire [RVX_GPARA_0-1:0] rvx_signal_03;

reg [`RVX_GDEF_551-1:0] rvx_signal_00;
reg [RVX_GPARA_1-1:0] rvx_signal_11;

`define RVX_LDEF_3 2
`define RVX_LDEF_2 0
`define RVX_LDEF_1 1
`define RVX_LDEF_4 2
`define RVX_LDEF_0 3

reg [`RVX_LDEF_3-1:0] rvx_signal_02;
wire rvx_signal_06;
wire rvx_signal_05;
wire rvx_signal_12;
wire rvx_signal_13;

RVX_MODULE_123
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_4)
)
i_rvx_instance_1
(
	.rvx_port_3(rvx_port_06),
	.rvx_port_0(rvx_port_00),
	.rvx_port_5(rvx_signal_14),
	.rvx_port_6(rvx_signal_15),
	.rvx_port_1(rvx_signal_07),
	.rvx_port_4(rvx_port_03),
	.rvx_port_2(rvx_port_07)
);

RVX_MODULE_018
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_4)
)
i_rvx_instance_0
(
	.rvx_port_2(rvx_port_06),
	.rvx_port_0(rvx_port_00),
	.rvx_port_4(rvx_signal_08),
	.rvx_port_1(rvx_signal_10),
	.rvx_port_3(rvx_signal_09),
	.rvx_port_5(rvx_port_05),
	.rvx_port_6(rvx_port_09)
);

assign {rvx_signal_01,rvx_signal_16} = rvx_signal_15;
assign {rvx_signal_03,rvx_port_08} = $unsigned(rvx_signal_16);

always@(posedge rvx_port_06, negedge rvx_port_00)
begin
	if(rvx_port_00==0)
		rvx_signal_02 <= `RVX_LDEF_2;
	else
		case(rvx_signal_02)
			`RVX_LDEF_2:
				if(rvx_signal_06)
					rvx_signal_02 <= `RVX_LDEF_1;
				else if(rvx_signal_05)
					rvx_signal_02 <= `RVX_LDEF_0;
			`RVX_LDEF_1:
				rvx_signal_02 <= `RVX_LDEF_4;
			`RVX_LDEF_4:
				if(rvx_signal_12)
					rvx_signal_02 <= `RVX_LDEF_0;
			`RVX_LDEF_0:
				if(rvx_signal_13)
					rvx_signal_02 <= `RVX_LDEF_2;
		endcase
end

assign rvx_signal_07 = (rvx_signal_02==`RVX_LDEF_2);
assign rvx_signal_04 = rvx_signal_14 & rvx_signal_07; 
assign rvx_signal_06 = rvx_signal_04 & (rvx_signal_01==`RVX_GDEF_223) & ($unsigned(rvx_signal_03)==RVX_GPARA_5);
assign rvx_signal_12 = (rvx_signal_02==`RVX_LDEF_4) & rvx_port_02;
assign rvx_signal_05 = rvx_signal_04 & (~rvx_signal_06);

assign rvx_port_04 = (rvx_signal_02==`RVX_LDEF_1) | (rvx_signal_02==`RVX_LDEF_4);

always@(posedge rvx_port_06, negedge rvx_port_00)
begin
	if(rvx_port_00==0)
		 {rvx_signal_00,rvx_signal_11} <= 0;
	else if(rvx_signal_05)
		 {rvx_signal_00,rvx_signal_11} <= {rvx_signal_01,rvx_signal_16};
	else if(rvx_signal_12)
	begin
		rvx_signal_00 <= `RVX_GDEF_185;
		rvx_signal_11 <= $unsigned(rvx_port_01);
	end
end

assign rvx_signal_10 = {rvx_signal_00,rvx_signal_11};

assign rvx_signal_08 = (rvx_signal_02==`RVX_LDEF_0);
assign rvx_signal_13 = (rvx_signal_02==`RVX_LDEF_0) & rvx_signal_09;

`undef RVX_LDEF_4
`undef RVX_LDEF_2
`undef RVX_LDEF_0
`undef RVX_LDEF_3
`undef RVX_LDEF_1
endmodule

