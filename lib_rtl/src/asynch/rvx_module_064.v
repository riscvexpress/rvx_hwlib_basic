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
`include "rvx_include_15.vh"





module RVX_MODULE_064
(
	rvx_port_08,
	rvx_port_07,
	rvx_port_04,
	rvx_port_02,
	rvx_port_01,
	rvx_port_06,
	rvx_port_00,
	rvx_port_05,
	rvx_port_03,
	rvx_port_09,
	rvx_port_10
);





parameter RVX_GPARA_4 = 4;
localparam  RVX_LPARA_0 = `RVX_GDEF_175 + RVX_GPARA_4;
parameter RVX_GPARA_1 = RVX_LPARA_0+1;

parameter RVX_GPARA_3 = 4;
parameter RVX_GPARA_0 = RVX_GPARA_4 - RVX_GPARA_3;
parameter RVX_GPARA_2 = RVX_GPARA_4;

input wire rvx_port_08, rvx_port_07;

input wire rvx_port_04;
input wire [RVX_GPARA_3-1:0] rvx_port_02;
input wire [RVX_GPARA_0-1:0] rvx_port_01;
output wire rvx_port_06;
output wire [RVX_GPARA_2-1:0] rvx_port_00;

output wire [RVX_GPARA_1-1:0] rvx_port_05;
input wire rvx_port_03;
input wire [RVX_GPARA_1-1:0] rvx_port_09;
output wire rvx_port_10;

wire rvx_signal_05;
wire [RVX_LPARA_0-1:0] rvx_signal_00;

wire rvx_signal_04;
wire [RVX_LPARA_0-1:0] rvx_signal_03;

wire [`RVX_GDEF_175-1:0] rvx_signal_08;
wire [RVX_GPARA_4-1:0] rvx_signal_09;

wire [`RVX_GDEF_175-1:0] rvx_signal_02;
wire [RVX_GPARA_4-1:0] rvx_signal_01;

`define RVX_LDEF_0 1
`define RVX_LDEF_1 0
`define RVX_LDEF_2 1

reg [`RVX_LDEF_0-1:0] rvx_signal_06;
wire rvx_signal_07;

RVX_MODULE_106
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_6(rvx_port_08),
	.rvx_port_2(rvx_port_07),
	.rvx_port_4(rvx_signal_05),
	.rvx_port_1(rvx_signal_00),
	.rvx_port_0(),
	.rvx_port_3(rvx_port_05),
	.rvx_port_5(rvx_port_03)
);

RVX_MODULE_037
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_3(rvx_port_08),
	.rvx_port_4(rvx_port_07),
	.rvx_port_6(rvx_signal_04),
	.rvx_port_1(rvx_signal_03),
	.rvx_port_2(1'b 1),
	.rvx_port_0(rvx_port_09),
	.rvx_port_5(rvx_port_10)
);

assign rvx_signal_00 = {rvx_signal_08,rvx_signal_09};
assign rvx_signal_08 = $unsigned(`RVX_GDEF_664);
assign rvx_signal_09 = $unsigned({rvx_port_02,rvx_port_01});

always@(posedge rvx_port_08, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_06 <= `RVX_LDEF_1;
	else
		case(rvx_signal_06)
			`RVX_LDEF_1:
				if(rvx_signal_07)
					rvx_signal_06 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_04)
					rvx_signal_06 <= `RVX_LDEF_1;
		endcase
end

assign rvx_signal_07 = (rvx_signal_06==`RVX_LDEF_1) & rvx_port_04;
assign rvx_signal_05 = rvx_signal_07;

assign rvx_port_06 = (rvx_signal_06==`RVX_LDEF_1);
assign {rvx_signal_02,rvx_signal_01} = rvx_signal_03;
assign rvx_port_00 = rvx_signal_01;

`undef RVX_LDEF_2
`undef RVX_LDEF_0
`undef RVX_LDEF_1
endmodule
