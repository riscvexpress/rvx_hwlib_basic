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
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "rvx_include_23.vh"





module RVX_MODULE_096
(
	rvx_port_02,
	rvx_port_04,
	rvx_port_03,
	rvx_port_05,
	rvx_port_07,
	rvx_port_09,

	rvx_port_08,
	rvx_port_00,
	rvx_port_01,
	rvx_port_06
);





parameter RVX_GPARA_3 = -1;
parameter RVX_GPARA_2 = 4;
localparam  RVX_LPARA_0 = `RVX_GDEF_529 + RVX_GPARA_2;
parameter RVX_GPARA_4 = RVX_LPARA_0+1;

parameter RVX_GPARA_1 = 4;
parameter RVX_GPARA_0 = RVX_GPARA_2 - RVX_GPARA_1;
parameter RVX_GPARA_5 = RVX_GPARA_2;

input wire rvx_port_02, rvx_port_04;

input wire [RVX_GPARA_4-1:0] rvx_port_03;
output wire rvx_port_05;
output wire [RVX_GPARA_4-1:0] rvx_port_07;
input wire rvx_port_09;

output wire rvx_port_08;
output wire [RVX_GPARA_0-1:0] rvx_port_00;
input wire rvx_port_01;
input wire [RVX_GPARA_5-1:0] rvx_port_06;

wire rvx_signal_12;
wire rvx_signal_02;
wire [RVX_LPARA_0-1:0] rvx_signal_10;
wire rvx_signal_16;

wire rvx_signal_03;
wire [RVX_LPARA_0-1:0] rvx_signal_07;
wire rvx_signal_06;

wire [`RVX_GDEF_529-1:0] rvx_signal_13;
wire [RVX_GPARA_2-1:0] rvx_signal_15;
wire [RVX_GPARA_1-1:0] rvx_signal_04;

reg [`RVX_GDEF_529-1:0] rvx_signal_11;
reg [RVX_GPARA_2-1:0] rvx_signal_08;

`define RVX_LDEF_3 2
`define RVX_LDEF_2 0
`define RVX_LDEF_1 1
`define RVX_LDEF_4 2
`define RVX_LDEF_0 3

reg [`RVX_LDEF_3-1:0] rvx_signal_14;
wire rvx_signal_05;
wire rvx_signal_01;
wire rvx_signal_00;
wire rvx_signal_09;

RVX_MODULE_092
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_4)
)
i_rvx_instance_0
(
	.rvx_port_5(rvx_port_02),
	.rvx_port_0(rvx_port_04),
	.rvx_port_4(rvx_signal_12),
	.rvx_port_3(rvx_signal_10),
	.rvx_port_1(rvx_signal_16),
	.rvx_port_6(rvx_port_03),
	.rvx_port_2(rvx_port_05)
);

RVX_MODULE_105
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_4)
)
i_rvx_instance_1
(
	.rvx_port_4(rvx_port_02),
	.rvx_port_1(rvx_port_04),
	.rvx_port_6(rvx_signal_03),
	.rvx_port_3(rvx_signal_07),
	.rvx_port_2(rvx_signal_06),
	.rvx_port_5(rvx_port_07),
	.rvx_port_0(rvx_port_09)
);

assign {rvx_signal_13,rvx_signal_15} = rvx_signal_10;
assign {rvx_signal_04,rvx_port_00} = $unsigned(rvx_signal_15);

always@(posedge rvx_port_02, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_14 <= `RVX_LDEF_2;
	else
		case(rvx_signal_14)
			`RVX_LDEF_2:
				if(rvx_signal_05)
					rvx_signal_14 <= `RVX_LDEF_1;
				else if(rvx_signal_01)
					rvx_signal_14 <= `RVX_LDEF_0;
			`RVX_LDEF_1:
				rvx_signal_14 <= `RVX_LDEF_4;
			`RVX_LDEF_4:
				if(rvx_signal_00)
					rvx_signal_14 <= `RVX_LDEF_0;
			`RVX_LDEF_0:
				if(rvx_signal_09)
					rvx_signal_14 <= `RVX_LDEF_2;
		endcase
end

assign rvx_signal_16 = (rvx_signal_14==`RVX_LDEF_2);
assign rvx_signal_02 = rvx_signal_12 & rvx_signal_16; 
assign rvx_signal_05 = rvx_signal_02 & (rvx_signal_13==`RVX_GDEF_021) & ($unsigned(rvx_signal_04)==RVX_GPARA_3);
assign rvx_signal_00 = (rvx_signal_14==`RVX_LDEF_4) & rvx_port_01;
assign rvx_signal_01 = rvx_signal_02 & (~rvx_signal_05);

assign rvx_port_08 = (rvx_signal_14==`RVX_LDEF_1) | (rvx_signal_14==`RVX_LDEF_4);

always@(posedge rvx_port_02, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		 {rvx_signal_11,rvx_signal_08} <= 0;
	else if(rvx_signal_01)
		 {rvx_signal_11,rvx_signal_08} <= {rvx_signal_13,rvx_signal_15};
	else if(rvx_signal_00)
	begin
		rvx_signal_11 <= `RVX_GDEF_192;
		rvx_signal_08 <= $unsigned(rvx_port_06);
	end
end

assign rvx_signal_07 = {rvx_signal_11,rvx_signal_08};

assign rvx_signal_03 = (rvx_signal_14==`RVX_LDEF_0);
assign rvx_signal_09 = (rvx_signal_14==`RVX_LDEF_0) & rvx_signal_06;

`undef RVX_LDEF_4
`undef RVX_LDEF_2
`undef RVX_LDEF_0
`undef RVX_LDEF_3
`undef RVX_LDEF_1
endmodule

